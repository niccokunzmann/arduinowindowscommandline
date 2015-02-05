Arduino Windows Command Line
============================


Try it
------

	set_environment_variables.bat "C:\Program Files (x86)\Arduino" "C:\Users\UserName\Documents\Arduino" uno COM15

configures the compiler and uploader.

	run.bat simple_program\simple_program.ino

compiles, uploads and shows the output of `simple_program.ino` on the Arduino.  
You will see

	Counting down from 10:
	10
	9
	8
	7
	6
	5
	4
	3
	2
	1
	0

Read more in the [try_it](./try_it) folder.

What is in it
-------------

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

It was used with [ARDUINO 1.0.6](http://arduino.cc/en/Main/Software).