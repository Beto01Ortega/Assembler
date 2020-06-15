;División basica entre 0 al 9  
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

    result db "El producto es:",10
    tam_r equ $-result

    msj_coc db 10,"Cociente: "
    tam_c equ $ - msj_coc 

    msj_residuo db 10,"Cociente: "
    tam_residuo equ $ - msj_residuo

    salto db " ",10
    tam_s equ $-salto
section .bss ;definir variables
        n1 resb 2
        n2 resb 2
        cociente resb 2
        residuo resb 2
section .text
        global _start
_start:

        mov ax, 9
        mov bl, 2
        
        div bl
        add al, '0'  
        mov [cociente], al 
        add ah, '0'
        mov [residuo], ah
        
        escribir msj_coc, tam_c
        escribir cociente, 1
       
        escribir msj_residuo, tam_residuo
        escribir residuo, 1
        
         escribir salto, tam_s
        mov eax, 1
        int 80h