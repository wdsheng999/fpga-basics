#include "global.h"

App Scope = {Scope_Init, Scope_DeInit, Scope_Loop, Scope_Sample_ADC_ConvCpltCallback};
uint8_t scope_exit = 0;

/*-----------------------------------------------------UI界面-----------------------------------------------------*/

uint8_t scope_hold = 0;
uint8_t scope_key_l_r_func = 0; // 旋转编码器功能选择，0控制时间轴，1控制电压轴，3为控制触发电平

uint8_t scope_ms_div_select = 6; // 示波器时间刻度选择，默认值1ms
const float scope_ms_div[] = {
        100,
        50, 20, 10,
        5, 2, 1,
        0.5f, 0.2f, 0.1f,
        0.05f, 0.02f, 0.01f,
        0.005f, 0.002f, 0.001f
};
const char scope_ms_div_label[][6] = {
        "100ms",
        "50ms", "20ms", "10ms",
        "5ms", "2ms", "1ms",
        "500us", "200us", "100us",
        "50us", "20us", "10us",
        "5us", "2us", "1us"
};
const uint8_t scope_ms_div_size = sizeof(scope_ms_div) / sizeof(scope_ms_div[0]);

uint8_t scope_voltage_div_select = 2; // 示波器电压刻度选择，默认值1V
const float scope_voltage_div[] = {
        5, 2, 1,
        0.5f, 0.2f, 0.1f
};
const char scope_voltage_div_label[][6] = {
        "5V", "2V", "1V",
        "500mV", "200mV", "100mV"
};
const uint8_t scope_voltage_div_size = sizeof(scope_voltage_div) / sizeof(scope_voltage_div[0]);

/*-----------------------------------------------------采样-----------------------------------------------------*/

Edge scope_tri_edge = Scope_Edge_Rise;
uint8_t scope_tri_channel = 0;
float scope_tri_voltage = 0;
float scope_sample_rate; // 采样率
Scope_Sample *scope_sample_arr[SCOPE_MAX_CACHE]; // 样本缓冲区
