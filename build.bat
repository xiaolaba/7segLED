@echo off

del *.elf
del *.hex
del *.lst
del *.o
del *.s

::avr-gcc -mmcu=attiny2313 -Wall -Os -o main.elf main.c -w
::avr-objcopy -j .text -j .data -O ihex main.elf main.hex

::pause
::avrdude -c usbtiny -p t2313 -U flash:w:"main.hex":a



@echo on

set mcu=atmega328p
::set mcu=atmega324p
::set mcu=atmega168p
::set mcu=attiny2313

:::: // no PRR register
:: set mcu=attiny13 

:::: // PRR register, Power Reduction Register
::set mcu=attiny13a   

set main=7segLED
set ac=C:\WinAVR-20100110

path %ac%\bin;%ac%\utils\bin;%path%;

:: REF : https://www.nongnu.org/avr-libc/user-manual/using_tools.html


:: ref: https://www.nongnu.org/avr-libc/user-manual/group__demo__project.html

avr-gcc.exe -dumpversion

:: to include the C source code into the assembler listing in file
::avr-gcc -c -O2 -Wall -mmcu=%mcu% -Wa,-acdhlmns=%main%.lst -Wl,-Ttiny13flash.x -nostdlib -g %main%.c -o %main%.o

::avr-gcc -c -mmcu=%mcu% -x assembler-with-cpp -o %main%.o %main%.S -Wa,--gstabs


:::: -Os optinize for Size, debug -g is not working, must turn off as -g0
::avr-gcc.exe -xc -Os -mmcu=%mcu% -Wall -g0 -o %main%.out %main%.c -w

:::: -Os optinize for Size, debug -g is ok
avr-gcc.exe -xc -Os -mmcu=%mcu% -Wall -g -o %main%.out %main%.c -w


::Compiling
::avr-gcc -Wall -g -Os -mmcu=%mcu% -o %main%.bin %main%.c


:::: // output asm
avr-gcc.exe -S -fverbose-asm -xc -Os -gdwarf-2 -mmcu=%mcu% -Wall -g0 -S -o %main%.s %main%.c

::avr-gcc.exe -O2 -Wl,-Map, %main%.map -o %main%.out %main%.c -mmcu=%mcu%

cmd /c avr-objdump.exe -h -S %main%.out >%main%.lst
cmd /c avr-objcopy.exe -O ihex %main%.out %main%_%mcu%.hex
avr-size.exe %main%.out
del %main%.out

::pause
:::: burn hex

::avrdude -c usbtiny -p m328p -U flash:w:"%main%_%mcu%.hex":a -U lfuse:w:%lfuse%:m  -U hfuse:w:%hfuse%:m

avrdude -c usbtiny -p %mcu% -U flash:w:%main%_%mcu%.hex:a

:::: avrdude terminal only
::avrdude -c usbtiny -p %mcu% -t

pause
:end