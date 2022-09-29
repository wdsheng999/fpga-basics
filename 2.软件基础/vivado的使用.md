本讲文档 ug949 网页版本查看[xilinx官方文档](https://docs.xilinx.com/home)

synthesis之后的schematic和RTLanalysis的不同
- RTLanalytesis之后的结果是逻辑的数学表达
- synthesis之后的对应到fpga的器件，逻辑映射的查找表 dff
- implementation 这个表达在英飞凌手册中见到的比较多。实现 可以看到版图的位置
  布局布线 自动布线的时间比较长 如果逻辑复杂 可能布线失败
  可以通过floorplaning查看实现网表中的位置
- 生成bitstream类似于生成gerber

TODO：看完minieye建议再去看一下无限次元的视频 
组合逻辑 不和时间相关 = 阻塞非阻塞
时序逻辑<=
