#ifndef __SCOPE_GLOBAL_H__
#define __SCOPE_GLOBAL_H__

#include "app.h"

extern App Scope;
extern uint8_t scope_exit;

/*-----------------------------------------------------typedef-----------------------------------------------------*/

typedef enum {
    Scope_Edge_Rise,
    Scope_Edge_Fall
} Edge;

typedef enum {
    Scope_Sample_Not,
    Scope_Sample_Doing,
    Scope_Sample_Finished
} Sample_Flag;

typedef struct {
    Sample_Flag sample_flag; // 采样标志
    uint8_t is_handle; // 处理完成标志
    uint16_t data[SCOPE_SAMPLE_NUM][2]; // 待处理数据
    uint16_t sp;
    uint16_t len;
    float vpp[SCOPE_CHANNEL_NUM]; // 峰峰值
    float avg[SCOPE_CHANNEL_NUM]; // 平均值
    float freq[SCOPE_CHANNEL_NUM]; // 频率
} Scope_Sample;

/*-----------------------------------------------------UI界面-----------------------------------------------------*/

extern uint8_t scope_hold;
extern uint8_t scope_key_l_r_func;

extern uint8_t scope_ms_div_select; // 示波器时间刻度选择
extern const float scope_ms_div[];
extern const char scope_ms_div_label[][6];
extern const uint8_t scope_ms_div_size;

extern uint8_t scope_voltage_div_select; // 示波器电压刻度选择
extern const float scope_voltage_div[];
extern const char scope_voltage_div_label[][6];
extern const uint8_t scope_voltage_div_size;

/*-----------------------------------------------------采样-----------------------------------------------------*/

extern Edge scope_tri_edge;
extern uint8_t scope_tri_channel;
extern float scope_tri_voltage;
extern float scope_sample_rate; // 采样率
extern Scope_Sample *scope_sample_arr[SCOPE_MAX_CACHE]; // 样本缓冲区

#endif
