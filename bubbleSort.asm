stackseg segment para 'stack'
    dw 5 dup(?)
stackseg ends

dataseg segment para 'data'
    array dw 10h,5h,24h,17h
    tmp dw 0
    tmp2 dw 0
    element dw 4
dataseg ends

codeseg segment para 'code'
    assume cs:codeseg, ds:dataseg, ss:stackseg
ana     proc far
        push ds
        xor ax,ax
        push ax
        mov ax,dataseg
        mov ds,ax
        xor si,si
        dec element
        mov cx,element
        
loop1:   push cx
         push si
        mov cx,element
loop2:   mov ax,array[si]
        cmp ax,array[si+2]
        jng etiket
        mov tmp,ax
        mov ax,array[si+2]
        mov array[si], ax
        mov ax,tmp
        mov array[si+2],ax
etiket: add si,2
        loop loop2
        pop si
        pop cx
        add si,2
        loop loop1
        
        
        retf
ana     endp
codeseg ends
        end ana
        
        