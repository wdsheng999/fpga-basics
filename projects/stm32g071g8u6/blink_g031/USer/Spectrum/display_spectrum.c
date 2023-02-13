#include "display_spectrum.h"

#include <string.h> // strlen

/*-----------------------------------------------------静态函数-----------------------------------------------------*/

// 画和y轴平行的虚线，space为间隔的像素点数
static void Draw_Dotted_Line_X(uint8_t y, uint8_t x1, uint8_t x2, uint8_t space) {
    for (uint8_t i = x1; i < x2; i += space)
        OLED_DrawPoint(i, y, 1);
}

// 画和y轴平行的虚线，space为间隔的像素点数
static void Draw_Dotted_Line_Y(uint8_t x, uint8_t y1, uint8_t y2, uint8_t space) {
    for (uint8_t i = y1; i < y2; i += space)
        OLED_DrawPoint(x, i, 1);
}

static void Show_Framework() {
    // 绘制边框
    OLED_DrawLine(SPECTRUM_X_MIN, SPECTRUM_Y_MIN, SPECTRUM_X_MIN, SPECTRUM_Y_MAX, 1);
    OLED_DrawLine(SPECTRUM_X_MIN, SPECTRUM_Y_MIN, SPECTRUM_X_MAX, SPECTRUM_Y_MIN, 1);
    OLED_DrawLine(SPECTRUM_X_MAX, SPECTRUM_Y_MAX, SPECTRUM_X_MIN, SPECTRUM_Y_MAX, 1);
    OLED_DrawLine(SPECTRUM_X_MAX, SPECTRUM_Y_MAX, SPECTRUM_X_MAX, SPECTRUM_Y_MIN, 1);

#pragma clang diagnostic push
#pragma ide diagnostic ignored "cert-flp30-c"
    // 绘制刻度线
    // 和x轴平行的线
    for (float i = SPECTRUM_Y_MAX; i > SPECTRUM_Y_MIN; i -= SPECTRUM_Y_POINTS_DIV)
        Draw_Dotted_Line_X((uint8_t) (i + 0.5f), SPECTRUM_X_MIN, SPECTRUM_X_MAX, 3);
//        OLED_DrawLine(SPECTRUM_X_MIN, (uint8_t) (i + 0.5f), SPECTRUM_X_MAX, (uint8_t) (i + 0.5f), 1);

    // 和y轴平行的线
    for (float i = SPECTRUM_X_MIN; i < SPECTRUM_X_MAX; i += SPECTRUM_X_POINTS_DIV)
        Draw_Dotted_Line_Y((uint8_t) (i + 0.5f), SPECTRUM_Y_MIN, SPECTRUM_Y_MAX, 3);
//        OLED_DrawLine((uint8_t) (i + 0.5f),SPECTRUM_Y_MIN, (uint8_t) (i + 0.5f), SPECTRUM_Y_MAX, 1);
#pragma clang diagnostic pop

    OLED_ShowString(39, 0, "Spectrum", 8, 1);

    // 显示刻度选择
    OLED_ShowString(0, 0, spectrum_KHz_max_label[spectrum_KHz_max_select], 8, spectrum_key_l_r_func);
    uint8_t len = strlen(spectrum_voltage_div_label[spectrum_voltage_div_select]);
    OLED_ShowString(127 - len * 6, 0, spectrum_voltage_div_label[spectrum_voltage_div_select], 8,
                    !spectrum_key_l_r_func);
}

static void Show_Wave(Spectrum_Sample *sample) {
    float ratio = (float) (SPECTRUM_SAMPLE_NUM / 2.0f - 1.0f) / (float) (SPECTRUM_X_NUM - 1);
    float j = 0; // 循环附元，表示原数据数组的下标
    uint16_t j_int = UINT16_MAX; // 第一个点一定有数据，这样便于绘制第一个点，+1后变为0
    uint16_t last_i[SPECTRUM_CHANNEL_NUM] = {0}, last_val[SPECTRUM_CHANNEL_NUM];
    for (uint16_t i = 0; i < SPECTRUM_X_NUM; i++) { // 以示波器的横轴每个像素点为循环主元
        if ((uint16_t) j != j_int) { // j累计到一个新整数
            j_int++;

            for (uint8_t k = 0; k < SPECTRUM_CHANNEL_NUM; k++) {
                float voltage = sample->data[k][j_int] / (SPECTRUM_SAMPLE_NUM / 2.0f); // FFT把数据放大了(n/2)倍，n为FFT长度
                int16_t val = (int16_t) (SPECTRUM_Y_MAX - (voltage / spectrum_voltage_div[spectrum_voltage_div_select] *
                                                           SPECTRUM_Y_POINTS_DIV));
                // 限值：上限与下限
                if (val < SPECTRUM_Y_MIN) val = SPECTRUM_Y_MIN;
                if (val > SPECTRUM_Y_MAX) val = SPECTRUM_Y_MAX;

                if (j_int != 0)
                    OLED_DrawLine(SPECTRUM_X_MIN + last_i[k], last_val[k], SPECTRUM_X_MIN + i, val, 1);
                last_i[k] = i;
                last_val[k] = val;
            }
        }
        j += ratio;
    }
}

static void Show_Information(Spectrum_Sample *sample) {
    char str_buf[10]; // 字符串缓冲区
    uint8_t len;

    // 显示测量参数
    // Channel1
    OLED_ShowString(0, 104, "CH1", 8, 1);
    floatToStr(str_buf, sample->bias[0], 1);
    strcat(str_buf, "V");
    OLED_ShowString(22, 104, str_buf, 8, 1);

    len = floatToStr(str_buf, sample->max[0], 1) + 1;
    strcat(str_buf, "V");
    OLED_ShowString(64 - len * 3, 104, str_buf, 8, 1);

    len = floatToStr(str_buf, sample->freq[0], 0) + 2;
    strcat(str_buf, "Hz");
    OLED_ShowString(127 - len * 6, 104, str_buf, 8, 1);

    // Channel2
    OLED_ShowString(0, 112, "CH2", 8, 1);
    floatToStr(str_buf, sample->bias[1], 1);
    strcat(str_buf, "V");
    OLED_ShowString(22, 112, str_buf, 8, 1);

    len = floatToStr(str_buf, sample->max[1], 1) + 1;
    strcat(str_buf, "V");
    OLED_ShowString(64 - len * 3, 112, str_buf, 8, 1);

    len = floatToStr(str_buf, sample->freq[1], 0) + 2;
    strcat(str_buf, "Hz");
    OLED_ShowString(127 - len * 6, 112, str_buf, 8, 1);
}

static void Spectrum_UI_Refresh_Sub(Spectrum_Sample *sample) {
    OLED_Clear();
    Show_Framework();
    Show_Wave(sample);
    Show_Information(sample);
    OLED_Refresh();
}

/*-----------------------------------------------------接口函数-----------------------------------------------------*/

void Spectrum_UI_Init(void) {
    OLED_Clear();
    Show_Framework();
    OLED_Refresh();
}

void Spectrum_UI_DeInit(void) {
    OLED_Clear();
    OLED_Refresh();
}

void Spectrum_UI_Try_Refresh(uint8_t force) {
    uint8_t success = 0;
    if (!spectrum_hold) {
        for (uint8_t i = 0; i < SPECTRUM_MAX_CACHE; i++) {
            if (spectrum_sample_arr[i] == NULL)
                break;
            if (spectrum_sample_arr[i]->is_handle == 1) {
                Spectrum_UI_Refresh_Sub(spectrum_sample_arr[i]);
                spectrum_sample_arr[i]->sample_flag = Spectrum_Sample_Not;
                spectrum_sample_arr[i]->is_handle = 0;
                Spectrum_Sample_Try_Start_New_ADC();
                success = 1;
                break; // 只渲染一帧
            }
        }
    }
    if (!success && force) {
        OLED_Clear();
        Show_Framework();
        OLED_Refresh();
    }
}
