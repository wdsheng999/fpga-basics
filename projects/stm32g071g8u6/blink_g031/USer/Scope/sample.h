#ifndef __SCOPE_SAMPLE_H__
#define __SCOPE_SAMPLE_H__

#include "app.h"

void Scope_Sample_Init(void);
void Scope_Sample_DeInit(void);

void Scope_Sample_Refresh_Sample_Rate(void);
void Scope_Sample_Try_Process(void);
void Scope_Sample_Try_Start_New_ADC(void);

void Scope_Sample_ADC_ConvCpltCallback(ADC_HandleTypeDef *hadc);
void Scope_Sample_ADC_ConvHalfCpltCallback(ADC_HandleTypeDef *hadc);

#endif
