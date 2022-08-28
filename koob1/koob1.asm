; THIS CODE IS FOR THE PIC 18F4550 MICROCONTROLLER.
; This code is for MICR104 - Assn01
; NAME:	koob_graham
; DATE: 2009-10-05  
#include	p18f4550.inc	;pre-defined PIC specific definitions
#include	configure.inc
;**************************************************************************
;	START OF CODE SECTION
;**************************************************************************
A			EQU 00H				; Access Bank
F			EQU	01H				; Return to F Register

	ORG		00H					; RESET VECTOR OR POWER ON
PORT_INIT:
	MOVLW	0FH					; Configure PORTA
	MOVWF	ADCON1,A			; for Digital I/P

	MOVLW	00H					; RA<6:3> = Outputs 
	MOVWF	PORTA,A				; RA<2:0> = Inputs
	
	MOVLW	07H					; 
	MOVWF	TRISA,A				; Configure PORTA
	
	MOVLW	00H					; RB<7:0> = Outputs
	MOVWF	PORTB,A				; 

	MOVLW	00H					;
	MOVWF	TRISB,A				; Configure PORTB

	MOVLW	00H					; RC<7:0> = Inputs 
	MOVWF	PORTC,A				;

	MOVLW	0FFH				;
	MOVWF	TRISC,A				; Configure PORTC

	MOVLW	00H					; RD<7,5,3,1> = Outputs
	MOVWF	PORTD,A				; RD<6,4,2,0> = Inputs

	MOVLW	55H					;
	MOVWF	TRISD,A				; Configure PORTD

	MOVLW	00H					; RE<7:0> = Outputs
	MOVWF	PORTE,A				;

	MOVLW	00H					;
	MOVWF	TRISE,A				; Configure PORTE

	MOVLW	07H					; COMPARATOR OFF
	MOVWF	CMCON,A				; CONFIGURE COMPARATOR 

MAIN_LOOP:
	MOVFF	PORTC, PORTB		; PORTB O/P Value on PORTC

	CALL	PORTA_TOGGLE		; RA<2:0> I/P are O/P on RA<5:3>

	RLNCF	PORTD,F,A			; Rotate I/P left 1b and O/P

	GOTO	MAIN_LOOP			;

PORTA_TOGGLE:
	BTFSC	PORTA,RA0,A			; If RA0 is HIGH 
	BSF		PORTA,RA3,A			; Turn RA3 HIGH 

	BTFSC	PORTA,RA1,A			; If RA1 is HIGH 
	BSF		PORTA,RA4,A			; Turn RA4 HIGH 

	BTFSC	PORTA,RA2,A			; If RA2 is HIGH 
	BSF		PORTA,RA5,A			; Turn RA5 HIGH 

	BTFSS	PORTA,RA0,A			; If RA0 is LOW 
	BCF		PORTA,RA3,A			; Turn RA3 LOW

	BTFSS	PORTA,RA1,A			; If RA1 is LOW 
	BCF		PORTA,RA4,A			; Turn RA4 LOW

	BTFSS	PORTA,RA2,A			; If RA2 is LOW 
	BCF		PORTA,RA5,A			; Turn RA5 LOW

	RETURN						;

	END
