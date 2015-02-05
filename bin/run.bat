@echo off

rem ---------------------------------------------------------------------
rem                     show the help

if "%~1" == "" (
  echo runs an Arduino sketch file on an Arduino
  echo.
  echo   run.bat EXAMPLE_FILE [SERIAL_BAUD_RATE]
  echo.
  echo     EXAMPLE_FILE
  echo         is a path to an .ino or .pde or .c or .cpp file.
  echo         This file is compiled and uploaded to the Arduino.
  echo         The output of this file is shown.
  echo         Example: ..\examples\simple_program\simple_program.ino
  echo.
  echo     SERIAL_BAUD_RATE
  echo         is the communication rate of your arduino program.
  echo         This is an optional argument.
  echo         When you write Serial.begin^(9600^) this is 9600.
  echo         Example: 9600
  echo.
  echo   Example
  echo   -------
  echo.
  echo   run.bat ..\examples\simple_program\simple_program.ino
  echo.
  echo   This example runs the simple_program.ino on the Arduino.
  echo   The file communicates with 9600 baud via Serial.
  exit /b 1
)

rem ---------------------------------------------------------------------
rem                     remove compiled files

IF EXIST ".\obj" (
    rmdir ".\obj" /s /q
)

if "%~2" == "" (
  set SERIAL_BAUD_RATE=9600
) else (
  set SERIAL_BAUD_RATE=%2
)

if errorlevel 0 (

  rem ---------------------------------------------------------------------
  rem                     compile the file

  call abuild.bat -r -c "positioning_system\examples\%1\%1.pde" 

  if errorlevel 0 (
    rem ---------------------------------------------------------------------
    rem                     upload the file
    
    rem does not work:
    rem FOR %%A IN (obj\*.hex) DO set elf_file_size=%%~zA
    rem echo Binary Sketchsize: %elf_file_size% bytes (out of a maximum of %ARDUINO_MAXIMUM_UPLOAD_SIZE% bytes)

    call aupload.bat obj/%1.hex
    if errorlevel 0 (
      if exist obj/%1.hex (
      
        rem ---------------------------------------------------------------------
        rem                     show the output

        rem http://serverfault.com/questions/432322/how-to-sleep-in-a-batch-file#432323
        rem timeout /t 5 /nobreak

        rem http://stackoverflow.com/questions/11775185/open-a-com-port-in-c-with-number-higher-that-9
        ..\serialterm\serialterm.exe \\.\%ARDUINO_COMPORT% %SERIAL_BAUD_RATE%
      )
    )
  )
)