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

        mensaje db 10,"N1= 4 y N2= 2",10
        lenn equ $ - mensaje

        mensaje1 db 10,"Operación de 8 bits",10
        len1 equ $ - mensaje1

        mensajesuma db 10,"suma: "
        lensuma equ $ - mensajesuma

        mensajeres db 10,"resta: "
        lenres equ $ - mensajeres

        mensajeprod db 10,"Producto: "
        lenprod equ $ - mensajeprod

        mensajedivid db 10,"***La división***",10
        lendivid equ $ - mensajedivid

        mensaje2 db 10,"Cociente: "
        len2 equ $ - mensaje2

        new_line db 10, " "

        mensajed db 10, "residuo: "
        lend equ $ - mensajed


section .bss
        residuo resb 1
        cociente resb 1
        suma resb 1
        resta resb 1
        producto resb 1
section .text
        global _start
_start:

; proceso de suma
        escribir mensaje1, len1
        escribir mensaje, lenn
        
        mov ax, 4
        mov bx, 2
        
        add ax, bx
        add ax, '0'
    
        mov[suma], ax

        escribir mensajesuma, lensuma
        escribir suma, 1

; proceso de resta
        mov ax, 4
        mov bx, 2
        
        sub ax, '0'
        sub bx, '0'
        sub ax, bx
        add ax, '0'
    
        mov[resta], ax

        escribir mensajeres, lenres
        escribir resta, 1

; proceso de producto
        mov al, 4
        mov bl, 2

        mul bl
        add al, '0'
        mov [producto], al

        escribir mensajeprod, lenprod
        escribir producto, 1
;  división
        
        escribir mensajedivid, lendivid
       
        mov al, 4
        mov bl, 2

        div bl
        add al, '0'  
        mov [cociente], al 
        add ah, '0'
        mov [residuo], ah
        ;cociente
        escribir mensaje2, len2
        escribir cociente, 1
        ;residuo
        escribir mensajed, lend
        escribir residuo, 1
        ;resultado+
        escribir new_line, 1
        mov eax, 1
        int 80h

; al= cociente
; ah= residuo

