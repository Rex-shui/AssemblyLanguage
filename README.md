# 汇编语言

<!DOCTYPE HTML>
<html>
<head></head>

<body>
<ul>
  <li><h3><a href=".\notes\hw.asm">hello world~</a></h3></li>
</ul>
<hr>

<h2>寄存器简介</h2>
<ul>
  <li><span>总共14个寄存器AX, BX, CX, DX, SI, DI, SP, BP, IP, CS, SS, DS, ES, PSW</span></li>
  <li><span>通用寄存器 AX, BX, CX, DX</span></li>
  <li><span>段寄存器 CS, SS, DS, ES</span></li>
  <li><span>标志寄存器PSW</span></li>
  <li><span>程序以段地址：偏移地址的方式指定内存，段地址默认保存在段寄存器DS中</span></li>
  <li><span>CS:IP指向即将执行的指令</span></li>
  <li><span>SS:SP栈顶元素</span></li>
</ul>

</body>
</html>

<h2>常用指令</h2>
<ul>
<li>数据传送指令 mov</li>
<blockquote>
  <div>mov ax, bx ;bx-->ax</div>
</blockquote>
  
<li>加减法指令 add/sub</li>
<blockquote>
  <div>add ax, bx ;ax=ax+bx</div>
  <div>sub ax, bx ;ax=ax-bx</div>
</blockquote>

<li>除法指令 div</li>
<blockquote>
  <div>div reg/内存单元</div>
  <div>除数8位，则被除数16位，默认存放在AX中。除数16位，被除数32位，存放在AX和DX中，DX存放高16位，AX存放低16位</div>
  <div>除数为8位，AL存放商，AH存余数除数为16位，AX存放商，DX存放余数</div>
</blockquote>
<li>乘法指令 mul</li>
</ul>
