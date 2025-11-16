;Practica 1. Doble puerto.

LIST P=16F877A                     ;especifica el microcontrolador a usar (PIC16F877A).
#include "P16F877A.INC"            ;incluye el archivo de definiciones del PIC16F877A.

    ORG 0x00                       ;establece el origen del programa en la dirección 0x00 (vector de reset).
    GOTO INICIO                    ;salta a la etiqueta INICIO al iniciar el programa.
    ORG 0x05                       ;establece el origen en 0x05 (vector de interrupción, aunque no se usa).

INICIO                              ;etiqueta de inicio del programa.
    BSF STATUS, RP0                ;pone en 1 el bit RP0 del registro STATUS (selecciona banco 1).
    BCF STATUS, RP1                ;pone en 0 el bit RP1 del registro STATUS (banco 1).
    MOVLW b'1111'                  ;mueve el valor binario 1111 (15 decimal) al registro W.
    MOVWF TRISB                    ;configura PORTB como entrada (bits 0-3 como entrada).
    MOVLW b'00000000'              ;mueve el valor binario 00000000 (0 decimal) al registro W.
    MOVWF TRISD                    ;configura PORTD como salida (todos los bits como salida).
    BCF STATUS, RP0                ;pone en 0 el bit RP0 del registro STATUS (regresa al banco 0).

MAIN                                ;etiqueta del bucle principal.
    CALL PORTB0                    ;llama a la subrutina PORTB0 (lee el bit 0 de PORTB).
    CALL PORTB1                    ;llama a la subrutina PORTB1 (lee el bit 1 de PORTB).
    CALL PORTB2                    ;llama a la subrutina PORTB2 (lee el bit 2 de PORTB).
    CALL PORTB3                    ;llama a la subrutina PORTB3 (lee el bit 3 de PORTB).
    GOTO MAIN                      ;regresa al inicio del bucle MAIN (bucle infinito).

PORTB0                              ;subrutina que lee el bit 0 de PORTB.
    BTFSC PORTB, 0                 ;testea el bit 0 de PORTB, si está en 0 salta la siguiente línea.
    GOTO ACTIVAR0                  ;si el bit 0 está en 1, salta a la etiqueta ACTIVAR0.
    BCF PORTD, 0                   ;si el bit 0 está en 0, apaga el bit 0 de PORTD.
    BCF PORTD, 4                   ;si el bit 0 está en 0, apaga el bit 4 de PORTD.
    RETURN                         ;regresa de la subrutina.

ACTIVAR0                            ;etiqueta para activar salidas cuando PORTB0 está en 1.
    BSF PORTD, 0                   ;enciende el bit 0 de PORTD (pone en 1).
    BSF PORTD, 4                   ;enciende el bit 4 de PORTD (pone en 1).
    RETURN                         ;regresa de la subrutina.

PORTB1                              ;subrutina que lee el bit 1 de PORTB.
    BTFSC PORTB, 1                 ;testea el bit 1 de PORTB, si está en 0 salta la siguiente línea.
    GOTO ACTIVAR1                  ;si el bit 1 está en 1, salta a la etiqueta ACTIVAR1.
    BCF PORTD, 1                   ;si el bit 1 está en 0, apaga el bit 1 de PORTD.
    BCF PORTD, 5                   ;si el bit 1 está en 0, apaga el bit 5 de PORTD.
    RETURN                         ;regresa de la subrutina.

ACTIVAR1                            ;etiqueta para activar salidas cuando PORTB1 está en 1.
    BSF PORTD, 1                   ;enciende el bit 1 de PORTD (pone en 1).
    BSF PORTD, 5                   ;enciende el bit 5 de PORTD (pone en 1).
    RETURN                         ;regresa de la subrutina.

PORTB2                              ;subrutina que lee el bit 2 de PORTB.
    BTFSC PORTB, 2                 ;testea el bit 2 de PORTB, si está en 0 salta la siguiente línea.
    GOTO ACTIVAR2                  ;si el bit 2 está en 1, salta a la etiqueta ACTIVAR2.
    BCF PORTD, 2                   ;si el bit 2 está en 0, apaga el bit 2 de PORTD.
    BCF PORTD, 6                   ;si el bit 2 está en 0, apaga el bit 6 de PORTD.
    RETURN                         ;regresa de la subrutina.

ACTIVAR2                            ;etiqueta para activar salidas cuando PORTB2 está en 1.
    BSF PORTD, 2                   ;enciende el bit 2 de PORTD (pone en 1).
    BSF PORTD, 6                   ;enciende el bit 6 de PORTD (pone en 1).
    RETURN                         ;regresa de la subrutina.

PORTB3                              ;subrutina que lee el bit 3 de PORTB.
    BTFSC PORTB, 3                 ;testea el bit 3 de PORTB, si está en 0 salta la siguiente línea.
    GOTO ACTIVAR3                  ;si el bit 3 está en 1, salta a la etiqueta ACTIVAR3.
    BCF PORTD, 3                   ;si el bit 3 está en 0, apaga el bit 3 de PORTD.
    BCF PORTD, 7                   ;si el bit 3 está en 0, apaga el bit 7 de PORTD.
    RETURN                         ;regresa de la subrutina.

ACTIVAR3                            ;etiqueta para activar salidas cuando PORTB3 está en 1.
    BSF PORTD, 3                   ;enciende el bit 3 de PORTD (pone en 1).
    BSF PORTD, 7                   ;enciende el bit 7 de PORTD (pone en 1).
    RETURN                         ;regresa de la subrutina.

    END                            ;fin del programa.