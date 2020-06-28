assume cs:code

code segment
	
	;mov 数据传送
	
	mov ax,0fh	  ;ax=000f
	;mov ds,1234h	不支持数据直接传送到段寄存器
	
	mov bx,ax	    ;通用寄存器-->通用寄存器
	
	mov ax,cs	    ;段寄存器-->通用寄存器
	mov ax,1000h
	mov ds,ax	    ;通用寄存器-->段寄存器
		
	;原文件编译时
	;mov ax,[0]	ax=0
	mov bx,0
	mov [bx],ax	  ;通用寄存器-->内存单元
	mov cx,[bx]	  ;内存单元-->通用寄存器
	
	mov es,[bx]	  ;内存单元-->段寄存器
	mov ax,255	  ;ax=00ff
	mov es,ax
	mov [bx],es	  ;段寄存器-->内存单元
	
	mov ax,4c00h
	int 21h
	
code ends

end
