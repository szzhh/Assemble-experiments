code segment
start:
    mov ax ,10011000B
    mov bx ,01000000B
    mov cx ,5  ;循环次数
    next: sub ax,bx
    loop next
code ends
end start