; 1512
;+2711
;-----
; 4223

%macro write 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro
section .data

    pathMore db '/home/beto/Escritorio/Borrador/repaso/suma.txt',0

    mjsError db 'Error en el archivo',10
    lenError equ $-mjsError

    num1 db '1512'
    num2 db '2711'

    result db '    '
    lenResul equ $-result
    
    newLine db '',10
    espace db ' '
    more db '+'
    separar db '-----',10
    lenSeparar equ $ -separar

section .bss
    suma resb 2
    idFile resb 1
section .text
    global _start
_start:

readFileNum1:
    mov esi, 3 
    mov ecx, 4
    clc
addString:
    mov al, [num1+esi]
    adc al, [num2+esi]
    aaa
    pushf
    or al, 30h
    popf
    mov [result+esi],al

    dec esi
    loop addString

    write espace,1
    write num1, 4
    write newLine, 1
    write more, 1
    write num2, 4
    write newLine, 1
    write separar, lenSeparar
    write espace, 1
    write result, 4
    write newLine, 1
    

writeFileMore:
    mov eax, 8
    mov ebx, pathMore
    mov ecx, 2
    mov edx, 0x1FF
    int 80h

    test eax,eax
    jz errorFile

    mov dword [idFile], eax

    mov eax,4
    mov ebx,[idFile]
    mov ecx,result
    mov edx,lenResul
    int 80h
    
    mov eax,6
    mov ebx,[idFile]
    mov ecx,0
    mov edx,0x1FF
    int 80h

    jmp salir

errorFile:
    write mjsError, lenError

salir:
    mov eax, 1
    int 80h