%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro 

section .data ;definir constantes
    nombres db "Nombres: Alberto Andrés",10
    tam_n equ $-nombres

    apellidos db "Apellidos: Ortega Puchaicela",10
    tam_a equ $-apellidos

    materia db "Materia: Ensamblador",10
    tam_m equ $-materia

    genero db "Género: Masculino",10
    tam_g equ $-genero
section .bss ;definir variables

section .text
        global _start
_start:

        escribir nombres, tam_n
        escribir apellidos, tam_a
        escribir materia, tam_m
        escribir genero, tam_g

        mov eax, 1 
        int 80H