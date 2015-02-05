@echo off


set rc=1
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
  goto end
)

rem ---------------------------------------------------------------------
rem                     remove compiled files

set run_current_directory=%CD%
set run_output=%CD%\obj
set run_SketchName=%~dpf1

IF EXIST "%run_output%" (
    rmdir "%run_output%" /s /q
)

if "%~2" == "" (
  set SERIAL_BAUD_RATE=9600
) else (
  set SERIAL_BAUD_RATE=%2
)

rem ---------------------------------------------------------------------
rem                     compile the file

cd %~dp0

call abuild.bat -u -r -o "%run_output%" "%run_SketchName%"

if not %errorlevel% == 0 (
    goto end
)

rem ---------------------------------------------------------------------
rem                     show the output

rem http://serverfault.com/questions/432322/how-to-sleep-in-a-batch-file#432323
rem timeout /t 5 /nobreak

rem http://stackoverflow.com/questions/11775185/open-a-com-port-in-c-with-number-higher-that-9
serialterm.exe \\.\%ARDUINO_COMPORT% %SERIAL_BAUD_RATE%


set rc=0
:end
cd %run_current_directory%
exit /b %rc%
