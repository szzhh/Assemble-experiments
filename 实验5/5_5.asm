code segment
start:
    mov ax,0ffffh
    mov bx ,0ffffh
    mov cx,0000h
    mov dx,0001h
    add bx,dx
    adc ax,cx
    ;loop next
code ends
end start