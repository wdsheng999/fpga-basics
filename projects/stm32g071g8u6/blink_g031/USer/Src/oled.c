#include "oled.h"
#include "oledfont.h"

u8 OLED_GRAM[128][16];

//反显函数
void OLED_ColorTurn(u8 i) {
    if (i == 0) {
        OLED_WR_Byte(0xA6, OLED_CMD);//正常显示
    }
    if (i == 1) {
        OLED_WR_Byte(0xA7, OLED_CMD);//反色显示
    }
}

void OLED_WR_Byte(u8 dat, u8 cmd) {
   // u8 i;
    if (cmd)
        OLED_DC_Set();
    else
        OLED_DC_Clr();
    HAL_SPI_Transmit(&hspi2, &dat, 1, HAL_MAX_DELAY);

    OLED_DC_Set();
}

//开启OLED显示
void OLED_DisPlay_On(void) {
    OLED_WR_Byte(0x8D, OLED_CMD);//电荷泵使能
    OLED_WR_Byte(0x14, OLED_CMD);//开启电荷泵
    OLED_WR_Byte(0xAF, OLED_CMD);//点亮屏幕
}

//关闭OLED显示
void OLED_DisPlay_Off(void) {
    OLED_WR_Byte(0x8D, OLED_CMD);//电荷泵使能
    OLED_WR_Byte(0x10, OLED_CMD);//关闭电荷泵
    OLED_WR_Byte(0xAE, OLED_CMD);//关闭屏幕
}

//更新显存到OLED
void OLED_Refresh(void) {
    u8 i, n;
    for (i = 0; i < 16; i++) {
        OLED_WR_Byte(0xb0 + i, OLED_CMD); //设置行起始地址
        OLED_WR_Byte(0x00, OLED_CMD);   //设置低列起始地址
        OLED_WR_Byte(0x10, OLED_CMD);   //设置高列起始地址
        for (n = 0; n < 128; n++)
            OLED_WR_Byte(OLED_GRAM[n][i], OLED_DATA);
    }
}

//清屏函数
void OLED_Clear(void) {
    u8 i, n;
    for (i = 0; i < 16; i++) {
        for (n = 0; n < 128; n++) {
            OLED_GRAM[n][i] = 0;//清除所有数据
        }
    }
    //OLED_Refresh();//更新显示
}

//画点
//x:横坐标
//y:纵坐标
//t:1 填充 0,清空
void OLED_DrawPoint(u8 x, u8 y, u8 t) {
    u8 i, m, n;
    u8 x0 = x, y0 = y;
    if (USE_HORIZONTAL == 90) {
        x = 127 - y0;
        y = x0;
    } else if (USE_HORIZONTAL == 270) {
        x = y0;
        y = 127 - x0;
    }
    i = y / 8;
    m = y % 8;
    n = 1 << m;
    if (t) { OLED_GRAM[x][i] |= n; }
    else {
        OLED_GRAM[x][i] = ~OLED_GRAM[x][i];
        OLED_GRAM[x][i] |= n;
        OLED_GRAM[x][i] = ~OLED_GRAM[x][i];
    }
}

//画线
//x1,y1:起点坐标
//x2,y2:结束坐标
void OLED_DrawLine(u8 x1, u8 y1, u8 x2, u8 y2, u8 mode) {
    u16 t;
    int xerr = 0, yerr = 0, delta_x, delta_y, distance;
    int incx, incy, uRow, uCol;
    delta_x = x2 - x1; //计算坐标增量
    delta_y = y2 - y1;
    uRow = x1;//画线起点坐标
    uCol = y1;
    if (delta_x > 0)incx = 1; //设置单步方向
    else if (delta_x == 0)incx = 0;//垂直线
    else {
        incx = -1;
        delta_x = -delta_x;
    }
    if (delta_y > 0)incy = 1;
    else if (delta_y == 0)incy = 0;//水平线
    else {
        incy = -1;
        delta_y = -delta_y;
    }
    if (delta_x > delta_y)distance = delta_x; //选取基本增量坐标轴
    else distance = delta_y;
    for (t = 0; t < distance + 1; t++) {
        OLED_DrawPoint(uRow, uCol, mode);//画点
        xerr += delta_x;
        yerr += delta_y;
        if (xerr > distance) {
            xerr -= distance;
            uRow += incx;
        }
        if (yerr > distance) {
            yerr -= distance;
            uCol += incy;
        }
    }
}

//x,y:圆心坐标
//r:圆的半径
void OLED_DrawCircle(u8 x, u8 y, u8 r) {
    int a, b, num;
    a = 0;
    b = r;
    while (2 * b * b >= r * r) {
        OLED_DrawPoint(x + a, y - b, 1);
        OLED_DrawPoint(x - a, y - b, 1);
        OLED_DrawPoint(x - a, y + b, 1);
        OLED_DrawPoint(x + a, y + b, 1);

        OLED_DrawPoint(x + b, y + a, 1);
        OLED_DrawPoint(x + b, y - a, 1);
        OLED_DrawPoint(x - b, y - a, 1);
        OLED_DrawPoint(x - b, y + a, 1);

        a++;
        num = (a * a + b * b) - r * r;//计算画的点离圆心的距离
        if (num > 0) {
            b--;
            a--;
        }
    }
}


//在指定位置显示一个字符,包括部分字符
//x:0~127
//y:0~63
//size1:选择字体 6x8/6x12/8x16/12x24
//mode:0,反色显示;1,正常显示
void OLED_ShowChar(u8 x, u8 y, u8 chr, u8 size1, u8 mode) {
    u8 i, m, temp, size2, chr1;
    u8 x0 = x, y0 = y;
    if (size1 == 8)size2 = 6;
    else size2 = (size1 / 8 + ((size1 % 8) ? 1 : 0)) * (size1 / 2);  //得到字体一个字符对应点阵集所占的字节数
    chr1 = chr - ' ';  //计算偏移后的值
    for (i = 0; i < size2; i++) {
        if (size1 == 8) { temp = asc2_0806[chr1][i]; } //调用0806字体
        else if (size1 == 12) { temp = asc2_1206[chr1][i]; } //调用1206字体
        else return;
        for (m = 0; m < 8; m++) {
            if (temp & 0x01)OLED_DrawPoint(x, y, mode);
            else OLED_DrawPoint(x, y, !mode);
            temp >>= 1;
            y++;
        }
        x++;
        if ((size1 != 8) && ((x - x0) == size1 / 2)) {
            x = x0;
            y0 = y0 + 8;
        }
        y = y0;
    }
}


//显示字符串
//x,y:起点坐标
//size1:字体大小
//*chr:字符串起始地址
//mode:0,反色显示;1,正常显示
void OLED_ShowString(u8 x, u8 y, const char *chr, u8 size1, u8 mode) {
    while ((*chr >= ' ') && (*chr <= '~'))//判断是不是非法字符!
    {
        OLED_ShowChar(x, y, *chr, size1, mode);
        if (size1 == 8)x += 6;
        else x += size1 / 2;
        chr++;
    }
}

//m^n
u32 OLED_Pow(u8 m, u8 n) {
    u32 result = 1;
    while (n--) {
        result *= m;
    }
    return result;
}

//显示数字
//x,y :起点坐标
//num :要显示的数字
//len :数字的位数
//size:字体大小
//mode:0,反色显示;1,正常显示
void OLED_ShowNum(u8 x, u8 y, u32 num, u8 len, u8 size1, u8 mode) {
    u8 t, temp, m = 0;
    if (size1 == 8)m = 2;
    for (t = 0; t < len; t++) {
        temp = (num / OLED_Pow(10, len - t - 1)) % 10;
        if (temp == 0) {
            OLED_ShowChar(x + (size1 / 2 + m) * t, y, '0', size1, mode);
        } else {
            OLED_ShowChar(x + (size1 / 2 + m) * t, y, temp + '0', size1, mode);
        }
    }
}

//显示汉字
//x,y:起点坐标
//num:汉字对应的序号
//mode:0,反色显示;1,正常显示
void OLED_ShowChinese(u8 x,u8 y,u8 num,u8 size1,u8 mode)
{
	u8 m,temp;
	u8 x0=x,y0=y;
	u16 i,size3=(size1/8+((size1%8)?1:0))*size1;  //得到字体一个字符对应点阵集所占的字节数
	for(i=0;i<size3;i++)
	{
		if(size1==16)
				{temp=Hzk1[num][i];}//调用16*16字体
//		else if(size1==24)
//				{temp=Hzk2[num][i];}//调用24*24字体
//		else if(size1==32)
//				{temp=Hzk3[num][i];}//调用32*32字体
//		else if(size1==64)
//				{temp=Hzk4[num][i];}//调用64*64字体
		else return;
		for(m=0;m<8;m++)
		{
			if(temp&0x01)OLED_DrawPoint(x,y,mode);
			else OLED_DrawPoint(x,y,!mode);
			temp>>=1;
			y++;
		}
		x++;
		if((x-x0)==size1)
		{x=x0;y0=y0+8;}
		y=y0;
	}
}

//x,y：起点坐标
//sizex,sizey,图片长宽
//BMP[]：要写入的图片数组
//mode:0,反色显示;1,正常显示
void OLED_ShowPicture(u8 x, u8 y, u8 sizex, u8 sizey, u8 BMP[], u8 mode) {
    u16 j = 0;
    u8 i, n, temp, m;
    u8 x0 = x, y0 = y;
    sizey = sizey / 8 + ((sizey % 8) ? 1 : 0);
    for (n = 0; n < sizey; n++) {
        for (i = 0; i < sizex; i++) {
            temp = BMP[j];
            j++;
            for (m = 0; m < 8; m++) {
                if (temp & 0x01)OLED_DrawPoint(x, y, mode);
                else OLED_DrawPoint(x, y, !mode);
                temp >>= 1;
                y++;
            }
            x++;
            if ((x - x0) == sizex) {
                x = x0;
                y0 = y0 + 8;
            }
            y = y0;
        }
    }
}

//OLED的初始化
void OLED_Init(void) {
    OLED_RES_Clr();
    HAL_Delay(100);
    OLED_RES_Set();

    OLED_WR_Byte(0xAE, OLED_CMD); //--turn off oled panel
    OLED_WR_Byte(0xa8, OLED_CMD); // Set Multiplex Ration
    OLED_WR_Byte(0x7f, OLED_CMD);
    OLED_WR_Byte(0xd5, OLED_CMD); // Set Frame Frequency
    OLED_WR_Byte(0x50, OLED_CMD); // 104Hz
    if (USE_HORIZONTAL == 180) {
        OLED_WR_Byte(0xC8, OLED_CMD);
        OLED_WR_Byte(0xA1, OLED_CMD);
    } else {
        OLED_WR_Byte(0xC0, OLED_CMD);
        OLED_WR_Byte(0xA0, OLED_CMD);
    }
    OLED_WR_Byte(0xd3, OLED_CMD); // Set Display Offset
    OLED_WR_Byte(0x00, OLED_CMD);
    OLED_WR_Byte(0xdc, OLED_CMD); // Set Display Start Line
    OLED_WR_Byte(0x00, OLED_CMD);
    OLED_WR_Byte(0x20, OLED_CMD); // Set Page Addressing Mode
    OLED_WR_Byte(0x81, OLED_CMD); // Set Contrast Control
    OLED_WR_Byte(0xdf, OLED_CMD);
    OLED_WR_Byte(0xa4, OLED_CMD); // Set Entire Display OFF/ON
    OLED_WR_Byte(0xa6, OLED_CMD); // Set Normal/Reverse Display
    OLED_WR_Byte(0xad, OLED_CMD); // Set External VPP
    OLED_WR_Byte(0x8a, OLED_CMD);
    OLED_WR_Byte(0xd9, OLED_CMD); // Set Phase Leghth
    OLED_WR_Byte(0x22, OLED_CMD);
    OLED_WR_Byte(0xdb, OLED_CMD); // Set Vcomh voltage
    OLED_WR_Byte(0x35, OLED_CMD);
    OLED_Clear();
    OLED_WR_Byte(0xAF, OLED_CMD); // Display ON
}
