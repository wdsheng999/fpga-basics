#ifndef __OS_H__
#define __OS_H__

#include "main.h"
#include "tim.h"
#include "adc.h"

#include "common.h"
#include "oled.h"
#include "key.h"
#include "buzzer.h"

#define HCLK 64000000
void Start_Init(void);
void Main_Loop(void);
typedef struct {
    void (*Init)(void);
    void (*DeInit)(void);
    uint8_t (*Loop)(void);
    void (*ADC_ConvCpltCallback)(ADC_HandleTypeDef *hadc);
} App;



#endif
