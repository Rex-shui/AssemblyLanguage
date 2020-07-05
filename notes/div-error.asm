assume cs:code
code segment

start:
	;do0安装程序
	mov ax,cs
	mov ds,ax
	mov si,offset do0
	
	;一般情况下0000:0200~0000:02FF的256个内存单元所对应的中断向量表都是空的
	mov ax,0
	mov es,ax
	mov di,200h
	
	mov cx,offset do0end-offset do0
	
	cld			;使DF复位，即DF=0
s:	movsb
	loop s
	
	;设置中断向量表
	mov ax,0
	mov es,ax
	mov word ptr es:[0],200h
	mov word ptr es:[2],0
	
	;除法错误引发中断
	mov ax,2000h
	mov bh,1
	div bh
	
	mov ax,4c00h
	int 21h

do0:
	;若放在数据段中，内存被释放，不能保证数据一直存在
	jmp short do0start
s0:	db "divide error!",0AH,0DH,'$'
	
do0start:
	;显示字符串"divide error!"
	mov ax,cs
	mov ds,ax
	mov dx,202h
	mov ah,09h
	int 21h
	
	mov ax,4c00h
	int 21h	
do0end:
	nop
	
code ends 

end start
