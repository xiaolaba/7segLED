	.file	"7segLED.c"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__CCP__  = 0x34
__tmp_reg__ = 0
__zero_reg__ = 1
 ;  GNU C (WinAVR 20100110) version 4.3.3 (avr)
 ; 	compiled by GNU C version 3.4.5 (mingw-vista special r3), GMP version 4.2.3, MPFR version 2.4.1.
 ;  GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ;  options passed:  -imultilib avr5 -iprefix
 ;  c:\winavr-20100110\bin\../lib/gcc/avr/4.3.3/ 7segLED.c -mmcu=atmega328p
 ;  -auxbase-strip 7segLED.s -gdwarf-2 -g0 -Os -Wall -fverbose-asm
 ;  options enabled:  -falign-loops -fargument-alias -fauto-inc-dec
 ;  -fbranch-count-reg -fcaller-saves -fcommon -fcprop-registers
 ;  -fcrossjumping -fcse-follow-jumps -fdefer-pop -fearly-inlining
 ;  -feliminate-unused-debug-types -fexpensive-optimizations
 ;  -fforward-propagate -ffunction-cse -fgcse -fgcse-lm
 ;  -fguess-branch-probability -fident -fif-conversion -fif-conversion2
 ;  -finline-functions -finline-functions-called-once
 ;  -finline-small-functions -fipa-pure-const -fipa-reference -fivopts
 ;  -fkeep-static-consts -fleading-underscore -fmath-errno
 ;  -fmerge-constants -fmerge-debug-strings -fmove-loop-invariants
 ;  -fomit-frame-pointer -foptimize-register-move -foptimize-sibling-calls
 ;  -fpeephole -fpeephole2 -freg-struct-return -fregmove
 ;  -freorder-functions -frerun-cse-after-loop -fsched-interblock
 ;  -fsched-spec -fsched-stalled-insns-dep -fsigned-zeros
 ;  -fsplit-ivs-in-unroller -fsplit-wide-types -fstrict-aliasing
 ;  -fstrict-overflow -fthread-jumps -ftoplevel-reorder -ftrapping-math
 ;  -ftree-ccp -ftree-copy-prop -ftree-copyrename -ftree-dce
 ;  -ftree-dominator-opts -ftree-dse -ftree-fre -ftree-loop-im
 ;  -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
 ;  -ftree-reassoc -ftree-salias -ftree-scev-cprop -ftree-sink -ftree-sra
 ;  -ftree-store-ccp -ftree-ter -ftree-vect-loop-version -ftree-vrp
 ;  -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss

 ;  Compiler executable checksum: 61d68a374065d489330774d2533cbbdf

	.text
.global	main
	.type	main, @function
main:
	push r16	 ; 
	push r17	 ; 
	push r29	 ; 
	push r28	 ; 
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
	sbiw r28,16	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; 
/* prologue: function */
/* frame size = 16 */
	movw r26,r28	 ;  tmp83,
	adiw r26,1	 ;  tmp83,
	ldi r30,lo8(C.0.1257)	 ;  tmp84,
	ldi r31,hi8(C.0.1257)	 ;  tmp84,
	ldi r24,lo8(16)	 ;  tmp85,
.L2:
	ld r0,Z+	 ; ,
	st X+,r0	 ; ,
	subi r24,lo8(-(-1))	 ;  tmp85,
	brne .L2	 ; ,
	ldi r24,lo8(-1)	 ;  tmp87,
	out 42-32,r24	 ; ,, tmp87
	ldi r19,lo8(0)	 ;  Tens,
	movw r22,r28	 ;  tmp106,
	subi r22,lo8(-(1))	 ;  tmp106,
	sbci r23,hi8(-(1))	 ;  tmp106,
	ldi r20,lo8(400)	 ;  tmp109,
	ldi r21,hi8(400)	 ;  tmp109,
	movw r16,r28	 ;  tmp112,
	subi r16,lo8(-(17))	 ;  tmp112,
	sbci r17,hi8(-(17))	 ;  tmp112,
	rjmp .L14	 ; 
.L6:
	out 43-32,r18	 ; ,, D.1263
	ldi r24,lo8(2000)	 ;  __ticks,
	ldi r25,hi8(2000)	 ;  __ticks,
.L4:
	movw r26,r20	 ;  __count, tmp109
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r26,1	 ;  __count
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	sbiw r24,1	 ;  __ticks,
	brne .L4	 ; ,
	ld r24,Z	 ;  tmp90, lookupTable
	com r24	 ;  tmp90
	out 43-32,r24	 ; ,, tmp90
	ldi r24,lo8(4000)	 ;  __ticks,
	ldi r25,hi8(4000)	 ;  __ticks,
.L5:
	movw r26,r20	 ;  __count, tmp109
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r26,1	 ;  __count
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	sbiw r24,1	 ;  __ticks,
	brne .L5	 ; ,
	adiw r30,1	 ;  ivtmp.24,
	cp r30,r16	 ;  ivtmp.24, tmp112
	cpc r31,r17	 ;  ivtmp.24, tmp112
	brne .L6	 ; ,
	subi r19,lo8(-(1))	 ;  Tens,
	cpi r19,lo8(16)	 ;  Tens,
	brlo .L14	 ; ,
	ldi r19,lo8(0)	 ;  Tens,
.L14:
	movw r30,r22	 ;  tmp95, tmp106
	add r30,r19	 ;  tmp95, Tens
	adc r31,__zero_reg__	 ;  tmp95
	ld r18,Z	 ;  D.1263, lookupTable
	com r18	 ;  D.1263
	subi r18,lo8(-(-128))	 ;  D.1263,
	movw r30,r22	 ;  ivtmp.24, tmp106
	rjmp .L6	 ; 
	.size	main, .-main
	.data
	.type	C.0.1257, @object
	.size	C.0.1257, 16
C.0.1257:
	.byte	63
	.byte	6
	.byte	91
	.byte	79
	.byte	102
	.byte	109
	.byte	125
	.byte	39
	.byte	127
	.byte	111
	.byte	119
	.byte	124
	.byte	57
	.byte	94
	.byte	121
	.byte	113
.global __do_copy_data
