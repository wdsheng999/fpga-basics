#ifndef __COMMON_H__
#define __COMMON_H__

#include "os.h"

float toVoltage(float data);
float toData(float voltage);

void Set_TIM_Freq(TIM_HandleTypeDef *htim, float freq);

uint8_t floatToStr(char str[], float num, uint8_t size);

#endif
