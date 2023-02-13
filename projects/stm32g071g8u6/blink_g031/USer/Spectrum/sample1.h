#ifndef __SPECTRUM_SAMPLE_H__
#define __SPECTRUM_SAMPLE_H__

#include "app1.h"

void Spectrum_Sample_Init(void);
void Spectrum_Sample_DeInit(void);

void Spectrum_Sample_Refresh_Sample_Rate(void);
void Spectrum_Sample_Try_Process(void);
void Spectrum_Sample_Try_Start_New_ADC(void);

void Spectrum_Sample_ADC_ConvCpltCallback(ADC_HandleTypeDef *hadc);

#endif
