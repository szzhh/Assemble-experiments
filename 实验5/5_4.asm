code segment
start:
    mov ax,0ffffh
    mov bx ,01h
    mov cx,5
    next: add ax,bx
    loop next
code ends
end start