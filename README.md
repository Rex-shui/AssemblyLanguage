# 汇编语言

<!DOCTYPE HTML>
<html>
<head></head>

<body>
<ul>
  <li><h3><a href=".\notes\hw.asm">hello world~</a></h3></li>
  <img src=".\img\hw.jpg" alt="hello world~">
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

<li>循环指令loop</li>
<blockquote>
  <div>loop 标号</div>
  <div>cpu执行loop指令时，先将CX中的值减一，再判断CX中的值，不为0则转移到标号处执行。<br>
    <b>若CX初值为0，则会一直跳转到标号处执行指令。</b>
  </div>
</blockquote>

<li>按位与/或 and/or ax,0ffffh</li>

<li>没有寄存器的情况下，指定访问内存单元长度mov word/byte ptr ds:[0],1</li>

<li>数据的重复：db 重复的次数 dup (重复的数据)</li>

<li>操作符offset, 取得标号处的偏移地址。</li>

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

<h2>转移指令及其原理</h2>
<ul>
<blockquote>
  <p>
    <h4>无条件转移指令jmp</h4>
    "jmp short 标号"实际上的功能为ip=ip+8位位移：<br>
    (1)8位位移=标号处的地址-jmp后指令的第一个字节的地址<br>
    (2)short指明此处为8位位移<br>
    (3)8位位移的范围为-128~127<br>
    (4)8位位移由编译程序在编译时算出<br>
    jmp near ptr 标号，16位位移，-32768~32765<br>
    jmp far ptr 标号，段间转移又称远转移，cs=标号处的段地址，ip=标号处的偏移地址。<br>
    jmp 寄存器 ;ip=寄存器<br>
    jmp word ptr 内存单元(段内转移)<br>
    jmp dword ptr 内存单元 ;高处字为段地址，低处为偏移地址<br><br>
    <h4>条件转移指令jcxz</h4>
    jcxz 标号<br>
    当cx=0时，ip=ip+8位位移<br><br>
    <h4>循环指令loop</h4>
    loop 标号<br>
    cx≠0时，ip=ip+8位位移<br><br>
    jmp short 标号，jmp near ptr 标号，jcxz 标号，loop 标号对ip的修改是根据转移起始与转移目的地址的位移来确定。<br>
    <h4><a href="\notes\anyJmp.asm">分析一个程序</a></h4>
  </p>
</blockquote>
</ul>

<h2>CALL与RET指令</h2>
<ul>
  <blockquote>
  <p>
    <h4>ret和retf</h4>
    cpu执行ret时：<br>
    1、ip的值为内存ss*16+sp处的值<br>
    2、sp=sp+2<br>
    相当于pop ip<br>
    retf则相当于：<br>
    1、pop ip<br>
    2、pop cs<br><br>
    <h4>call 标号</h4>
    1、sp=sp-2<br>
    2、内存ss*16+sp处的值等于ip的值<br>
    3、ip=ip+16位位移<br>
    相当于：<br>
    push ip<br>
    jmp near ptr 标号<br><br>
    <h4>call far ptr 标号</h4>
    1、push cs<br>
    2、push ip<br>
    3、jmp far ptr 标号<br><br>
    <h4>call 16位寄存器</h4>
    1、push ip<br>
    2、jmp 16位reg<br><br>
    <h4>call word/dword ptr 内存单元地址</h4>
    
  </p>
</blockquote>
</ul>

<h2>标志寄存器</h2>
<ul>
  <blockquote>
    <h4>标志寄存器的结构</h4>
    <img src=".\img\psw.png" alt="标志寄存器的结构">
    <ul>
    <br>
    <li>ZF，零标志位，记录相关指令执行后其结果是否为0，为0则zf=1。</li>
    <li>PF，奇偶标志位，判断结果所有bit位上1的个数是否为偶数，是则pf=1。</li>
    <li>SF，符号标志位，判断结果是否为负，为负则sf=1。</li>
    <li>CF，进位标志位，记录是否从最高有效位向更高位的进位值或者借位值，是cf=1，对无符号运算有意义。</li>
    <li>OF，溢出标志位，记录<b>有符号数运算</b>的结果是否溢出，是of=1。</li>
    <li>DF，方向标志位，控制每次操作后si，di的递减，df=1递减。(cld使df复位，即df=0，std使df置位)</li>
    <br>
    </ul>
    <h4>带进位加法指令adc</h4>
    <p>
      adc al,bl<br>
      al=al+bl+cf<br>
      例：0123h+0456h，先23h+56h，再01h+04h+cf。
    </p>
    <h4>带借位减法指令adc</h4>
    <p>
      sbb ax,bx<br>
      ax=ax-bx-cf
    </p>
    <h4>cmp指令</h4>
    <p>
      cmp的功能相当于减法指令，如cmp ax,ax，相当于ax-ax，结果为0，但并不在ax中保存，仅影响flag寄存器中的相关各位。<br>
      执行后: zf=1, pf=1, sf=0, cf=0, of=0
    </p>
    <h4>检测比较结果的条件转移指令</h4>
    <p>je, jne, jb, jnb, ja, jna</p>
    <h4>pushf与popf</h4>
    <p>pushf将标志寄存器中的值压栈，popf将栈中的数据弹出，送入标志寄存器中。</p>
    <h4>串传送指令movsb</h4>
    <p>
      movsb/movsw<br>
      1、es:di=ds:si
      2、df=1则si=si-1，di=di-1<br>
      与循环指令配合使用达到批量传送数据的效果
    </p>
    <h4>标志寄存器在debug中的表示</h4>
    <p>
      <img src=".\img\psw-debug.png" alt="标志寄存器在debug中的表示">
    </p>
  </blockquote>
</ul>

<h2>内中断</h2>
<ul>
<blockquote>
  <h4>内中断</h4>
  <p>来自于CPU内部的中断信息，当CPU接收到这种信息是，不再接着（刚执行完的指令）向下执行，而是转去处理这个信息。当CPU内部有下面情况发生的时候，将会产生中断信息。</p>
  <ul>
  <li>1、除法错误，如执行div指令产生的除法溢出。中断类型码：0</li>
  <li>2、单步执行。中断类型码：1</li>
  <li>3、执行into指令。中断类型码：4</li>
  <li>4、执行int指令</li>
  </ul>
 
  <h4>中断向量表</h4>
  <p>8086PC机中，中断向量表指定放在内存地址0处，从内存0000:0000到0000:03FF的1024个单元中存放着256个中断源
  对应的中断程序入口。高地址<b>字</b>存放段地址，低地址字存放偏移地址。</p>
  
  <h4>中断过程</h4>
  <ul>
  <li>取得中断类型码</li>
  <li>标志寄存器的值入栈</li>
  <li>设置标志寄存器的第八位TF和第九位IF的值为0</li>
  <li>CS的内容入栈</li>
  <li>IP的内容入栈</li>
  <li>从中断向量表中读取中断处理程序的入口并设置CS和IP</li>
  </ul>
  
  <h4>中断处理程序的一般步骤和iret指令</h4>
  <ul>
  <li>保存用到的寄存器</li>
  <li>处理中断</li>
  <li>恢复用到的寄存器</li>
  <li>用iret指令返回（功能用汇编指令描述为pop ip, pop cs, popf）</li>
  </ul>
  
  <h4>单步中断</h4>
  <p>CPU在执行完一条指令后，如果检测到标志寄存器的TF位为1，则产生单步中断。</p>
  <ul>
  <li>取得中断类型码1</li>
  <li>标志寄存器入栈，TF、IF设置为0</li>
  <li>CS、IP入栈</li>
  <li>ip=1*4, cs=1*4+2</li>
  </ul>
  
  <h4>响应中断的特殊情况</h4>
  <p>在执行完向SS寄存器传送数据的指令后，即使发生中断，CPU也不会响应。利用这个特性，将设置ss和sp的指令连续存放。</p>
  
  <h4><a href=".\notes\div-error.asm">自定义处理除法错误引发的中断</a></h4>
</blockquote>
</ul>

<h2>显示缓存区</h2>
<ul>
<blockquote>
  <ul>
    <li>显存共32KB，B8000~BFFFF</li>
    <li>每4KB为一页，共8页，默认显示第0页，B8000~B8FFF</li>
    <li>一页可以显示80*25个字符，每个字符两字节，高字节存放颜色属性，<b>低字节</b>存放ASCII码</li>
    <img src="./img/ShowCache.jpg" alt="高字节的颜色属性">
    <li><a href="./notes/ShowCache.asm">示例</a></li>
  </ul>
</blockquote>
</ul>


</body>
</html>
