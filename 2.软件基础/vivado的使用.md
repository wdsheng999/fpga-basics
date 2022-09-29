本讲文档 ug949 网页版本查看[xilinx官方文档](https://docs.xilinx.com/home)

synthesis之后的schematic和RTLanalysis的不同
- RTLanalytesis之后的结果是逻辑的数学表达
- synthesis之后的对应到fpga的器件，逻辑映射的查找表 dff
- implementation 这个表达在英飞凌手册中见到的比较多。实现 可以看到版图的位置
  布局布线 自动布线的时间比较长 如果逻辑复杂 可能布线失败
  可以通过floorplaning查看实现网表中的位置
- 生成bitstream类似于生成gerber

对比一下国产fpga工具 如高云fpga designer
非常的清晰明了
<img src="/2.软件基础/gowin.png">
就是上面的那些网表 对应逻辑 然后 添加约束文件 然后布局布线 结束

sram sdram掉电丢失
flash掉电不丢失 

TODO：看完minieye建议再去看一下无限次元的视频 
组合逻辑 不和时间相关 = 阻塞非阻塞
时序逻辑<=

vivado和vscode联合配置 [参考公众号](https://mp.weixin.qq.com/s/Lc5L4OhGJlOeCorP1Jqopg)
在vivado中选中文本编辑器为vscode
vscode安装插件 Verilog HDL 
自动纠错信息 vivado目录下的xvlog 添加到环境变量  vivado的bin文件夹
vscode中设置 vivado  linter换成xvlog

实例化模块与定义跳转 ctags的配置 本机Desktop未成功

一键生成testbench 插件verilog testbench 

注意vivado本身可以跨平台安装 在linux上的效率会更高
https://www.bilibili.com/read/cv15281388?from=search&spm_id_from=333.337.0.0