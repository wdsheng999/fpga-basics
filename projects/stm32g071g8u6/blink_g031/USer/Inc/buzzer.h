#ifndef __BUZZER_H__
#define __BUZZER_H__

#include "os.h"

#define BUZZER_HTIM htim1

void Buzzer_Play(float freq, uint8_t t);
void Buzzer_Beep(uint8_t kind);

void Buzzeer_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim);

#endif
