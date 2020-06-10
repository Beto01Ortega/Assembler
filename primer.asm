%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro 

section .data ;definir constantes
    mensaje db "Hola Ensamblador",10
    tam equ $-mensaje

section .bss ;definir variables

section .text
        global _start
_start:

        escribir mensaje, tam

        mov eax, 1 
        int 80H