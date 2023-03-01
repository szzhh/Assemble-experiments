code segment
start:
    mov ax, 0704h
    mov bx, 0508h
    sub al, bl
    aas
    sub ah, bh
    aas
code ends
end start