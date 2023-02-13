#ifndef __SCOPE_SETTINGS_H__
#define __SCOPE_SETTINGS_H__

/*-----------------------------------------------------UI界面-----------------------------------------------------*/

// x为时间轴（水平）
#define SCOPE_X_MIN 0 // 示波器X轴起始坐标
#define SCOPE_X_MAX 127 // 示波器X轴结束坐标
#define SCOPE_X_GRID 10 // 示波器X轴栅格数

#define SCOPE_X_NUM ((uint8_t) (SCOPE_X_MAX - SCOPE_X_MIN)) // 示波器X轴总点数
#define SCOPE_X_POINTS_DIV ((float) SCOPE_X_NUM / SCOPE_X_GRID)

// y为电压轴（竖直）
#define SCOPE_Y_MIN 10 // 示波器Y轴起始坐标
#define SCOPE_Y_MAX 100 // 示波器Y轴结束坐标
#define SCOPE_Y_GRID 10 // 示波器Y轴栅格数

#define SCOPE_Y_NUM ((uint8_t) (SCOPE_Y_MAX - SCOPE_Y_MIN)) // 示波器Y轴总点数
#define SCOPE_Y_POINTS_DIV ((float) SCOPE_Y_NUM / SCOPE_Y_GRID)

/*-----------------------------------------------------采样-----------------------------------------------------*/

#define SCOPE_htim htim3 // TIM驱动ADC采样
#define SCOPE_hadc hadc1

#define SCOPE_MAX_SAMPLE_RATE 1000000 // 最大采样率 = 1MSa/s
#define SCOPE_CHANNEL_NUM 2 // 通道数目
#define SCOPE_SAMPLE_NUM (SCOPE_X_NUM * 2) // 每个通道单次采样的样本数目，必须为偶数，不然会崩
#define SCOPE_SAMPLE_K 2 // sample_num = k * 绘图所需样本数

#define SCOPE_MAX_CACHE 1 // 内存中最大缓存的采样数量，实际小于等于此值，取决于堆空间大小

#define SCOPE_MAX_EDGE 100 // 最多检测上升沿/下降沿数量
#define SCOPE_TRI_CHECK_NUM 3 // 判断触发位置时，检查+/-TRI_CHECK_NUM数量的点
#define SCOPE_MAX_FAIL_T 200 // 最多允许的连续失败样本的持续时间(ms)，超过后将进入滚动模式

/*-----------------------------------------------------操控-----------------------------------------------------*/

#define SCOPE_TRI_Voltage_STEPS_DIV 2 // 调整步进电压时，每个div需要步进多少布

#endif
