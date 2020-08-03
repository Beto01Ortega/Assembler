;Alberto Ortega
;mitad de triangulo de cabeza
%macro escribir 2 
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

section .data

    asterisco db "*"

    msje db "",10

    new_line db " "
       
section .bss
    
section .text
        global _start
_start:

    mov cx, 9
    mov dx, 9

princip:
	cmp cx,0
	jg mostrar
	je exam 


mostrar:
	push cx
	push dx
	escribir asterisco, 1
    escribir new_line,1
	pop dx
	pop cx

	loop princip
	

exam:
	dec dx

	push dx
	escribir msje, 1
	pop dx

	mov cx, dx;9

	cmp dx,0
	jg mostrar
	je salir


salir: 
	mov eax,1
	int 80h