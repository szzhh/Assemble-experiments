code segment
start:
    mov ah,0fh
    mov al ,01h
    mov cx,241
    next: add ah,al 
    loop next
code ends
end start