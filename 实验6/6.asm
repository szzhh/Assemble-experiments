code segment
start:
    mov ax,8f1dh
    shr ax,1
    shl ax,1
    mov ax,8f1dh
    mov cl,5
    sal ax,cl
    mov cl,7
    sar ax,cl
code ends
end start