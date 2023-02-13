#ifndef __KEY_H__
#define __KEY_H__

#include "os.h"

/*-----------------------------------------------------队列-----------------------------------------------------*/

#define KEY_QUEUE_SIZE 5

typedef enum {
    Key_1,
    Key_2,
    Key_OK,
    Key_L,
    Key_R
} Key;

void Key_Push(Key key);
Key Key_Pop(void);
void Key_Clear(void);

uint8_t Key_Empty(void);
uint8_t Key_Size(void);

/*-----------------------------------------------------检测-----------------------------------------------------*/

#define KEY_HTIM htim17
#define KEY_DEBOUNCE_T1 1
#define KEY_DEBOUNCE_T2 20

void Key_Init(void);

void Key_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim);
void Key_GPIO_EXTI_Callback(uint16_t GPIO_Pin);

#endif
