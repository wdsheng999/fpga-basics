#include "os.h"

#include "app.h"
#include "app1.h"

#define APP_SIZE 2

App *app[APP_SIZE];
uint8_t app_p = 0;

static void ShowLogo(void) {
    OLED_Clear();
	OLED_ShowChinese(40,20,0,16,1);//硬
	OLED_ShowChinese(56,20,1,16,1);//禾
	OLED_ShowChinese(72,20,2,16,1);//学
	OLED_ShowChinese(88,20,3,16,1);//堂


	OLED_ShowChinese(32,40,4,16,1);//寒
	OLED_ShowChinese(48,40,5,16,1);//假
	OLED_ShowChinese(64,40,6,16,1);//一
	OLED_ShowChinese(80,40,7,16,1);//起
	OLED_ShowChinese(96,40,8,16,1);//练

    OLED_ShowString(10, 70, "Dual channel scope", 12, 1);
    OLED_ShowString(10, 90, "Design by Beilever", 12, 1);
    //OLED_ShowString(45, 73, "Vvvvv.4", 8, 1);
    OLED_Refresh();
}

void Start_Init(void) {
    HAL_ADCEx_Calibration_Start(&hadc1); // 校准ADC
    HAL_TIM_PWM_Start(&htim16, TIM_CHANNEL_1); // Bias1 = 1.1V
    HAL_TIM_PWM_Start(&htim14, TIM_CHANNEL_1); // Bias2 = 1.1V

    OLED_Init();
    Key_Init();

    ShowLogo();
    HAL_Delay(2000);


    app[0] = &Scope;
    app[1] = &Spectrum;
    app[app_p]->Init();

    //Buzzer_Beep(1);
}

void Main_Loop(void) {
    if (app[app_p]->Loop())
    {
        app[app_p]->DeInit();
        app_p = (app_p + 1) % APP_SIZE;
        app[app_p]->Init();
    }
}

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef *hadc){
    app[app_p]->ADC_ConvCpltCallback(hadc);
}

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
    Buzzeer_TIM_PeriodElapsedCallback(htim);
    Key_TIM_PeriodElapsedCallback(htim);
}

void HAL_GPIO_EXTI_Rising_Callback(uint16_t GPIO_Pin) {
    Key_GPIO_EXTI_Callback(GPIO_Pin);
}

void HAL_GPIO_EXTI_Falling_Callback(uint16_t GPIO_Pin) {
    Key_GPIO_EXTI_Callback(GPIO_Pin);
}
