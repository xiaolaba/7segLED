:: 2020-SEP-09, build 7-seg LCD + ATmega168P, test ok
:: 2020-SEP-14, try picoboot, picobootArduino168v3b2.hex
:: https://github.com/nerdralph/picoboot/tree/master/arduino

@echo off

set mcu=atmega328p
set hex=picobootArduino328v3b2.hex

:: Atmega168P, BOD 1.8V, Arduino bootloader, picoboot 250000 baud rate, tested ok
::set lfuse=0xF7
::set hfuse=0xd6
::set efuse=0xfc


:: Atmega328P, optiboot bootloader, Nano, baud rate 250000, tested ok
::set lfuse=0xFF
::set hfuse=0xda
::set efuse=0xfd



:: Atmega328P, picoboot bootloader, UNO, baud rate 250000 baud, tested ok
set lfuse=0xF7
set hfuse=0xde
set efuse=0xff



::set ac=C:\WinAVR-20100110
:: 2020-09-07, download avr-gcc 3.6 from Microchip
set ac=C:\avr8-gnu-toolchain-win32_x86

path %ac%\bin;%ac%\utils\bin;%path%;

avr-gcc.exe -dumpversion

:::: burn hex
avrdude -c usbtiny -p %mcu% -U flash:w:%hex%:a -U lfuse:w:%lfuse%:m  -U hfuse:w:%hfuse%:m

::avrdude -c usbtiny -p %mcu% -U flash:w:%hex%:a

:::: avrdude terminal only
::avrdude -c usbtiny -p %mcu% -t

pause
:end