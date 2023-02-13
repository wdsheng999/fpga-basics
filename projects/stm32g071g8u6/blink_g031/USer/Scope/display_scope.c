#include "display_scope.h"

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

static uint16_t Voltage_To_Coordinate(float voltage) {
    int16_t val = (int16_t) ((SCOPE_Y_MIN + SCOPE_Y_MAX) / 2.0f -
                             (voltage / scope_voltage_div[scope_voltage_div_select] * SCOPE_Y_POINTS_DIV));
    // 限值：上限与下限
    if (val < SCOPE_Y_MIN) val = SCOPE_Y_MIN;
    if (val > SCOPE_Y_MAX) val = SCOPE_Y_MAX;

    return val;
}

static void Show_Framework() {
    // 绘制边框
    OLED_DrawLine(SCOPE_X_MIN, SCOPE_Y_MIN, SCOPE_X_MIN, SCOPE_Y_MAX, 1);
    OLED_DrawLine(SCOPE_X_MIN, SCOPE_Y_MIN, SCOPE_X_MAX, SCOPE_Y_MIN, 1);
    OLED_DrawLine(SCOPE_X_MAX, SCOPE_Y_MAX, SCOPE_X_MIN, SCOPE_Y_MAX, 1);
    OLED_DrawLine(SCOPE_X_MAX, SCOPE_Y_MAX, SCOPE_X_MAX, SCOPE_Y_MIN, 1);

#pragma clang diagnostic push
#pragma ide diagnostic ignored "cert-flp30-c"
    // 绘制刻度线
    // 和x轴平行的线
    Draw_Dotted_Line_X(SCOPE_Y_MIN + (float) SCOPE_Y_NUM / 2, SCOPE_X_MIN, SCOPE_X_MAX, 2);
    for (float i = SCOPE_Y_MIN + (float) SCOPE_Y_NUM / 2 - SCOPE_Y_POINTS_DIV; i > SCOPE_Y_MIN; i -= SCOPE_Y_POINTS_DIV)
        Draw_Dotted_Line_X((uint8_t) (i + 0.5f), SCOPE_X_MIN, SCOPE_X_MAX, 3);
//        OLED_DrawLine(SCOPE_X_MIN, (uint8_t) (i + 0.5f), SCOPE_X_MAX, (uint8_t) (i + 0.5f), 1);
    for (float i = SCOPE_Y_MIN + (float) SCOPE_Y_NUM / 2 + SCOPE_Y_POINTS_DIV; i < SCOPE_Y_MAX; i += SCOPE_Y_POINTS_DIV)
        Draw_Dotted_Line_X((uint8_t) (i + 0.5f), SCOPE_X_MIN, SCOPE_X_MAX, 3);
//        OLED_DrawLine(SCOPE_X_MIN, (uint8_t) (i + 0.5f), SCOPE_X_MAX, (uint8_t) (i + 0.5f), 1);

    // 和y轴平行的线
    Draw_Dotted_Line_Y(SCOPE_X_MIN + (float) SCOPE_X_NUM / 2, SCOPE_Y_MIN, SCOPE_Y_MAX, 2);
    for (float i = SCOPE_X_MIN + (float) SCOPE_X_NUM / 2 - SCOPE_X_POINTS_DIV; i > SCOPE_X_MIN; i -= SCOPE_X_POINTS_DIV)
        Draw_Dotted_Line_Y((uint8_t) (i + 0.5f), SCOPE_Y_MIN, SCOPE_Y_MAX, 3);
//        OLED_DrawLine((uint8_t) (i + 0.5f),SCOPE_Y_MIN, (uint8_t) (i + 0.5f), SCOPE_Y_MAX, 1);
    for (float i = SCOPE_X_MIN + (float) SCOPE_X_NUM / 2 + SCOPE_X_POINTS_DIV; i < SCOPE_X_MAX; i += SCOPE_X_POINTS_DIV)
        Draw_Dotted_Line_Y((uint8_t) (i + 0.5f), SCOPE_Y_MIN, SCOPE_Y_MAX, 3);
//        OLED_DrawLine((uint8_t) (i + 0.5f),SCOPE_Y_MIN , (uint8_t) (i + 0.5f),SCOPE_Y_MAX , 1);
#pragma clang diagnostic pop

    OLED_ShowString(40, 0, "Wave", 8, 1);
    OLED_ShowString(80, 0, "Y", 8, 1);

    // 显示刻度选择、触发电平
    uint8_t len;
    switch (scope_key_l_r_func) {
        case 0:
            OLED_ShowString(0, 0, scope_ms_div_label[scope_ms_div_select], 8, 0);
            len = strlen(scope_voltage_div_label[scope_voltage_div_select]);
            OLED_ShowString(127 - len * 6, 0, scope_voltage_div_label[scope_voltage_div_select], 8, 1);
            break;

        case 1:
            OLED_ShowString(0, 0, scope_ms_div_label[scope_ms_div_select], 8, 1);
            len = strlen(scope_voltage_div_label[scope_voltage_div_select]);
            OLED_ShowString(127 - len * 6, 0, scope_voltage_div_label[scope_voltage_div_select], 8, 0);
            break;

        case 2:
            OLED_ShowString(0, 0, scope_ms_div_label[scope_ms_div_select], 8, 1);
            len = strlen(scope_voltage_div_label[scope_voltage_div_select]);
            OLED_ShowString(127 - len * 6, 0, scope_voltage_div_label[scope_voltage_div_select], 8, 1);
            uint16_t val = Voltage_To_Coordinate(scope_tri_voltage);
            OLED_DrawLine(SCOPE_X_MIN, val, SCOPE_X_MAX, val, 1);
            break;

        default:
            break;
    }

}

static void Show_Wave(Scope_Sample *sample) {
    float ratio = (float) (sample->len - 1) / (float) (SCOPE_X_NUM - 1);
    float j = 0; // 循环附元，表示原数据数组的下标
    uint16_t j_int = UINT16_MAX; // 第一个点一定有数据，这样便于绘制第一个点，+1后变为0
    uint16_t last_i[SCOPE_CHANNEL_NUM] = {0}, last_val[SCOPE_CHANNEL_NUM];
    for (uint16_t i = 0; i < SCOPE_X_NUM; i++) { // 以示波器的横轴每个像素点为循环主元
        if ((uint16_t) j != j_int) { // j累计到一个新整数
            j_int++;

            for (uint8_t k = 0; k < SCOPE_CHANNEL_NUM; k++) {
                float voltage = toVoltage(sample->data[sample->sp + j_int][k]);
                uint16_t val = Voltage_To_Coordinate(voltage);

                if (j_int != 0)
                    OLED_DrawLine(SCOPE_X_MIN + last_i[k], last_val[k], SCOPE_X_MIN + i, val, 1);
                last_i[k] = i;
                last_val[k] = val;
            }
        }
        j += ratio;
    }
}

static void Show_Information(Scope_Sample *sample) {
    char str_buf[10]; // 字符串缓冲区
    uint8_t len;

    // 显示测量参数
    // Channel1
    OLED_ShowString(0, 104, "CH1", 8, 1);
    floatToStr(str_buf, sample->vpp[0], 1);
    strcat(str_buf, "V");
    OLED_ShowString(22, 104, str_buf, 8, 1);

    len = floatToStr(str_buf, sample->avg[0], 1) + 1;
    strcat(str_buf, "V");
    OLED_ShowString(64 - len * 3, 104, str_buf, 8, 1);

    len = floatToStr(str_buf, sample->freq[0], 0) + 2;
    strcat(str_buf, "Hz");
    OLED_ShowString(127 - len * 6, 104, str_buf, 8, 1);

    // Channel2
    OLED_ShowString(0, 112, "CH2", 8, 1);
    floatToStr(str_buf, sample->vpp[1], 1);
    strcat(str_buf, "V");
    OLED_ShowString(22, 112, str_buf, 8, 1);

    len = floatToStr(str_buf, sample->avg[1], 1) + 1;
    strcat(str_buf, "V");
    OLED_ShowString(64 - len * 3, 112, str_buf, 8, 1);

    len = floatToStr(str_buf, sample->freq[1], 0) + 2;
    strcat(str_buf, "Hz");
    OLED_ShowString(127 - len * 6, 112, str_buf, 8, 1);
}

static void Scope_UI_Refresh_Sub(Scope_Sample *sample) {
    OLED_Clear();
    Show_Framework();
    Show_Wave(sample);
    Show_Information(sample);
    OLED_Refresh();
}

/*-----------------------------------------------------接口函数-----------------------------------------------------*/

void Scope_UI_Init(void) {
    OLED_Clear();
    Show_Framework();
    OLED_Refresh();
}

void Scope_UI_DeInit(void) {
    OLED_Clear();
    OLED_Refresh();
}

// 返回值表示是否成功刷新
void Scope_UI_Try_Refresh(uint8_t force) {
    uint8_t success = 0;
    if (!scope_hold) {
        for (uint8_t i = 0; i < SCOPE_MAX_CACHE; i++) {
            if (scope_sample_arr[i] == NULL)
                break;
            if (scope_sample_arr[i]->is_handle == 1) {
                Scope_UI_Refresh_Sub(scope_sample_arr[i]);
                scope_sample_arr[i]->sample_flag = Scope_Sample_Not;
                scope_sample_arr[i]->is_handle = 0;
                Scope_Sample_Try_Start_New_ADC();
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
