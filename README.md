
http://playground.arduino.cc/Code/WindowsCommandLine





	arduinowindowscommandline\examples>simple_program
	C:\Program Files (x86)\Arduino\hardware\arduino\cores\arduino\HardwareSerial.cpp: In function 'void store_char(unsigned char, ring_buffer*)':
	C:\Program Files (x86)\Arduino\hardware\arduino\cores\arduino\HardwareSerial.cpp:98: warning: comparison between signed and unsigned integer expressions
	C:\Program Files (x86)\Arduino\hardware\arduino\cores\arduino\HardwareSerial.cpp: In function 'void __vector_18()':
	C:\Program Files (x86)\Arduino\hardware\arduino\cores\arduino\HardwareSerial.cpp:127: warning: unused variable 'c'
	C:\Program Files (x86)\Arduino\hardware\arduino\cores\arduino\HardwareSerial.cpp: In member function 'void HardwareSerial::begin(long unsigned int, byte)':
	C:\Program Files (x86)\Arduino\hardware\arduino\cores\arduino\HardwareSerial.cpp:368: warning: unused variable 'current_config'
	C:\Program Files (x86)\Arduino\hardware\arduino\cores\arduino\HardwareSerial.cpp: In member function 'virtual size_t HardwareSerial::write(uint8_t)':
	C:\Program Files (x86)\Arduino\hardware\arduino\cores\arduino\HardwareSerial.cpp:467: warning: comparison between signed and unsigned integer expressions
	C:\Program Files (x86)\Arduino\hardware\arduino\cores\arduino\Print.cpp: In member function 'size_t Print::print(const __FlashStringHelper*)':
	C:\Program Files (x86)\Arduino\hardware\arduino\cores\arduino\Print.cpp:44: warning: '__progmem__' attribute ignored
	C:\Program Files (x86)\Arduino\hardware\arduino\cores\arduino\Tone.cpp:119: warning: only initialized variables can be placed into program memory area
	abuild.bat: Successfully built "C:\Users\cheche\Documents\programmiertes\arduinowindowscommandline\examples\obj"\simple_program.rom
	abuild.bat: Successfully built "C:\Users\cheche\Documents\programmiertes\arduinowindowscommandline\examples\obj"\simple_program.hex
	   text    data     bss     dec     hex filename
	      0    2858       0    2858     b2a C:\Users\cheche\Documents\programmiertes\arduinowindowscommandline\examples\obj\simple_program.hex
	
	abuild.bat: Uploading sketch...
	
	avrdude: AVR device initialized and ready to accept instructions
	
	Reading | ################################################## | 100% 0.01s
	
	avrdude: Device signature = 0x1e950f
	avrdude: NOTE: FLASH memory has been specified, an erase cycle will be performed
	         To disable this feature, specify the -D option.
	avrdude: erasing chip
	avrdude: reading input file "C:\Users\cheche\Documents\programmiertes\arduinowindowscommandline\examples\obj\simple_program.hex"
	avrdude: writing flash (2858 bytes):
	
	Writing | ################################################## | 100% 0.69s
	
	avrdude: 2858 bytes of flash written
	avrdude: verifying flash memory against C:\Users\cheche\Documents\programmiertes\arduinowindowscommandline\examples\obj\simple_program.hex:
	avrdude: load data flash data from input file C:\Users\cheche\Documents\programmiertes\arduinowindowscommandline\examples\obj\simple_program.hex:
	avrdude: input file C:\Users\cheche\Documents\programmiertes\arduinowindowscommandline\examples\obj\simple_program.hex contains 2858 bytes
	avrdude: reading on-chip flash data:
	
	Reading | ################################################## | 100% 0.60s
	
	avrdude: verifying ...
	avrdude: 2858 bytes of flash verified
	
	avrdude: safemode: Fuses OK
	
	avrdude done.  Thank you.
	
	aupload.bat:  exiting with return code 0
	press Esc or Ctrl+C to terminate
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