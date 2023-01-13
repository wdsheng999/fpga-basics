# 文件说明
elf 文件为stm32g031固件，使用STM32CubeProgrammer进行烧录。
rbt 问价为ice40up5k固件，直接复制文件至STEPLink磁盘即可完成烧录
pdc（Post-synthesis design constraint）用于绑定信号与引脚

## MCU烧录过程：
### 方法一: 使用图形界面
1. 按住boot按键（核心板中间独立按键），同时连接USB至电脑。
2. 打开STM32CubeProgrammer。 连接模式为UART，115200，even， 其他选项默认即可
3. 打开elf文件，点击Download。 重新上电即可。
### 方法二：使用命令行界面
``` shell
D:\Program Files\STMicroelectronics\STM32Cube\STM32CubeProgrammer\bin\STM32_Programmer_CLI.exe -c port=COM10 p=EVEN -w ${project_loc}\Release\${project_name}.elf 0x8000000 --start 0x08000000
```
具体使用方法参考STM32CubeProgrammer的用户手册。
常用参数介绍：
1. -c port=COM10 p=EVEN 用于指定串口，具体串口号可从设备管理器中获得, p参数指定为偶校验
2. -w xxx.elf 0x8000000 用于指定待下载的文件和下载到设备中的地址
3. --start 0x08000000   用于指定下载完成后，设备从 0x8000000 处开始执行，也就省去了重新上电复位的过程

## FPGA烧录过程
复制文件至STEPLink文件即可自动完成FPGA下载，FPGA复位重启。