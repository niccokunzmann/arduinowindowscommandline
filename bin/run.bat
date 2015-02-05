@echo off

rem ---------------------------------------------------------------------
rem                     show the help

if "%~1" == "" (
  echo "run.bat example_file"
  echo.
  echo example_file
  echo     a path to an example file
  echo.
  exit /b 0
)

rem ---------------------------------------------------------------------
rem                     remove compiled files

IF EXIST ".\obj" (
    rmdir ".\obj" /s /q
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
        ..\serialterm\serialterm.exe \\.\%ARDUINO_COMPORT% 9600
      )
    )
  )
)