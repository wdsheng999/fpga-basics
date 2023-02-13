#include "global1.h"

App Spectrum = {Spectrum_Init, Spectrum_DeInit, Spectrum_Loop, Spectrum_Sample_ADC_ConvCpltCallback};
uint8_t spectrum_exit = 0;

/*-----------------------------------------------------UI界面-----------------------------------------------------*/

uint8_t spectrum_hold = 0;
uint8_t spectrum_key_l_r_func = 0; // 旋转编码器功能选择，0控制频率轴，1控制电压轴

uint8_t spectrum_KHz_max_select = 10; // 频谱仪最大频率选择，默认值500Hz
float spectrum_KHz_max[] = {
        0.1f, 0.2f, 0.5f,
        1, 2, 5,
        10, 20, 50,
        100, 200, 500,
        1000,
};
char spectrum_KHz_max_label[][7] = {
        "100Hz", "200Hz", "500Hz",
        "1kHz", "2kHz", "5kHz",
        "10kHz", "20kHz", "50kHz",
        "100kHz", "200kHz", "500kHz",
        "1MHz"
};
const uint8_t spectrum_KHz_max_size = sizeof(spectrum_KHz_max) / sizeof(spectrum_KHz_max[0]);

uint8_t spectrum_voltage_div_select = 2; // 频谱仪电压刻度选择
float spectrum_voltage_div[] = {
        5, 2, 1,
        0.5f, 0.2f, 0.1f
};
char spectrum_voltage_div_label[][6] = {
        "5V", "2V", "1V",
        "500mV", "200mV", "100mV"
};
const uint8_t spectrum_voltage_div_size = sizeof(spectrum_voltage_div) / sizeof(spectrum_voltage_div[0]);

/*-----------------------------------------------------采样-----------------------------------------------------*/

Spectrum_Sample *spectrum_sample_arr[SPECTRUM_MAX_CACHE]; // 样本缓冲区
