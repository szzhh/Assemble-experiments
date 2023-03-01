.MODEL SMALL
.DATA
STRING1 DB 'INPUT:$'   ;输入
STRING2 DB 'OUTPUT:$'  ;输出
.CODE
main proc far
	mov ax,@data;		为数据段开辟地址
	mov ds,ax
	lea dx,STRING1; 	输出第一句话
	mov ah,09h
	int 21h
    call input;		读入数，了解使用者需要知道第几个斐波那契数
    lea dx,STRING2;		输出第二句话
	mov ah,09h
	int 21h 	
    mov cx,bx
    dec cx
    dec cx;				进行两次减减，方便分输入数是否大于2进行不同的运算输出
    cmp cx,0
    jle shuchu1;			若输入的数小于2（进行两次减减小于0）则直接输出1结束程序
	mov ax,1;
	mov bx,1
	push ax
	push dx;
	push dx;   			此处连续压入两个dx仅仅为了方便与后续情况保持相同规律
	push bx
	call fact;			若输入的数大于2（进行两次减减大于0）则进行fact运算
	call output;
shuchu1:
	mov al,31h;			直接输出1结束程序
	mov dl,al
	mov ah,02h
	int 21h
	MOV AX,4C00H;终止程序
    INT 21H	
main endp
;------------------------------
; 开始读入一个数
input proc near 
    mov bx,0
newchar:
    mov ah,1 ;输入指令，存入AL
    int 21h
    sub al,30h;			如果小于0
    jl exit  ;小于转移
    cmp al,9;			如果大于9
    jg exit ;大于退出
    cbw;				扩展，al->ax
    ; xchg ax,bx;
    ; mov cx,10
    ; mul cx
    ; xchg ax,bx
    ; add bx,ax;			最后的结果放入bx
    mov bx,ax
    jmp newchar
exit: 
    ret
input endp
;-------------------
;开始计算斐波那契数列
fact proc near
	push bp ;保存bp指针
	mov bp,sp ;将sp指针传给bp，此时bp指向sp的基地址。
	mov ax,[bp+4];		取上个数
	mov bx,[bp+10];    取上上个数
	add ax,bx
	push ax
	dec cx;				此处cx为前面输入的标记，控制输出
	cmp cx,0
	je fact1 
	call fact
fact1:
	pop ax;				出栈所寻找的数
fact endp
;--------------------------
;开始输出结果
output proc near     
OUTPUT5:
    MOV DX,0;
    MOV BX,10
    DIV BX;				ax除以10余数放入dx中
    ADD DX,30H
    PUSH DX ;				将dx（个位、十位、百位、等）压入栈
    INC SI;				做出栈标记
    CWD;					扩展
    CMP AX,0 
    JZ OUTPUT4		;Z标志为0跳转
    JMP OUTPUT5  
OUTPUT4:
    POP AX;				逐个出栈（。。。。百位、十位、个位）
    DEC SI
    MOV DL,AL;			逐个输出数的。。。。百位、十位、个位
    MOV AH,02H
    INT 21H
    CMP SI,0
    JNZ OUTPUT4    ;Z标志不为0跳转
output endp
ENDING:
    MOV AX,4C00H;		终止程序
    INT 21H
END

