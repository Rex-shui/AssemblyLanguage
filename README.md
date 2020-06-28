# 汇编语言

<!DOCTYPE HTML>
<html>
<head></head>

<body>
<ul>
  <li><h3><a href=".\notes\hw.asm">hello world~</a></h3></li>
</ul>
<hr>

<h3>寄存器简介</h3>
<ul>
  <li><span>总共14个寄存器AX, BX, CX, DX, SI, DI, SP, BP, IP, CS, SS, DS, ES, PSW</span></li>
  <li><span>通用寄存器 AX, BX, CX, DX</span></li>
  <li><span>段寄存器 CS, SS, DS, ES</span></li>
  <li><span>标志寄存器PSW</span></li>
  <li><span>程序以段地址：偏移地址的方式指定内存，段地址默认保存在段寄存器DS中</span></li>
  <li><span>CS:IP指向即将执行的指令</span></li>
  <li><span>SS:SP栈顶元素</span></li>
</ul>
<hr>

</body>
</html>

### 常用指令
- [数据传送指令 mov](#mov)
- [加减法指令 add/sub](#addsub)
- [除法指令 div](#div)
- [乘法指令 mul](#mul)

***

<h3 id="mov">数据传送指令 mov</h3>
* mov ax,bx     ;bx-->ax

<h3 id="addsub">加减法指令 add&sub</h3>
* add ax,bx     ;ax=ax+bx
* sub ax,bx     ;ax=ax-bx

<h3 id="div">除法指令 div</h3>

<h3 id="mov">乘法指令 mul</h3>

