assume cs:code
code segment

	  mov ax,4c00h
	  int 21h
	
start:
	  mov ax,0
	
s:	  nop
	  nop
	
	  mov di,offset s
	  mov si,offset s2
	  mov ax,cs:[si]
	  mov cs:[di],ax  ;将标号s处的内容变为E8F6
	
s0:	  jmp short s

s1: 	  mov ax,0
	  int 21h
	  mov ax,0
	
s2: 	  jmp short s1    ;机器码为E8F6
	  nop


	
code ends 

end start
