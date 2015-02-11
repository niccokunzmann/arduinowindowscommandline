@echo off
rem ---------------------------------------------------------------------------
rem                     test for environment variables

if not defined ARDUINO_MCU (
  echo Call aconfigure.bat first to configure the Arduino
  exit /b 1
)

set NEW_ARDUINO_USER_LIBRARIES=%~dp0Documents\Arduino
set OLD_ARDUINO_USER_LIBRARIES=%ARDUINO_USER_LIBRARIES%
if not "%NEW_ARDUINO_USER_LIBRARIES%" == "%ARDUINO_USER_LIBRARIES%" (
  echo changing the library path %ARDUINO_USER_LIBRARIES% to %NEW_ARDUINO_USER_LIBRARIES%
  set ARDUINO_USER_LIBRARIES=%NEW_ARDUINO_USER_LIBRARIES%
)

echo Running unsing_a_library.pde on the arduino using 
echo ..\bin\arun.bat Documents\Arduino\libraries\my_silly_library\examples\using_a_library\using_a_library.pde
call ..\bin\arun.bat Documents\Arduino\libraries\my_silly_library\examples\using_a_library\using_a_library.pde
