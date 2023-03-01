code segment
start:
    mov ax,0fffh
    mov bx ,01h
    mov cx,61441
    next: add ax,bx
    loop next
code ends
end start