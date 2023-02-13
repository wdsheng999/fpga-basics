#ifndef __SPECTRUM_SETTINGS_H__
#define __SPECTRUM_SETTINGS_H__

/*-----------------------------------------------------UI界面-----------------------------------------------------*/

// x为频率轴（水平）
#define SPECTRUM_X_MIN 0 // 频谱仪X轴起始坐标
#define SPECTRUM_X_MAX 127 // 频谱仪X轴结束坐标
#define SPECTRUM_X_GRID 10 // 频谱仪X轴栅格数

#define SPECTRUM_X_NUM ((uint8_t) (SPECTRUM_X_MAX - SPECTRUM_X_MIN)) // 频谱仪X轴总点数
#define SPECTRUM_X_POINTS_DIV ((float) SPECTRUM_X_NUM / SPECTRUM_X_GRID)

// y为电压轴（竖直）
#define SPECTRUM_Y_MIN 10 // 频谱仪Y轴起始坐标
#define SPECTRUM_Y_MAX 100 // 频谱仪Y轴结束坐标
#define SPECTRUM_Y_GRID 5 // 示波器Y轴栅格数

#define SPECTRUM_Y_NUM ((uint8_t) (SPECTRUM_Y_MAX - SPECTRUM_Y_MIN)) // 示波器Y轴总点数
#define SPECTRUM_Y_POINTS_DIV ((float) SPECTRUM_Y_NUM / SPECTRUM_Y_GRID)

/*-----------------------------------------------------采样-----------------------------------------------------*/

#define SPECTRUM_htim htim3 // TIM驱动ADC采样
#define SPECTRUM_hadc hadc1

#define SPECTRUM_CHANNEL_NUM 2 // 通道数目
#define SPECTRUM_SAMPLE_NUM 128 // 单次采样的样本数目，受限于DSP库的FFT函数，只能取一些特定的值
#define arm_cfft_sR_f32_len arm_cfft_sR_f32_len128

#define SPECTRUM_MAX_CACHE 1 // 内存中最大缓存的采样数量，实际小于等于此值，取决于堆空间大小

#endif
