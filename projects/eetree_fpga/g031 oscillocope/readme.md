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

OLED显示

<img src="./project%20diagram.png">

scopy显示
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