#ifndef __OLED_H__
#define __OLED_H__

#include "main.h"
#include "spi.h"

/* 设置横屏或者竖屏显示
   0  正向显示
  90  旋转90度显示
 180  旋转90度显示
 270  旋转270度显示 */

#define USE_HORIZONTAL 0


#define LED_ON    HAL_GPIO_WritePin(LED_GPIO_Port,LED_Pin, GPIO_PIN_SET)
#define LED_OFF   HAL_GPIO_WritePin(LED_GPIO_Port,LED_Pin, GPIO_PIN_RESET)


//#define OLED_SCL_Clr() HAL_GPIO_WritePin(OLED_CLK_GPIO_Port, OLED_CLK_Pin, GPIO_PIN_RESET) // CLK
//#define OLED_SCL_Set() HAL_GPIO_WritePin(OLED_CLK_GPIO_Port, OLED_CLK_Pin, GPIO_PIN_SET)
//
//#define OLED_SDA_Clr() HAL_GPIO_WritePin(OLED_DIN_GPIO_Port, OLED_DIN_Pin, GPIO_PIN_RESET) // DIN
//#define OLED_SDA_Set() HAL_GPIO_WritePin(OLED_DIN_GPIO_Port, OLED_DIN_Pin, GPIO_PIN_SET)

#define OLED_RES_Clr() HAL_GPIO_WritePin(OLED_RES_GPIO_Port, OLED_RES_Pin, GPIO_PIN_RESET) // RES
#define OLED_RES_Set() HAL_GPIO_WritePin(OLED_RES_GPIO_Port, OLED_RES_Pin, GPIO_PIN_SET)

#define OLED_DC_Clr() HAL_GPIO_WritePin(OLED_DC_GPIO_Port, OLED_DC_Pin, GPIO_PIN_RESET) // DC
#define OLED_DC_Set() HAL_GPIO_WritePin(OLED_DC_GPIO_Port, OLED_DC_Pin, GPIO_PIN_SET)


#define OLED_CMD  0 // 写命令
#define OLED_DATA 1 // 写数据

#define u8 unsigned char
#define u16 unsigned int
#define u32 unsigned long

void OLED_ClearPoint(u8 x, u8 y);

void OLED_ColorTurn(u8 i);

void OLED_WR_Byte(u8 dat, u8 mode);

void OLED_DisPlay_On(void);

void OLED_DisPlay_Off(void);

void OLED_Refresh(void);

void OLED_Clear(void);

void OLED_DrawPoint(u8 x, u8 y, u8 t);

void OLED_DrawLine(u8 x1, u8 y1, u8 x2, u8 y2, u8 mode);

void OLED_DrawCircle(u8 x, u8 y, u8 r);

void OLED_ShowChar(u8 x, u8 y, u8 chr, u8 size1, u8 mode);

void OLED_ShowString(u8 x, u8 y, const char *chr, u8 size1, u8 mode);

void OLED_ShowNum(u8 x, u8 y, u32 num, u8 len, u8 size1, u8 mode);

void OLED_ShowChinese(u8 x,u8 y,u8 num,u8 size1,u8 mode);

void OLED_ScrollDisplay(u8 num, u8 space, u8 mode);

void OLED_ShowPicture(u8 x, u8 y, u8 sizex, u8 sizey, u8 BMP[], u8 mode);

void OLED_Init(void);

#endif
