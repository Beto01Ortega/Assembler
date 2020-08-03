;imprime la tabla del 3 usando loop
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

    msj db 10,"3*";cambiar por el 3 por el número que quieras multiplicar
    tam_m equ $ - msj

    new_line db " "

    mensajeprod db " = "
    lenprod equ $ - mensajeprod
       
section .bss
    cont resb 1
    producto resb 1
    num resb 2
section .text
        global _start
_start:

    mov ecx, 9
ciclo:
    push ecx

    
    add ecx, '0'
    mov [cont], ecx

    escribir msj, tam_m
    escribir cont, 1

    pop ecx

    push ecx

    mov eax, 3;cambiar por el 3 por el número que quieras multiplicar
    mov ebx, ecx
    mul ebx
    add eax, '0'
    mov [producto], eax

    escribir mensajeprod, lenprod
    escribir producto, 1
     
    pop ecx

    loop ciclo

salir: 
	mov eax,1
	int 80h