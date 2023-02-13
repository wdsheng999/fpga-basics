#include "operate1.h"

void Spectrum_Operate_Init(void) {
    spectrum_hold = 0;
    Key_Clear();
}

void Spectrum_Operate_DeInit(void) {
    Key_Clear();
}

// 成功处理队列里的一个操作，就视为操作成功，返回1
void Spectrum_Operate_Try_Process(void) {
    if (!Key_Empty()) {
        Key key = Key_Pop();
        switch (key) {
            case Key_1: { // 功能切换
                spectrum_exit = 1;
                Buzzer_Beep(1);
                break;
            }

            case Key_2: {
                spectrum_hold = !spectrum_hold;
                Buzzer_Beep(1);
                break;
            }

            case Key_OK: {
                if (!spectrum_hold) {
                    spectrum_key_l_r_func = !spectrum_key_l_r_func;
                    Buzzer_Beep(1);
                }
                break;
            }

            case Key_L: {
                if (!spectrum_hold) {
                    if (!spectrum_key_l_r_func && spectrum_KHz_max_select >= 1) {
                        spectrum_KHz_max_select--;
                        Spectrum_Sample_Refresh_Sample_Rate();
                        Spectrum_UI_Try_Refresh(1);
                        Buzzer_Beep(0);
                    } else if (spectrum_key_l_r_func && spectrum_voltage_div_select >= 1) {
                        spectrum_voltage_div_select--;
                        Spectrum_UI_Try_Refresh(1);
                        Buzzer_Beep(0);
                    } else {
                        Buzzer_Beep(1);
                    }
                }
                break;
            }

            case Key_R: {
                if (!spectrum_hold) {
                    if (!spectrum_key_l_r_func && spectrum_KHz_max_select <= spectrum_KHz_max_size - 2) {
                        spectrum_KHz_max_select++;
                        Spectrum_Sample_Refresh_Sample_Rate();
                        Spectrum_UI_Try_Refresh(1);
                        Buzzer_Beep(0);
                    } else if (spectrum_key_l_r_func && spectrum_voltage_div_select <= spectrum_voltage_div_size - 2) {
                        spectrum_voltage_div_select++;
                        Spectrum_UI_Try_Refresh(1);
                        Buzzer_Beep(0);
                    } else {
                        Buzzer_Beep(1);
                    }
                }
                break;
            }

            default:
                break;
        }
    }
}
