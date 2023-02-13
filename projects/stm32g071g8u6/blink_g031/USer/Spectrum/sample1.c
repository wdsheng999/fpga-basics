#include "sample1.h"

#include <stdlib.h> // malloc、free
#include "arm_math.h" // arm_cfft_f32、arm_cmplx_mag_f32
#include "arm_const_structs.h" // arm_cfft_sR_f32_len256

/*-----------------------------------------------------静态变量-----------------------------------------------------*/

static uint8_t dma_busy = 0;

/*-----------------------------------------------------静态函数-----------------------------------------------------*/

// 初始化所有采样相关的标志位
static void Clear_Flag() {
    dma_busy = 0;
    for (uint8_t i = 0; i < SPECTRUM_MAX_CACHE; i++) {
        if (spectrum_sample_arr[i] == NULL)
            break;
        spectrum_sample_arr[i]->sample_flag = Spectrum_Sample_Not;
        spectrum_sample_arr[i]->is_handle = 0;
    }
}

// 处理采样数据：FFT
// 计算：最大峰频率、绘图数据
static void Spectrum_Sample_Handle_Sub(Spectrum_Sample *sample) {
    uint16_t *p16 = (uint16_t *) sample->data;
    uint64_t *p64 = (uint64_t *) sample->data;

    // uint16_t转uint64_t
    for (int16_t i = SPECTRUM_SAMPLE_NUM * SPECTRUM_CHANNEL_NUM - 1;
         i >= 0; i--) { // 倒序循环，不可以用unsigned，否则0-1=MAX，永远无法退出循环
        float *tmp_p = (float *) &p64[i];
        tmp_p[0] = toVoltage((float) p16[i]); // 实部放在前32位
        tmp_p[1] = 1; // 虚部为0；这里标为1，是为下一步行列转换做准备
    }

    // 行列转置
#define REAL(x) (*((float *) &p64[x]))
#define IMAGE(x) (*((float *) &p64[x] + 1))
#define NEXT(x) ((p % SPECTRUM_CHANNEL_NUM) * SPECTRUM_SAMPLE_NUM + (p / SPECTRUM_CHANNEL_NUM))
    for (uint16_t i = 0; i < (uint16_t) (SPECTRUM_SAMPLE_NUM * SPECTRUM_CHANNEL_NUM); i++) {
        if (IMAGE(i) == 0)
            continue;
        uint16_t first_p = i;
        uint16_t p = i;
        float val = REAL(i);
        IMAGE(i) = 0;
        while (1) {
            p = NEXT(p);
            if (p == first_p) {
                REAL(p) = val;
                break;
            }
            float tmp = REAL(p);
            REAL(p) = val;
            val = tmp;
            IMAGE(p) = 0;
        }
    }
#undef REAL
#undef IMAGE
#undef NEXT

    for (uint8_t k = 0; k < SPECTRUM_CHANNEL_NUM; k++) {
        float *fft = sample->data[k];

        arm_cfft_f32(&arm_cfft_sR_f32_len, fft, 0, 1);
        arm_cmplx_mag_f32(fft, fft, SPECTRUM_SAMPLE_NUM); // magnitude为模长；fft前一半为正模长，后一半为负模长

        // 计算最大峰
        float FFT_max;
        uint32_t FFT_max_index;
        float freq = 0;
        arm_max_f32(fft + 1, SPECTRUM_SAMPLE_NUM / 2 - 1, &FFT_max, &FFT_max_index); // 只考虑正模长
        FFT_max_index++; // 过滤掉直流分量
        if (FFT_max_index >= 2) {
            float sum = fft[FFT_max_index - 2] +
                        fft[FFT_max_index - 1] +
                        fft[FFT_max_index] +
                        fft[FFT_max_index + 1] +
                        fft[FFT_max_index + 2];
            freq = (((float) (FFT_max_index - 2) * fft[FFT_max_index - 2]) +
                    ((float) (FFT_max_index - 1) * fft[FFT_max_index - 1]) +
                    ((float) (FFT_max_index) * fft[FFT_max_index]) +
                    ((float) (FFT_max_index + 2) * fft[FFT_max_index + 2]) +
                    ((float) (FFT_max_index + 1) * fft[FFT_max_index + 1])) / sum;
            freq *= (spectrum_KHz_max[spectrum_KHz_max_select] * (1000.0f / (SPECTRUM_SAMPLE_NUM / 2.0f))); // 比例算法
        }
        sample->freq[k] = freq; // 最大峰频率
        sample->max[k] = fft[FFT_max_index] / (SPECTRUM_SAMPLE_NUM / 2.0f); // 最大峰电压

        // 计算直流分量
        fft[0] /= 2; // 除直流分量外，其他分量被镜像了一份；所以从数值上看，应该把直流分量/2
        sample->bias[k] = fft[0] / (SPECTRUM_SAMPLE_NUM / 2.0f);
    }
}

/*-----------------------------------------------------接口函数-----------------------------------------------------*/

void Spectrum_Sample_Init(void) {
    for (uint8_t i = 0; i < SPECTRUM_MAX_CACHE; i++) {
        spectrum_sample_arr[i] = (Spectrum_Sample *) malloc(sizeof(Spectrum_Sample));
        if (spectrum_sample_arr[i] == NULL)
            break;
    }

    Spectrum_Sample_Refresh_Sample_Rate();
}

void Spectrum_Sample_DeInit(void) {
    HAL_ADC_Stop_DMA(&hadc1);
    HAL_TIM_Base_Stop(&htim3);

    // 释放变量空间
    for (uint8_t i = 0; i < SPECTRUM_MAX_CACHE; i++) {
        if (spectrum_sample_arr[i] == NULL)
            break;
        free(spectrum_sample_arr[i]);
        spectrum_sample_arr[i] = NULL;
    }
}

// 根据时间刻度选择设置采样率
void Spectrum_Sample_Refresh_Sample_Rate(void) {
    HAL_TIM_Base_Stop(&SPECTRUM_htim);
    HAL_ADC_Stop_DMA(&SPECTRUM_hadc);

    // 根据采样定理，采样频率必须是被采样信号最高频率的2倍
    Set_TIM_Freq(&SPECTRUM_htim, spectrum_KHz_max[spectrum_KHz_max_select] * (1000.0f * 2.0f));

    Clear_Flag();
    Spectrum_Sample_Try_Start_New_ADC();
}

void Spectrum_Sample_Try_Process(void) {
    for (uint8_t i = 0; i < SPECTRUM_MAX_CACHE; i++) {
        if (spectrum_sample_arr[i] == NULL)
            break;
        if (spectrum_sample_arr[i]->sample_flag == Spectrum_Sample_Finished && spectrum_sample_arr[i]->is_handle == 0) {
            Spectrum_Sample_Handle_Sub(spectrum_sample_arr[i]);
            spectrum_sample_arr[i]->is_handle = 1;
        }
    }
}

// 在以下几个位置被调用：
// DMA全传输完成中断
// UI绘图消耗掉一组数据
// 重新设置采样率
void Spectrum_Sample_Try_Start_New_ADC(void) {
    static uint8_t busy;
    if (busy)
        return;
    busy = 1;

    if (!dma_busy) {
        for (uint8_t i = 0; i < SPECTRUM_MAX_CACHE; i++) {
            if (spectrum_sample_arr[i] == NULL)
                break;
            if (spectrum_sample_arr[i]->sample_flag == Spectrum_Sample_Not) {
                dma_busy = 1;
                spectrum_sample_arr[i]->sample_flag = Spectrum_Sample_Doing;
                HAL_ADC_Start_DMA(&SPECTRUM_hadc, (uint32_t *) spectrum_sample_arr[i]->data,
                                  SPECTRUM_SAMPLE_NUM * SPECTRUM_CHANNEL_NUM);
                HAL_TIM_Base_Start(&SPECTRUM_htim);
                break;
            }
        }
    }

    busy = 0;
}

/*-----------------------------------------------------回调函数-----------------------------------------------------*/

void Spectrum_Sample_ADC_ConvCpltCallback(ADC_HandleTypeDef *hadc) {
    UNUSED(hadc);
    HAL_TIM_Base_Stop(&SPECTRUM_htim);
    HAL_ADC_Stop_DMA(&SPECTRUM_hadc);
    dma_busy = 0;
    for (uint8_t i = 0; i < SPECTRUM_MAX_CACHE; i++) {
        if (spectrum_sample_arr[i]->sample_flag == Spectrum_Sample_Doing) {
            spectrum_sample_arr[i]->sample_flag = Spectrum_Sample_Finished;
            break;
        }
    }
    Spectrum_Sample_Try_Start_New_ADC();
}
