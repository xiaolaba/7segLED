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
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r29	 ; 
	push r28	 ; 
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
	sbiw r28,20	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; 
/* prologue: function */
/* frame size = 20 */
	ldi r24,lo8(-1)	 ;  tmp83,
	out 36-32,r24	 ; ,, tmp83
	out 42-32,r24	 ; ,, tmp83
	movw r26,r28	 ;  tmp86,
	adiw r26,1	 ;  tmp86,
	ldi r30,lo8(C.0.1259)	 ;  tmp87,
	ldi r31,hi8(C.0.1259)	 ;  tmp87,
	ldi r24,lo8(20)	 ;  tmp88,
.L2:
	ld r0,Z+	 ; ,
	st X+,r0	 ; ,
	subi r24,lo8(-(-1))	 ;  tmp88,
	brne .L2	 ; ,
	ldi r18,lo8(0)	 ;  k,
	ldi r19,hi8(0)	 ;  k,
	movw r16,r28	 ;  tmp110,
	subi r16,lo8(-(1))	 ;  tmp110,
	sbci r17,hi8(-(1))	 ;  tmp110,
	ldi r20,lo8(200)	 ;  tmp114,
	ldi r21,hi8(200)	 ;  tmp114,
	ldi r22,lo8(-2)	 ; ,
	mov r13,r22	 ;  tmp116,
	ldi r25,lo8(21)	 ; ,
	mov r14,r25	 ;  tmp118,
	mov r15,__zero_reg__	 ;  tmp118
	add r14,r28	 ;  tmp118,
	adc r15,r29	 ;  tmp118,
	ldi r23,lo8(-3)	 ;  tmp119,
	rjmp .L14	 ; 
.L6:
	out 43-32,r23	 ; ,, tmp119
	out 37-32,r22	 ; ,, D.1264
	ldi r24,lo8(1000)	 ;  __ticks,
	ldi r25,hi8(1000)	 ;  __ticks,
.L4:
	movw r26,r20	 ;  __count, tmp114
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r26,1	 ;  __count
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	sbiw r24,1	 ;  __ticks,
	brne .L4	 ; ,
	out 43-32,r13	 ; ,, tmp116
	ld r24,Z	 ;  D.1267, a
	out 37-32,r24	 ; ,, D.1267
	ldi r24,lo8(10000)	 ;  __ticks,
	ldi r25,hi8(10000)	 ;  __ticks,
.L5:
	movw r26,r20	 ;  __count, tmp114
/* #APP */
 ;  105 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1
	1: sbiw r26,1	 ;  __count
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	sbiw r24,1	 ;  __ticks,
	brne .L5	 ; ,
	adiw r30,2	 ;  ivtmp.25,
	cp r30,r14	 ;  ivtmp.25, tmp118
	cpc r31,r15	 ;  ivtmp.25, tmp118
	brne .L6	 ; ,
	subi r18,lo8(-(1))	 ;  k,
	sbci r19,hi8(-(1))	 ;  k,
	cpi r18,10	 ;  k,
	cpc r19,__zero_reg__	 ;  k
	brlt .L14	 ; ,
	ldi r18,lo8(0)	 ;  k,
	ldi r19,hi8(0)	 ;  k,
.L14:
	movw r30,r18	 ;  tmp98, k
	lsl r30	 ;  tmp98
	rol r31	 ;  tmp98
	add r30,r16	 ;  tmp98, tmp110
	adc r31,r17	 ;  tmp98, tmp110
	ld r22,Z	 ;  D.1264, a
	movw r30,r16	 ;  ivtmp.25, tmp110
	rjmp .L6	 ; 
	.size	main, .-main
	.data
	.type	C.0.1259, @object
	.size	C.0.1259, 20
C.0.1259:
	.word	63
	.word	6
	.word	91
	.word	79
	.word	102
	.word	109
	.word	124
	.word	7
	.word	127
	.word	103
.global __do_copy_data
