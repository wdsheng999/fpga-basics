#include "app1.h"

void Spectrum_Init(void) {
    spectrum_exit = 0;
    Spectrum_Sample_Init();
    Spectrum_UI_Init();
    Spectrum_Operate_Init();
}

void Spectrum_DeInit(void) {
    Spectrum_Sample_DeInit();
    Spectrum_UI_DeInit();
    Spectrum_Operate_DeInit();
}

uint8_t Spectrum_Loop(void) {
    Spectrum_Sample_Try_Process();
    Spectrum_UI_Try_Refresh(0);
    Spectrum_Operate_Try_Process();
    return spectrum_exit;
}
