简易示波器v1
https://www.eetree.cn/project/detail/662

简易示波器v2
https://www.eetree.cn/project/detail/35


## 环境
cubeIDE 自带了cubemx的界面 可以实现引脚定义
新建项目选择example可以查看例子
step1. 点灯 用 hal 和ll库
step2. 串口的发送 配置usart2 异步模式的发送 实现接收需要中断
使用重映射printf到串口发送

HAL库的资源占用严重 考虑到后续的驱动屏幕和fourier变换
使用ll库 当驱动usb等设备不支持ll库打时候需要两个库进行混编


如果与上位机进行通讯 需要配置收发

