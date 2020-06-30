# 汇编语言

<!DOCTYPE HTML>
<html>
<head></head>

<body>
<ul>
  <li><h3><a href=".\notes\hw.asm">hello world~</a></h3></li>
  <img src=".\img\hw.jpg">
</ul>
<hr>

<h2>寄存器简介</h2>
<ul>
  <li><span>总共14个寄存器AX, BX, CX, DX, SI, DI, SP, BP, IP, CS, SS, DS, ES, PSW</span></li>
  <li><span>通用寄存器 AX, BX, CX, DX</span></li>
  <li><span>段寄存器 CS, SS, DS, ES</span></li>
  <li><span>标志寄存器PSW</span></li>
  <li><span>程序在内存空间中地址的段地址默认保存在DS中</span></li>
  <li><span>CS:IP指向即将执行的指令</span></li>
  <li><span>SS:SP栈顶元素</span></li>
</ul>

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
  <div>除数8位，则被除数16位，默认存放在AX中。除数16位，被除数32位，存放在AX和DX中，DX存放高16位，AX存放低16位。<br>
  除数为8位，AL存放商，AH存余数除数为16位，AX存放商，DX存放余数。</div>
</blockquote>

<li>乘法指令 mul</li>
<blockquote>
  <div>mul reg/内存单元</div>
  <div>两个相乘的数，要么都是8位，要么都是16位。如果是8位，另一个数默认存放在AL中。如果是16位，另一个数默认存放在AX中。<br>
  8位乘法结果默认在AX中，16位乘法结果默认高位在DX中存放，低位在AX中存放。</div>
</blockquote>

<li>Loop 指令</li>
<blockquote>
  <div>loop 标号</div>
  <div>cpu执行loop指令时，先将CX中的值减一，再判断CX中的值，不为0则转移到标号处执行。<br>
    <b>若CX初值为0，则会一直跳转到标号处执行指令。</b>
  </div>
</blockquote>
</ul>

<h2><a href=".\notes\stack.asm">栈</a></h2>
<ul>
<blockquote>
  <p>
    栈向着内存地址减小的方向生长，SS:SP始终指向栈顶元素<br>
    设栈的空间从10000H~1000FH，栈为空时SS:SP指向10010H<br>
    push ax入栈<br>
    （一）sp=sp-2<br>
    （二）将ax中的内容送入SS:SP指向的内存中<br>
    pop ax出栈<br>
    （一）将SS:SP指向的内存单元处的数据送入ax<br>
    （二）sp=sp+2
  </p>
</blockquote>
</ul>

<h2>定位内存地址</h2>
<ul>
<blockquote>
  <p>
    注意汇编源文件中mov ax,[idata]编译后ax=idata，而mov ax,ds:[idata]则ax的值为内存ds:[idata]处的值。<br>
    [bx], [si], [di], [bp]<br>
    [bx+idata], [si+idata], [di+idata], [bp+idata]<br>
    [bx+si], [bx+di], [bp+si], [bp+di]<br>
    [bx+si+idata], [bx+di+idata], [bp+si+idata], [bp+di+idata]<br>
    若指令中没有显示的给出段地址，只要在[...]中出现bp，段地址默认保存在SS中，否则默认保存在DS中<br>
    mov ax,cs:[bp];将内存cs:[bp]中的值送入ax中
  </p>
</blockquote>
</ul>

</body>
</html>
