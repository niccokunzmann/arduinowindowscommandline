@echo off
rem ---------------------------------------------------------------------------
rem                     test for environment variables

if not defined ARDUINO_MCU (
  echo Call aconfigure.bat first to configure the Arduino
  exit /b 1
)

echo Running simple_program\simple_program.ino on the arduino using 
echo ..\bin\arun.bat simple_program\simple_program.ino
call ..\bin\arun.bat simple_program\simple_program.ino
