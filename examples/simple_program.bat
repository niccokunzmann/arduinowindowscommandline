@echo off
rem ---------------------------------------------------------------------------
rem                     test for environment variables

if not defined ARDUINO_MCU (
  echo Call set_environment_variables.bat first to configure the arduino
  exit /b 1
)

call ..\bin\run.bat simple_program\simple_program.ino
