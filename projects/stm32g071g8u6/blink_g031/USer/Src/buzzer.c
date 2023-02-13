#include "buzzer.h"

static uint32_t t;

void Buzzer_Play(float freq, uint8_t duration) {
    t = HAL_GetTick() + duration;
    Set_TIM_Freq(&BUZZER_HTIM, freq * 2);
    HAL_TIM_Base_Start_IT(&BUZZER_HTIM);
}

void Buzzer_Beep(uint8_t kind) {
    switch (kind) {
        case 0:
            Buzzer_Play(2300, 20);
            break;
        case 1:
            Buzzer_Play(4600, 100);
            break;
        default:
            break;
    }
}

void Buzzeer_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
    if (htim == &BUZZER_HTIM) {
        if (HAL_GetTick() < t) {
            HAL_GPIO_TogglePin(BUZZER_GPIO_Port, BUZZER_Pin);
        } else {
            HAL_TIM_Base_Stop_IT(&BUZZER_HTIM);
        }
    }
}
