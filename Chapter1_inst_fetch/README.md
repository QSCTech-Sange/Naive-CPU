### PC 寄存器

+ 第一个编写的模块

+ 了解 PC 寄存器的用途，然后用 Verilog 实现
+ 代码在 `pc_reg.v` 里

### 指令存储器 ROM 

+ 了解指令寄存器的用途
+ 代码在 `rom.v` 中

### 取指模块 inst_fetch

+ 即 instruction_fetch 的含义
+ 将 PC 和 ROM 组合在一起

![](https://cdn.jsdelivr.net/gh/QSCTech-Sange/picBed/1.png)

### 仿真测试

+ 在刚刚的 `rom.v` 中添加一行 `initial $readmemh ( "rom.data", rom ); `
+ 即使得 rom 的默认值从 `rom.data` 这个文件中读取
+ 因此还要新建 rom.data，里面先任意放了一些数据
+ 新建一个 `inst_fetch_tb.v` 用于仿真
+ 里面通过`initial`语句模拟了一些行为
+ 使用 Vivado 的仿真结果如下
![20201103135409](https://cdn.jsdelivr.net/gh/QSCTech-Sange/picBed/20201103135409.png)

