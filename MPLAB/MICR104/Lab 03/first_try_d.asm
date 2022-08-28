; THIS CODE IS FOR THE PIC 18F4550 MICROCONTROLLER
; NAME:	koob_graham
; DATE: 2009-09-02
#include	p18f4550.inc	;pre-defined PIC specific definitions
;**************************************************************************
;	START OF CODE SECTION
;**************************************************************************
COUNTER	EQU	20H			; VARIABLE LOCATION
A		EQU 00H			; Access Bank

	ORG	00h				; RESET VECTOR OR POWER ON
PORT_INIT:
	MOVLW	1EH			; VREF- = GND, VREF+ = AN3
	MOVWF	ADCON1,A	; AN0 = ANALOG

	MOVLW	06H			; RA<5:4> = SW3, SW2, 
	MOVWF	PORTA,A		; RA<3:0> = VREF (U2), Chip Select (U4),
						; O/P External Connector (J1), Wiper I/P from DIG Pot (U5) [ANALOG]

	MOVLW	39H			; 
	MOVWF	TRISA,A		; Configure PORTA

	MOVLW	08H			; RB<7:4> = KeyBoard 
	MOVWF	PORTB,A		; RB<3:2> = DIG POT (U5) & Chip Select, RTC
						; RB<1:0> = I2C

	MOVLW	0F7H		;
	MOVWF	TRISB,A		; Configure PORTB

	MOVLW	7AH			; RC<7:4> = Serial I/P, Serial O/P, USB [NOT USED]
	MOVWF	PORTC,A		; RC<3:0> = N/A, I/P External Connector (J1), YEL_LED (D3) [ON], RED_LED (D2) [ON]

	MOVLW	80H			;
	MOVWF	TRISC,A		; Configure PORTC

	MOVLW	0FFH		; RD<7:4> = LCD
	MOVWF	PORTD,A		; RD<3:0> = KeyPad

	MOVLW	00H			;
	MOVWF	TRISD,A		; Configure PORTD

	MOVLW	00H			; RE<7:4> = N/A
	MOVWF	PORTE,A		; RE<3:0> = LCD Data/Command, LCD Read/Write, LCD Chip Select [Active HIGH]

	MOVLW	00H			;
	MOVWF	TRISE,A		; Configure PORTE

	MOVLW	07H			; COMPARATOR OFF
	MOVWF	CMCON,A		; CONFIGURE COMPARATOR 

MAIN_LOOP:
	BSF		PORTC,RC1,A	; TURN ON YEL_LED
	BSF		PORTC,RC0,A	; TURN ON RED_LED
	BCF		PORTC,RC1,A	; TURN OFF YEL_LED
	BCF		PORTC,RC0,A	; TURN OFF RED_LED
	GOTO	MAIN_LOOP

;**************************************************************************
; Include *.asm files here
	END
