#include "operate.h"

#include "math.h"

static inline float Get_Max_Voltage(void) {
    return scope_voltage_div[scope_voltage_div_select] * SCOPE_Y_GRID / 2.0f;
}

static inline float Get_Step_Voltage(void) {
    return scope_voltage_div[scope_voltage_div_select] / SCOPE_TRI_Voltage_STEPS_DIV;
}

static inline uint8_t isInt(float x) {
    return x == (float) (int32_t) x;
}

// 修正因调整缩放电压刻度，而带来的问题
// 返回值表示是否调整了
static uint8_t Opt_Tri_Voltage(void) {
    // 超过目前能显示的最大电压
    if (scope_tri_voltage >= Get_Max_Voltage()) {
        scope_tri_voltage = Get_Max_Voltage() - Get_Step_Voltage();
        return 1;
    }
    if (scope_tri_voltage <= -Get_Max_Voltage()) {
        scope_tri_voltage = -Get_Max_Voltage() + Get_Step_Voltage();
        return 1;
    }

    // 把触发电压对齐到step
    float check = scope_tri_voltage / Get_Step_Voltage();
    if (!isInt(check)) {
        scope_tri_voltage = roundf(check) * Get_Step_Voltage();
        return 1;
    }

    return 0;
}

static void Handle_KEY_L(void) {
    if (scope_hold)
        return;

    switch (scope_key_l_r_func) {
        case 0:
            if (scope_ms_div_select >= 1) {
                scope_ms_div_select--;
                Scope_Sample_Refresh_Sample_Rate();
                Scope_UI_Try_Refresh(1);
                Buzzer_Beep(0);
            } else {
                Buzzer_Beep(1);
            }
            break;

        case 1:
            if (scope_voltage_div_select >= 1) {
                scope_voltage_div_select--;
                Scope_UI_Try_Refresh(1);
                Buzzer_Beep(0);
            } else {
                Buzzer_Beep(1);
            }
            break;

        case 2:
            if (scope_tri_voltage - Get_Step_Voltage() > -Get_Max_Voltage()) {
                scope_tri_voltage -= Get_Step_Voltage();
                Opt_Tri_Voltage();
                Scope_UI_Try_Refresh(1);
                Buzzer_Beep(0);
            } else if (Opt_Tri_Voltage()) {
                Scope_UI_Try_Refresh(1);
                Buzzer_Beep(0);
            } else {
                Buzzer_Beep(1);
            }
            break;

        default:
            break;
    }
}

static void Handle_KEY_R() {
    if (scope_hold)
        return;

    switch (scope_key_l_r_func) {
        case 0:
            if (scope_ms_div_select <= scope_ms_div_size - 2) {
                scope_ms_div_select++;
                Scope_Sample_Refresh_Sample_Rate();
                Scope_UI_Try_Refresh(1);
                Buzzer_Play(2300, 20);
            } else {
                Buzzer_Play(4600, 100);
            }
            break;

        case 1:
            if (scope_voltage_div_select <= scope_voltage_div_size - 2) {
                scope_voltage_div_select++;
                Scope_UI_Try_Refresh(1);
                Buzzer_Play(2300, 20);
            } else {
                Buzzer_Play(4600, 100);
            }
            break;

        case 2:
            if (scope_tri_voltage + Get_Step_Voltage() < Get_Max_Voltage()) {
                scope_tri_voltage += Get_Step_Voltage();
                Opt_Tri_Voltage();
                Scope_UI_Try_Refresh(1);
                Buzzer_Beep(0);
            } else if (Opt_Tri_Voltage()) {
                Scope_UI_Try_Refresh(1);
                Buzzer_Beep(0);
            } else {
                Buzzer_Beep(1);
            }
            break;

        default:
            break;
    }
}

void Scope_Operate_Init(void) {
    scope_hold = 0;
    Key_Clear();
}

void Scope_Operate_DeInit(void) {
    Key_Clear();
}

void Scope_Operate_Try_Process(void) {
    if (!Key_Empty()) {
        Key key = Key_Pop();
        switch (key) {
            case Key_1:
                scope_exit = 1;
                Buzzer_Beep(1);
                break;

            case Key_2:
                scope_hold = !scope_hold;
                Buzzer_Beep(1);
                break;

            case Key_OK:
                if (!scope_hold) {
                    scope_key_l_r_func = (scope_key_l_r_func + 1) % 3;
                    Buzzer_Beep(1);
                }
                break;

            case Key_L:
                Handle_KEY_L();
                break;

            case Key_R:
                Handle_KEY_R();
                break;

            default:
                break;
        }
    }
}
