@echo off
rem ---------------------------------------------------------------------------
rem                     test for environment variables

if not defined ARDUINO_MCU (
  echo Call set_environment_variables.bat first to configure the Arduino
  exit /b 1
)

set servo_example_path=%ARDUINO_PATH%\libraries\Servo\examples\Sweep\Sweep.ino
echo Running Sweep.ino on the arduino using 
echo ..\bin\run.bat "%servo_example_path%"
call ..\bin\run.bat "%servo_example_path%"
