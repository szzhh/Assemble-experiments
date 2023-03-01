code segment
start:
	mov ax ,0f0fh
    cwd
    mov dx, 0f000h
    mov cx ,00ffh
    div cx
code ends
end start