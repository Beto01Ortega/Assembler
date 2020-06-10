%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro 

%macro leer 2      
    mov eax,3      
    mov ebx,2     
    mov ecx,%1   
    mov edx,%2	  
    int 80H       
%endmacro 

section .data ;definir constantes
    numero db "Ingrese un número: ",10
    tam_n equ $-numero

    result db "El número ingresado es:",10
    tam_r equ $-result

    salto db " ",10
    tam_s equ $-salto
section .bss ;definir variables
        n1 resb 5
section .text
        global _start
_start:

        escribir numero, tam_n

        ;++++para hacerlo de forma estatica++++
        ;mov ebx, 7
        ;add ebx, '0'
        ;mov [n1], bx

        leer n1, 5
        
        escribir result, tam_r

        escribir n1, 5
        
        mov eax, 1 
        int 80H