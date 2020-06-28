# 汇编语言

<!DOCTYPE HTML>
<html>
<head></head>

<body>
<ul>
  <li><h3><a href=".\notes\hw.asm">hello world~</a></h3></li>
</ul>
<hr>

<h3>常用的寄存器与一些指令</h3>
<ul>
  <li><span>总共14个寄存器AX, BX, CX, DX, SI, DI, SP, BP, IP, CS, SS, DS, ES, PSW</span></li>
  <li><span>通用寄存器 AX, BX, CX, DX</span></li>
  <li><span>段寄存器 CS, SS, DS, ES</span></li>
  <li><span>标志寄存器PSW</span></li>
  <li><span>程序以段地址：偏移地址的方式指定内存，段地址默认保存在段寄存器DS中</span></li>
  <li><span>CS:IP指向即将执行的指令</span></li>
  <li><span>SS:SP栈顶元素</span></li>
  <li><a href=".\notes\mov.asm">数据传送指令 mov ax, bx</a></li>
  <!--<li><a href=".\notes\add.asm">加减指令add/sub ax,bx</a></li>-->
</ul>
<hr>



</body>
</html>
