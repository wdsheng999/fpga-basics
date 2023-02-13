#ifndef __SPECTRUM_GLOBAL_H__
#define __SPECTRUM_GLOBAL_H__

#include "app1.h"

extern App Spectrum;
extern uint8_t spectrum_exit;

/*-----------------------------------------------------typedef-----------------------------------------------------*/

typedef enum {
    Spectrum_Sample_Not,
    Spectrum_Sample_Doing,
    Spectrum_Sample_Finished
} Spectrum_Sample_Flag;

typedef struct {
    Spectrum_Sample_Flag sample_flag; // 采样标志
    uint8_t is_handle; // 处理完成标志
    float data[SPECTRUM_CHANNEL_NUM][SPECTRUM_SAMPLE_NUM * 2]; // FFT输入的数据为复数，所以数组长度翻倍
    float freq[SPECTRUM_CHANNEL_NUM]; // 最大峰频率
    float max[SPECTRUM_CHANNEL_NUM]; // 最大峰电压
    float bias[SPECTRUM_CHANNEL_NUM]; // 直流偏置电压
} Spectrum_Sample;

/*-----------------------------------------------------UI界面-----------------------------------------------------*/

extern uint8_t spectrum_hold;
extern uint8_t spectrum_key_l_r_func;

extern uint8_t spectrum_KHz_max_select; // 频谱仪最大频率选择
extern float spectrum_KHz_max[];
extern char spectrum_KHz_max_label[][7];
extern const uint8_t spectrum_KHz_max_size;

extern uint8_t spectrum_voltage_div_select; // 频谱仪电压刻度选择
extern float spectrum_voltage_div[];
extern char spectrum_voltage_div_label[][6];
extern const uint8_t spectrum_voltage_div_size;

/*-----------------------------------------------------采样-----------------------------------------------------*/

extern Spectrum_Sample *spectrum_sample_arr[SPECTRUM_MAX_CACHE]; // 样本缓冲区

#endif
