Arduino Windows Command Line
============================

The files were copied from 
http://playground.arduino.cc/Code/WindowsCommandLine
and a few adaptations were made.

 - `set_environment_variables.bat` can be used to determine most of the variables for `abuild.bat` and `aupload.bat`. 
	 - When run without arguments you get help.
 - `abuild.bat` is used to build the sketches.
	 - now requires the Arduino 1.x software with `Arduino.h` 	
	 - builds dependencies only

 - `aupload.bat` uploads a compiled `.hex` file to the Arduino 
 - `serialterm.exe` is used to view the output of the Arduino
 - `run.bat` compiles and uploads a arduino sketch and shows the output via `serialterm.exe`.