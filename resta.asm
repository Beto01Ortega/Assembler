;resta basica entre 0 al 9  
;Ortega Alberto
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
    numero db "Ingrese primer número: ",10
    tam_n equ $-numero

    numero2 db "Ingrese segundo número: ",10
    tam_n2 equ $-numero2

    result db "La resta es:",10
    tam_r equ $-result

    salto db " ",10
    tam_s equ $-salto
section .bss ;definir variables
        n1 resb 2
        n2 resb 2
        resta resb 2
section .text
        global _start
_start:

        mov ax, 8 
        mov bx, 4
        
        sub ax, '0'
        sub bx, '0'
        sub ax, bx
        add ax, '0'
    
    
        mov[resta], ax
        
        escribir result, tam_r

        escribir resta, 2

        escribir salto, tam_s

        mov eax, 1 
        int 80H