

rem ---------------------------------------------------------------------------
rem                     test for environment variables
if not defined ARDUINO_NAME (
  echo Call set_environment_variables.bat first to configure the arduino
  exit /b 1
)

pushd ..\bin

call run.bat ..\examples\simple_program\simple_program.pde

popd