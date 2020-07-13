assume cs:code,ds:data

data segment
s	db 4096 dup(0)
data ends

code segment
s0:	db 'I Love You'
	

start:
	
	mov ax,0b800h;
	mov es,ax;
	mov di,0
	
	mov si,offset s
	
	mov cx,2048
	
	cld
s1:	movsw
	loop s1
	
	mov di,1990
	
	mov ax,cs
	mov ds,ax
	mov si,offset s0
	
	mov cx,offset start-offset s0
s2:	movsb
	mov byte ptr es:[di],00000111b
	inc di
	loop s2
	
	
	mov ax,4c00h
	int 21h
	
code ends

end start
