This is a VHDL translation of the Mojo FPGA development board "base project" (which is Verilog).

Version 1.1

For more information about the Mojo FPGA board see http://embeddedmicro.com/products/the-mojo

The Mojo base project provides easy access to the USB UART and analog readings from the AVR.  It also delays after reset to allow the AVR time to get ready. 

This is pretty much a literal translation of the original Verilog to VHDL.  I tried to keep same signal names, structure etc. where possible (but I did attempt to add some comments - take them with a grain of salt).

This version incorporates a minor modification to avoid tri-state warnings.  Also, from empirically testing, I increased the reset delay to ~164 microseconds to allow the AVR to fully set up a serial interface channel.

The original Verilog project is located at http://embeddedmicro.com/frontend/files/userfiles/files/Mojo-Base.zip
