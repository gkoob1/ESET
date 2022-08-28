; THIS CODE IS FOR THE PIC 18F4550 MICROCONTROLLER
; NAME:	koob_graham
; DATE: 2009-09-23  

#include	p18f4550.inc	;pre-defined PIC specific definitions
#include	configure.inc
;**************************************************************************
;	START OF CODE SECTION
;**************************************************************************
COUNTER	EQU	20H			; VARIABLE LOCATION
A		EQU 00H			; Access Bank
SW2		EQU RA4			; Switch 2 on schematic
SW3		EQU	RA5			; Switch 3 on schematic
LED_R	EQU RC0			; Red LED
LED_Y	EQU RC1			; Yellow LED

	ORG	00h				; RESET VECTOR OR POWER ON
	CALL	PORT_INIT
MAIN_LOOP:
	BTFSC	PORTA,SW2,A		; If SW2 is ON
	BSF		PORTC,LED_R,A	; Turn RED LED ON 

	BTFSC	PORTA,SW3,A		; If SW3 is ON
	BCF		PORTC,LED_Y,A	; Turn ON YELLOW LED

	BTFSS	PORTA,SW2,A		; If SW2 is OFF
	BCF		PORTC,LED_R,A	; Turn RED LED OFF

	BTFSS	PORTA,SW3,A		; If SW3 is OFF
	BSF		PORTC,LED_Y,A	; Turn YELLOW LED OFF 

	GOTO	MAIN_LOOP

;**************************************************************************
; Include *.asm files here
#include	port_init.asm
	END
