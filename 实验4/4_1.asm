code segment
start:
    mov dx,0000h ; 高位
    mov ax ,0100h ;低位
    mov cx ,0100h
    div cx  ;商在ax,余数在dx
code ends
end start