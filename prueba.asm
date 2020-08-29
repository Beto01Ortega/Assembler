;0 ---> Se repite: 1

;1 ---> Se repite: 2

;2 ---> Se repite: 3

;3 ---> Se repite: 1

;4 ---> Se repite: 4

;6 ---> Se repite: 2

;7 ---> Se repite: 3

;8 ---> Se repite: 2

;9 ---> Se repite: 2

;Sumatoria:94  

%macro write 2
  mov eax, 4
  mov ebx, 1
  mov ecx, %1
  mov edx, %2
  int 80h
%endmacro

%macro read 2
  mov eax, 3
  mov ebx, 0
  mov ecx, %1
  mov edx, %2
  int 80h
%endmacro
section .data
    archivo_entrada db "/home/beto/Escritorio/Borrador/repaso/ortega_alberto.txt",0
    msj_err db "error en el archivo",10
    len_error equ $- msj_err

    msj_repite db " ---> Se repite: "
    len_msj_repite equ $-msj_repite

    msj_suma db "Sumatoria:"
    len_msj_suma equ $-msj_suma

    resultado db "  "
    len equ $ - resultado

    salto db "  "

    nlinea db 10, 10, 0
    lnlinea equ $ - nlinea

section .bss
    idarchivo resb 1
    text resb 20
    num_actual resb 1
    contador resb 1
    suma resb 1

section .text
    global _start

_start:
    mov eax, 5
    mov ebx, archivo_entrada
    mov ecx, 0
    mov edx, 0
    int 80h

    test eax, eax 
    jz err

    mov dword [idarchivo], eax

    mov eax, 3
    mov ebx, [idarchivo]
    mov ecx, text
    mov edx, 30
    int 80h
    
    mov eax, 6
    mov ebx, [idarchivo]
    mov ecx, 0
    mov edx, 0

    mov esi, text
    mov edi, 0
    
    mov cl, 0
    mov dl, 0

    mov [suma], cl

    jmp comparar

err:
    write msj_err, len_error
    jmp salida

comparar:
    mov al, [esi]
    sub al, '0'

    add esi, 1
    add edi, 1

    cmp al, dl
    je incrementar

    cmp edi, 20
    jb comparar

    jmp verificar_resultado

incrementar:
    inc cl

    cmp edi, 20
    jb comparar

verificar_resultado:
    cmp cl, 0
    jg imprimir_resultado

    inc dl
    mov esi, text
    mov edi, 0    
    mov cl, 0

    cmp dl, 9
    jng comparar

    clc

    jmp sumar_arreglo

imprimir_resultado:
    push dx

    add dl, '0'
    mov [num_actual], dl

    add cl, '0'
    mov [contador], cl

    write num_actual, 1
    write msj_repite, len_msj_repite
    write contador, 1
    write nlinea, lnlinea

    pop dx
    
    inc dl
    mov esi, text
    mov edi, 0    
    mov cl, 0

    cmp dl, 9
    jng comparar

    clc

    jmp sumar_arreglo

sumar_arreglo:
    mov al, [resultado + 1]
    mov ah, [esi]

    sub ah, '0'

    adc al, ah

    aaa
    pushf
    or al, 30h
    popf

    mov [resultado + 1], al

    mov al, [resultado + 0]
    mov ah, 0

    adc al, ah

    aaa
    pushf
    or al, 30h
    popf

    mov [resultado + 0], al

    add esi, 1
    add edi, 1

    cmp edi, 20
    jb sumar_arreglo

    write msj_suma, len_msj_suma
    write resultado, 2
    write salto, 2
    write nlinea, lnlinea

    jmp salida

salida:
    mov eax, 1
    int 80h