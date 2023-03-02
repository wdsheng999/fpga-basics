简易示波器v1
https://www.eetree.cn/project/detail/662

简易示波器v2
https://www.eetree.cn/project/detail/35

示波器参考技术资料

下载，boot模式


## 环境
cubeIDE 自带了cubemx的界面 可以实现引脚定义
新建项目选择example可以查看例子
step1. 点灯 用 hal 和ll库
step2. 串口的发送 配置usart2 异步模式的发送 实现接收需要中断
使用重映射printf到串口发送

HAL库的资源占用严重 考虑到后续的驱动屏幕和fourier变换
使用ll库 当驱动usb等设备不支持ll库打时候需要两个库进行混编

## 项目流程图

<img src="./project%20diagram.png">

外设驱动：OLED显示 gpio dma

按键处理--外部中断
循环--状态机，显示状态（函数）/记录更改（局部更新），按键状态switch

scopy显示--》matlab显示
需要旋转编码器的控制，先完成oled版本

## spi&uart
如果与上位机进行通讯 需要配置收发

文件结构
```
./
 -communication
 -example
 -leddemo
 ```

在communication中， 配置了uart2，led，和spi1


uart2是可以用来做上位机通讯

通讯部分完成后，可以考虑使用板子上的按键控制，或者用上位机控制，scopy

传输 很多例程参考
```c
 while (1)
  {
    /* USER CODE END WHILE */
	  int8_t buff=0;
	  HAL_SPI_Receive(&hspi1,&buff,2,-1);
	//printf()
	  HAL_UART_Transmit(&huart2,&buff,20,1000);
    /* USER CODE BEGIN 3 */
  }
```

使用chatgpt生成了将spi接受的数据传输到uart

```c
uint8_t rx_buffer[10];
  HAL_SPI_Receive(&hspi1, rx_buffer, 10, HAL_MAX_DELAY);

  HAL_UART_Transmit(&huart2, rx_buffer, 10, HAL_MAX_DELAY);

  while (1)
  ```


## 控制按键和屏幕
### 光电编码器读取
外部中断，对A/B相状态进行读取，判断处于顺时针还是逆时针。
key.c

## adc&dac -->21年的暑假寒假练
### DMA
### 功能：
转换放大电路 外围电压1vpp-30vpp，转换到0-3.6
V，能够在显示上做设置

### 电平触发功能
前一个数字 后一个数字，判断触发采样的显示。

## oled
spi协议 找到例程
mcu-ssd1306-128*64
移植驱动库。由于板载使用了硬件spi，将软件spi更改为硬件spi


### 移动、缩放

## 频谱分析 之前很多期有现成
波形参数分析，峰峰值，频率、周期




## stm基础知识
adc dac dma 中断 
资源受限G0 fft 数字滤 波
总线 spi uart
oled屏幕 老刘示波器（b站） 128*64


sram收限制 8k --》直接配置寄存器
64k flash 够用

adc 10位
  转换范围 和电压对应值

spi 屏幕

参考手册 stm32g0x1 设计寄存器 参考 配置驱动

屏幕代码 找到

时钟树 由于是外部时钟， 可以进行配置

eclipse的代码补全 alt+/

由于资源少 不好用rt-thread 支持的芯片已经做好了移植 rt-thread studio 自动创建模板工程 剪裁

外设：
 系统输入：旋钮 按键两个-> GPIO 消抖（延迟）、外部中断。

 中断：循环体内在循环，触发事件（中断服务函数），回到循环。
 按键的中断：无法确定按键在程序的哪个位置发生--》中断处理，要把硬件的触发保存成软件的状态--》软件判断执行。

 旋转编码器--》解读三个GPIO

 ---

 系统输出：oled（spi） led
 led 也是GPIO

 信号： 交给fpga adc dac
 pwm：频率、占空比--任意波形
 adc：要做dma-直接存储器访问
 体系结构：经典计算机五级流水线：取指令（存储器、占用总线）-译码-执行（寄存器、占用总线）-访存（存储器，占用总线）-写回（存储器，占用总线）
 dma 总线空闲的时候将 adc转换结果-》RAM空间（数组）
 dma支持很多外设 spi pcie 

 dma的设置 在adc1： in0通道0，设置里直接添加dma，设置通道 优先级 方向。模式，需要配置存储空间，把memory部分映射过去。

 不是dma的必须，主频64m足够。用到dma的好处是采集速度快，adc的速度越快，越需要配置

