@echo off
rem http://stackoverflow.com/a/8607291/1320237
setlocal enableDelayedExpansion
rem ---------------------------------------------------------------------------
rem                     set environment variables
rem See http://playground.arduino.cc/Code/WindowsCommandLine


if "%~4" == "" (
  @echo sets the variables necessairy for abuild.bat and aupload.bat
  @echo.
  @echo   set_environment_variables ARDUINO_PATH ARDUINO_USER_LIBRARIES ARDUINO_MODEL ARDUINO_COMPORT
  @echo.  
  @echo     ARDUINO_PATH 
  @echo         is the path where the Arduino software is installed.
  if not defined ARDUINO_PATH (
    if "%ProgramFiles(x86)%" NEQ "" (
      @echo         Example: "%ProgramFiles(x86)%\Arduino"
      @echo         Example: "%ProgramFiles%\Arduino"
    ) else (
      @echo         Example: "%ProgramFiles%\Arduino"
    )
  )
  @echo.
  @echo     ARDUINO_USER_LIBRARIES 
  @echo         is the path to the libraries folder which contains 
  @echo         user defined libraries
  @echo         Example: "%USERPROFILE%\Documents\Arduino"
  @echo.
  @echo     ARDUINO_MODEL
  @echo         is the model of the Arduino. Have a look at boards.txt
  @echo         Example: uno
  @echo         Example: nano328
  @echo. 
  @echo    ARDUINO_COMPORT
  @echo        is the port which the Arduino is connected to.
  @echo        It is the port where the output of Serial.print will go to.
  @echo        Example: COM12
  @echo        The following COM ports were detected:
  set spcp=hello
  for /F "delims=" %%i in ('EnumSer.exe') do (
    rem http://stackoverflow.com/a/8607291/1320237
    if "%%i" == "EnumPorts method reports" (
      set spcp=
    )
    if "!spcp!" == "true" (
      @echo        Detected: %%i
    )
    if "%%i" == "Device Manager (SetupAPI - Ports Device information set) reports" (
      set spcp=true
    )
  )
  @echo. 
  exit /b 1
)

rem where you installed Arduino on your computer (e.g. C:\ARDUINO-0011)
SET ARDUINO_PATH=%~1

rem The directory for user defined libraries
SET ARDUINO_USER_LIBRARIES=%~2

rem set the model of the arduino, see boards.txt
SET ARDUINO_MODEL=%~3

rem the port to which your programmer is connected (e.g. COM1, COM2, etc.)
SET ARDUINO_COMPORT=%~4

rem ---------------------------------------------------------------------
rem processing the boards.txt file found in boards_txt_directory_path
set boards_txt_directory_path=%ARDUINO_PATH%\hardware\arduino\

set ARDUINO_NAME_TOKEN=%ARDUINO_MODEL%.name
set ARDUINO_MCU_TOKEN=%ARDUINO_MODEL%.build.mcu
set ARDUINO_VARIANT_TOKEN=%ARDUINO_MODEL%.build.variant
set ARDUINO_PROGRAMMER_TOKEN=%ARDUINO_MODEL%.upload.protocol
set ARDUINO_FCPU_TOKEN=%ARDUINO_MODEL%.build.f_cpu
set ARDUINO_BURNRATE_TOKEN=%ARDUINO_MODEL%.upload.speed
set ARDUINO_MAXIMUM_UPLOAD_SIZE_TOKEN=%ARDUINO_MODEL%.upload.maximum_size

set ARDUINO_NAME=
rem maybe this could be relevant for Arduino Robot Control but it is not built into abuild.bat
rem I did not build it in because I can not test it
rem set ARDUINO_CORE_TOKEN=%ARDUINO_MODEL%.build.core

pushd "%boards_txt_directory_path%"

rem https://technet.microsoft.com/en-us/library/bb490909.aspx
for /F "eol=# tokens=1,2* delims==" %%i in (boards.txt) do (

  rem using if http://www.robvanderwoude.com/if.php
  if "%%~i"=="%ARDUINO_NAME_TOKEN%" (
    rem the name of the arduino
    set ARDUINO_NAME=%%j
  )
  
  if "%%~i"=="%ARDUINO_MCU_TOKEN%" (
    rem the name of your microcontroller (e.g., atmega168)
    rem atmega168 atmega328
    SET ARDUINO_MCU=%%j
  )
  
  if "%%~i"=="%ARDUINO_VARIANT_TOKEN%" (
    rem the variant of the arduino must be looked up in boards.txt 
    rem in %ARDUINO_PATH%\hardware\arduino\variants
    SET ARDUINO_VARIANT=%%j
  )

  if "%%~i"=="%ARDUINO_PROGRAMMER_TOKEN%" (
    rem the name of the programmer you wish to use (usually stk500)
    SET ARDUINO_PROGRAMMER=%%j
  )

  if "%%~i"=="%ARDUINO_FCPU_TOKEN%" (
    rem the clock frequency of your microcontroller (usually 16000000 for atmega168)
    SET ARDUINO_FCPU=%%j
  )

  if "%%~i"=="%ARDUINO_BURNRATE_TOKEN%" (
    rem the baud rate at which the download is to occur (19200 seems to be a good starting point)
    rem according to http://arduino.cc/en/Serial/Begin these are possible baud rates
    rem 300, 600, 1200, 2400, 4800, 9600, 14400, 19200, 28800, 38400, 57600, or 115200
    rem see baud rates here http://42bots.com/resources/arduino-program-sketch-upload-speeds/
    SET ARDUINO_BURNRATE=%%j
  )

  if "%%~i"=="%ARDUINO_MAXIMUM_UPLOAD_SIZE_TOKEN%" (
    rem the maximum sketch size
    SET ARDUINO_MAXIMUM_UPLOAD_SIZE=%%j
  )

)

popd

if not defined ARDUINO_NAME (
  echo Did not find a model %ARDUINO_MODEL%
  exit /b 1
)

echo Name: %ARDUINO_NAME%
echo Microcontroller: %ARDUINO_MCU%
echo CPU Frequency: %ARDUINO_FCPU%
echo Programmer: %ARDUINO_PROGRAMMER%
echo Variant: %ARDUINO_VARIANT%
echo Upload Rate: %ARDUINO_BURNRATE%
echo Maximum file size for upload: %ARDUINO_MAXIMUM_UPLOAD_SIZE%

