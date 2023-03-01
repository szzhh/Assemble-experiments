code segment
start:
    mov ax,0ffh
    mov bx ,01h
    mov cx,65281
    next: add ax,bx
    loop next
code ends
end start