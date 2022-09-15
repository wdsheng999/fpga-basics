## block ram
不同厂家的bram有社么区别 bram和分布式ram的优势; xilinx 36kRAM架构的特性
### - 存储资源的意义
32位系统 2^32 4G 
在7series的可以查看其PL部分的total block ram 很少
<img src="./total%20block%20ram.png">
了解bram的特性可以使用的更加充分

### - FPGA中的存储资源
1. 锁存器 触发器 DFF latch:有记忆功能的逻辑单元
2. 查找表 LUT : 寄存器和查找表可以组合成分布式RAM 
3. block RAM: 在FPGA片上嵌入的存储单元 m36k(7 series)
在FPGA内部的存储模块时由上述三种资源构成的, 分为RAM ROM FIFO, FIFO本身是带逻辑的RAM
block RAM 在片上的布局
<img src="./bram%20sturctre.png">
<img src="./intel%20bram.png">

xilinx 的RAM有两种 
1. distributedRAM 一个clb有8个寄存器 锁存器只有4个.1024位宽的话, 非常消耗资源
2. blockRAM: 内嵌的SRAM, 单位是块
下面进行一个对比
<img src="./compareRAM.png">
输出寄存器会提升性能
所谓的36kRAM 其实是两个独立的18Kb的ram, 其框架为
<img src="./36kRAM.png">
可以配置为 单端口 双 真 
最高可以给到 512*72
