data segment
    string1 db 'abcdabcdefghi$'
    string2 db 'abcde$'
    array db  100 dup(?);定义100个字节的数组
data ends
code segment
main proc       
    mov ax,data
    mov ds,ax
    mov cx,5  ;CX存放子串数目
    mov al,1 ;Q 主串索引
    mov bl,0 ;K 子串索引
next:    ;跳到NEXT[Q]=K，先求next数组
    mov ah,0
    mov si,offset string2;偏移地址，便于存储数组
    add si,ax
    mov ah,[si]  ;P[Q]，依次保存串
    mov bh,0
    mov di,offset string2
    add di,bx
    mov bh,[di]  ;P[K]
    cmp ah,bh;对比计数，确定next的值
    je DENG;跳跃
    cmp bl,0
    je then 
    mov bh,0
    mov di,offset array
    add di,bx
    dec di
    mov bl,[di]  ;NEXT[K-1]
    jnz then
DENG:
    inc bl;继续存下一个
    dec cx;
    jmp then
then:
    mov ah,0
    mov di,offset array;引入数组保存
    add di,ax ;next Q实际地址      
    mov [di],bl ;next[Q]=K，保存上述求的结果
    inc al;不断往后索引
    dec cx;减少
    cmp cx,0;若相等则进入kmp_before
    je kmp_before
    jmp next
kmp_before:
    mov al,0 ;i指针
    mov bl,0 ;j指针
    mov di,offset array
    add di,4 ;next Q实际地址     
    mov [di],al ;next[Q]=K
    inc al
    mov [di],al
    dec al
    jmp kmp
kmp:
    cmp al,13;主串长度为13，可以任意更改，如果i索引到最后，则结束
    je over
    cmp bl,5;j索引长度大于子串长度，即找到
    je OK;输出结果
    mov ah,0
    mov di,offset string1
    add di,ax  ;S[i]
    mov ah,[di];保存当前指针i所指
    mov bh,0
    mov si,offset string2  ;T[j]
    add si,bx
    mov bh,[si];保存当前指针j所指
    cmp ah,bh;依次比较
    je next_one
    mov bh,0
    mov si,offset array  ;NEXT[j]，不相同，则往后走
    add si,bx
    mov bl,[si]
    jmp kmp
next_one:
    inc al;往后
    inc bl
    jmp kmp 
OK:
    sub al,5;将j指针所指的地方回溯5
    add al,48
    mov ah,02h;显示输出
    mov dl,al;要读出的内容
    int 21h
    ret
over:
    ret
main endp
code ends
end main