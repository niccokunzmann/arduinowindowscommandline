Examples
========

This folder contains example files.
To run them you need to

1. Configure the environment once using `set_environment_variables.bat`
2. run some example files

Configuration
-------------

In my case I `set_environment_variables.bat` like this:

	set_environment_variables.bat 

It outputs a help which I use to build a command:
	
	sets the variables necessairy for abuild.bat and aupload.bat
	
	  set_environment_variables.bat ARDUINO_PATH ARDUINO_USER_LIBRARIES ARDUINO_MODEL ARDUINO_COMPORT
	
	    ARDUINO_PATH
	        is the path where the Arduino software is installed.
	        Example: "C:\Program Files (x86)\Arduino"
	        Example: "C:\Program Files\Arduino"
	
	    ARDUINO_USER_LIBRARIES
	        is the path to the libraries folder which contains
	        user defined libraries. If you put an empty directory
	        here then there will be no libraries.
	        See http://playground.arduino.cc/Main/LibraryList
	        for libraries you want to install.
	        Example: "C:\Users\cheche\Documents\Arduino"
	
	    ARDUINO_MODEL
	        is the model of the Arduino. Have a look at boards.txt
	        in the Arduino installation folder .\hardware\arduino\.
	        Example: uno
	        Example: nano328
	
	    ARDUINO_COMPORT
	        is the port which the Arduino is connected to.
	        It is the port where the output of Serial.print will go to, too.
	        Example: COM12
	        The following COM ports were detected:
	                 COM15 <Arduino Uno>
	
So I copy together the examples and COM port:

	set_environment_variables.bat "C:\Program Files (x86)\Arduino" "C:\Users\cheche\Documents\Arduino" uno COM15

Now I can run the example programs.

Simple Program
--------------

This is a simple program that communicates with the computer via the `Serial`.

You can run it with

    simple_program.bat

The output should look like

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

If this does not work the other programs are likely not to work, too.

Using an Imported Library
-------------------------

Sometimes you have extra libraries installed on your computer. You can find some at [arduino.cc](http://arduino.cc/en/Reference/Libraries) and at the [playground](http://playground.arduino.cc/Main/LibraryList).

In my case they can be found in `C:\Users\cheche\Documents\Arduino` - the second argument of `set_environment_variables.bat`.

Run 

	using_a_library.bat

The example changes the second argument and sets if to [.\Documents\Arduino\libraries](./Documents/Arduino/libraries) where you can find the library `my_silly_library`. Then the [example program](Documents/Arduino/libraries/my_silly_library/examples/using_a_library/using_a_library.pde) is run.

The output should look like

	Using a library:
	I never thought you would actually use me!
	I never thought you would actually use me!
	I never thought you would actually use me!
	I never thought you would actually use me!
	I never thought you would actually use me! 

Using the Standart Library
--------------------------

The Arduino standart library contains many a useful code.
The example

    standart_library_servo.bat

uploads the example code for the Servo that makes it sweep. You can find the code in the IDE -> File -> Examples -> Servo -> Sweep.
It has no output.