code segment
start:
    mov ax, 71d2h
    mov bx, 5df1h
    mov cx, 2
    next1:
    shr ax, 1
    rcr bx,1
    loop next1
    mov cx, 4
    ; mov dx, ax
    ; mov ax, bx
    ; mov bx, dx
    xchg ax,bx
    next2:
    shl ax, 1
    rcl bx,1
    loop next2
code ends
end start