#include "sample.h"

#include <stdlib.h> // malloc、free
#include <math.h> // abs

/*-----------------------------------------------------静态变量-----------------------------------------------------*/

static uint8_t dma_busy = 0;

/*-----------------------------------------------------静态函数-----------------------------------------------------*/

static inline float toFreq(float cycle) {
    return scope_sample_rate / cycle;
}

static inline int Min(uint16_t a, uint16_t b) {
    if (a < b)
        return a;
    else
        return b;
}

// 初始化所有采样相关的标志位
static void Clear_Flag() {
    dma_busy = 0;
    for (uint8_t i = 0; i < SCOPE_MAX_CACHE; i++) {
        if (scope_sample_arr[i] == NULL)
            break;
        scope_sample_arr[i]->sample_flag = Scope_Sample_Not;
        scope_sample_arr[i]->is_handle = 0;
    }
}

// 处理采样数据
// 计算：最大值、最小值、平均值、周期、绘图数据
// 返回值：表示是否触发且数据量充足
static uint8_t Scope_Sample_Process_Sub(Scope_Sample *sample) {
    uint8_t rst;

    for (uint8_t k = 0; k < SCOPE_CHANNEL_NUM; k++) {
        // 计算最小值、最大值、平均值
        uint16_t min = UINT16_MAX, max = 0;
        float avg;
        uint32_t sum = 0;
        for (uint16_t i = 0; i < SCOPE_SAMPLE_NUM; i++) {
            if (sample->data[i][k] > max) max = sample->data[i][k];
            if (sample->data[i][k] < min) min = sample->data[i][k];
            sum += sample->data[i][k];
        }
        avg = (float) sum / SCOPE_SAMPLE_NUM;
        // 因输入反相，输入最大值为数据最小值
        sample->vpp[k] = toVoltage(min) - toVoltage(max);
        sample->avg[k] = toVoltage(avg);

        // 找到所有的上升沿、下降沿
        float tri_data = toData(scope_tri_voltage);
        uint16_t edges[2][SCOPE_MAX_EDGE];
        uint16_t edges_cnt[2] = {0};
        for (uint16_t i = SCOPE_TRI_CHECK_NUM; i < (uint16_t) (SCOPE_SAMPLE_NUM - SCOPE_TRI_CHECK_NUM); i++) {
            // 检测数据上升沿
            uint8_t cnt = 0;
            for (uint8_t j = 1; j <= SCOPE_TRI_CHECK_NUM; j++) {
                if ((float) sample->data[i - j][k] < tri_data && (float) sample->data[i + j][k] > tri_data)
                    cnt++;
                else
                    break;
            }
            if (cnt == SCOPE_TRI_CHECK_NUM && (float) sample->data[i][k] < tri_data) {
                edges[Scope_Edge_Rise][edges_cnt[Scope_Edge_Rise]++] = i;
                if (edges_cnt[Scope_Edge_Rise] >= SCOPE_MAX_EDGE) { // 边沿数超出上限
                    edges_cnt[Scope_Edge_Rise] = edges_cnt[Scope_Edge_Fall] = 0;
                    break;
                }
            }

            // 检查数据下降沿
            cnt = 0;
            for (uint8_t j = 1; j <= SCOPE_TRI_CHECK_NUM; j++) {
                if ((float) sample->data[i - j][k] > tri_data && (float) sample->data[i + j][k] < tri_data)
                    cnt++;
                else
                    break;
            }
            if (cnt == SCOPE_TRI_CHECK_NUM && (float) sample->data[i][k] > tri_data) {
                edges[Scope_Edge_Fall][edges_cnt[Scope_Edge_Fall]++] = i;
                if (edges_cnt[Scope_Edge_Fall] >= SCOPE_MAX_EDGE) { // 边沿数超出上限
                    edges_cnt[Scope_Edge_Rise] = edges_cnt[Scope_Edge_Fall] = 0;
                    break;
                }
            }
        }

        // 计算周期
        float cycle = 0.0f;
        if (edges_cnt[Scope_Edge_Rise] > 1 && edges_cnt[Scope_Edge_Fall] > 1) {
            float cycle1 =
                    (float) (edges[Scope_Edge_Rise][edges_cnt[Scope_Edge_Rise] - 1] - edges[Scope_Edge_Rise][0]) /
                    (float) (edges_cnt[Scope_Edge_Rise] - 1);
            float cycle2 =
                    (float) (edges[Scope_Edge_Fall][edges_cnt[Scope_Edge_Fall] - 1] - edges[Scope_Edge_Fall][0]) /
                    (float) (edges_cnt[Scope_Edge_Fall] - 1);
            cycle = (cycle1 + cycle2) / 2;
        } else if (edges_cnt[Scope_Edge_Rise] > 1) {
            float cycle1 =
                    (float) (edges[Scope_Edge_Rise][edges_cnt[Scope_Edge_Rise] - 1] - edges[Scope_Edge_Rise][0]) /
                    (float) (edges_cnt[Scope_Edge_Rise] - 1);
            cycle = cycle1;
        } else if (edges_cnt[Scope_Edge_Fall] > 1) {
            float cycle2 =
                    (float) (edges[Scope_Edge_Fall][edges_cnt[Scope_Edge_Fall] - 1] - edges[Scope_Edge_Fall][0]) /
                    (float) (edges_cnt[Scope_Edge_Fall] - 1);
            cycle = cycle2;
        }
        sample->freq[k] = toFreq(cycle);

        // Channel1为触发通道
        if (k == scope_tri_channel) {
            // 选取最佳触发位置：最居中的触发位置
            uint16_t min_diff = UINT16_MAX, min_diff_p = 0;
            for (uint16_t i = 0; i < edges_cnt[!scope_tri_edge]; i++) { // 因输入反相，输入上升沿是数据下降沿
                int diff = abs((int) edges[!scope_tri_edge][i] * 2 - SCOPE_SAMPLE_NUM);
                if (diff < min_diff) {
                    min_diff = diff;
                    min_diff_p = edges[!scope_tri_edge][i];
                }
            }
            uint16_t tri_p = min_diff_p;

            // 检查是否有足够的数据用于绘图
            uint16_t max_len = Min(tri_p, SCOPE_SAMPLE_NUM - tri_p) * 2;
            // 采样率 * 示波器横轴总时间 = 所需样本数
            uint16_t need_len = (uint16_t) (
                    scope_sample_rate / 1000.0f * (scope_ms_div[scope_ms_div_select] * SCOPE_X_GRID) + 0.5f);
            if (max_len < need_len || min_diff_p == 0) { // min_diff_p == 0 说明边沿数为0（也有可能是因为超出上限而被置为0）
                tri_p = need_len / 2;
                rst = 0;
            } else {
                rst = 1;
            }

            // 标记有效绘图数据在原数组中的位置
            sample->sp = tri_p - need_len / 2;
            sample->len = need_len;
        }

    }

    return rst;
}

/*-----------------------------------------------------接口函数-----------------------------------------------------*/

void Scope_Sample_Init(void) {
    // 申请变量空间
    for (uint8_t i = 0; i < SCOPE_MAX_CACHE; i++) {
        scope_sample_arr[i] = (Scope_Sample *) malloc(sizeof(Scope_Sample));
        if (scope_sample_arr[i] == NULL)
            break;
    }

    Scope_Sample_Refresh_Sample_Rate();
}

void Scope_Sample_DeInit(void) {
    HAL_TIM_Base_Stop(&SCOPE_htim);
    HAL_ADC_Stop_DMA(&SCOPE_hadc);

    // 释放变量空间
    for (uint8_t i = 0; i < SCOPE_MAX_CACHE; i++) {
        if (scope_sample_arr[i] == NULL)
            break;
        free(scope_sample_arr[i]);
        scope_sample_arr[i] = NULL;
    }
}

// 自动计算并设置合适的采样率
void Scope_Sample_Refresh_Sample_Rate(void) {
    HAL_TIM_Base_Stop(&SCOPE_htim);
    HAL_ADC_Stop_DMA(&SCOPE_hadc);

    // 采样率 * 示波器横轴总时间 = 绘图所需样本数
    // sample_num = k * 绘图所需样本数
    // sample_rate * (ms_div * grid) * k = sample_num
    // sample_rate = sample_num / ms_div / grid / k
//    scope_sample_rate = 1000.0f * SCOPE_SAMPLE_NUM / scope_ms_div[scope_ms_div_select] / SCOPE_X_GRID / SCOPE_SAMPLE_K;
    scope_sample_rate =
            (1000.0f * SCOPE_SAMPLE_NUM / SCOPE_X_GRID / SCOPE_SAMPLE_K) / scope_ms_div[scope_ms_div_select];
    if (scope_sample_rate > SCOPE_MAX_SAMPLE_RATE)
        scope_sample_rate = SCOPE_MAX_SAMPLE_RATE;
    Set_TIM_Freq(&SCOPE_htim, scope_sample_rate);

    Clear_Flag();
    Scope_Sample_Try_Start_New_ADC();
}

void Scope_Sample_Try_Process(void) {
    static uint32_t last_success_t = 0;

    for (uint8_t i = 0; i < SCOPE_MAX_CACHE; i++) {
        if (scope_sample_arr[i] == NULL)
            break;
        if (scope_sample_arr[i]->sample_flag == Scope_Sample_Finished && scope_sample_arr[i]->is_handle == 0) {
            if (Scope_Sample_Process_Sub(scope_sample_arr[i])) {
                last_success_t = HAL_GetTick();
                scope_sample_arr[i]->is_handle = 1;
            } else {
                if (HAL_GetTick() - last_success_t <= SCOPE_MAX_FAIL_T) { // 偶尔几次采样不符合要求，就跳过
                    scope_sample_arr[i]->sample_flag = Scope_Sample_Not;
                    Scope_Sample_Try_Start_New_ADC();
                } else { // 连续多次采样不符合要求，进入滚动模式
                    scope_sample_arr[i]->is_handle = 1;
                }
            }
        }
    }
}

// 在以下几个位置被调用：
// DMA全传输完成中断
// UI绘图消耗掉一组数据
// 重新设置采样率
void Scope_Sample_Try_Start_New_ADC(void) {
    static uint8_t busy;
    if (busy == 1)
        return;
    busy = 1;

    if (!dma_busy) {
        for (uint8_t i = 0; i < SCOPE_MAX_CACHE; i++) {
            if (scope_sample_arr[i] == NULL)
                break;
            if (scope_sample_arr[i]->sample_flag == Scope_Sample_Not) {
                dma_busy = 1;
                scope_sample_arr[i]->sample_flag = Scope_Sample_Doing;
                HAL_ADC_Start_DMA(&SCOPE_hadc, (uint32_t *) scope_sample_arr[i]->data, SCOPE_SAMPLE_NUM * SCOPE_CHANNEL_NUM);
                HAL_TIM_Base_Start(&SCOPE_htim);
                break;
            }
        }
    }

    busy = 0;
}

/*-----------------------------------------------------回调函数-----------------------------------------------------*/

void Scope_Sample_ADC_ConvCpltCallback(ADC_HandleTypeDef *hadc)
{
    UNUSED(hadc);
    HAL_TIM_Base_Stop(&SCOPE_htim);
    HAL_ADC_Stop_DMA(&SCOPE_hadc);
    dma_busy = 0;
    for (uint8_t i = 0; i < SCOPE_MAX_CACHE; i++) {
        if (scope_sample_arr[i]->sample_flag == Scope_Sample_Doing) {
            scope_sample_arr[i]->sample_flag = Scope_Sample_Finished;
            break;
        }
    }
    Scope_Sample_Try_Start_New_ADC();
}
