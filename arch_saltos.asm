;Alberto Ortega
;programa de operaciones basicas con menú
%macro escribir 2 
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

%macro leer 2 
        mov eax, 3
        mov ebx, 0
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro
section .data

	msg1		db		10,'-Calculadora-',10,0
	lmsg1		equ		$ - msg1
 
	msg2		db		10,'Numero 1: ',0
	lmsg2		equ		$ - msg2
 
	msg3		db		'Numero 2: ',0
	lmsg3		equ		$ - msg3

	msg9		db		10,'Resultado: ',10
	lmsg9		equ		$ - msg9
 

 
	nlinea		db		10,10,0
	lnlinea		equ		$ - nlinea

	mensajeop db 10, "Elija una opción: ", 10, "1. Suma", 10, "2. Resta", 10, "3. Multiplicación",  10, "4. División",  10, "5. Salir",  10
    lenop equ $ - mensajeop

	msjvalido db 10,"************Elija una opción válida************",10
        lenvalido equ $ - msjvalido
 
section .bss
  	num1:		resb	2
	num2:		resb 	2
	resultado:	resb 	2
	
	opcion      resb    2
section .text
 	global _start
 
_start:
	;mensaje de encabezado del ejercicio

	escribir msg1, lmsg1
	; Imprimimos  msj del primer numero
	escribir msg2, lmsg2
	; Obtenemos el numero 1
	leer num1, 2
	; Imprimimos msj del segundo numero
	escribir msg3, lmsg3
	; Obtenemos el numero 2
	leer num2, 2
	;mensaje del menú
bucle:
	escribir mensajeop, lenop

	leer opcion, 2
	mov bl, [opcion]
    sub bl, '0'

    cmp bl,1
    je sumar

    cmp bl,2
    je restar

    cmp bl,3
    je multiplicar

	cmp bl,4
	je dividir

	cmp bl,5
	je salir
   

	;jmp dividir  
 
	; Si el valor ingresado no cumple con ninguna de las condiciones anteriores entonces mostramos un mensaje de error y finalizamos
	; la ejecucion del programa
 	jne invalido
 
sumar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Sumamos el registro AL y BL
	add al, bl
;	aaa
 
	; Convertimos el resultado de la suma de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	escribir msg9, lmsg9
 
	; Imprimimos en pantalla el resultado
	escribir resultado, 2
 
	jmp bucle

 
restar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Restamos el registro AL y BL
	sub al, bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	escribir msg9, lmsg9
 
	; Imprimimos en pantalla el resultado
	escribir resultado, 1

 
	jmp bucle

 
multiplicar:
 
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Multiplicamos. AX = AL X BL
	mul bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
 
	; Imprimimos en pantalla el mensaje 9
	escribir msg9, lmsg9
 
	; Imprimimos en pantalla el resultado
	escribir resultado, 1
 
	jmp bucle

 
dividir:
 
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Igualamos a cero los registros DX y AH
	mov dx, 0
	mov ah, 0
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Division. AL = AX / BL. AX = AH:AL
	div bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
 
	; Print on screen the message 9
	escribir msg9, lmsg9
 
	; Imprimimos en pantalla el resultado
	escribir resultado, 1
 
	jmp bucle

invalido:
	escribir msjvalido,lenvalido
	jmp bucle

salir:
	escribir nlinea, lnlinea
	; Finalizamos el programa
	mov eax, 1
	mov ebx, 0
	int 80h
