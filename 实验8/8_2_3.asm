code segment
start:
    mov bx, 0605h
    mov dx, 0802h
    add bx, dx
    mov al, bh
    cbw
    aaa ;ax:bl 010407
code ends
end start