#include "common.h"

#include <math.h> // __isinff

/*
(Bias - input) / 1MΩ = (output - B) / 0.5MΩ
=> input = 3Bias - 2 * output

output = 0    | input = 3B
output = 3.3V | input = 3B - 6.6V
avg = 3B - 3.3V | let avg = 0 | B = 1.1V
=> input = 3.3V - 2 * output
*/
float toVoltage(float data) {
    return 3.3f - 2.0f * ((float) data * (3.3f / 4096.0f));
}

float toData(float voltage) {
    return (3.3f - voltage) / (2.0f * 3.3f / 4096.0f);
}

void Set_TIM_Freq(TIM_HandleTypeDef *htim, float freq) {
    uint32_t prescaler = 1;

    while ((float) HCLK / (float) prescaler / freq > 65535) {
        do {
            prescaler++;
        } while (HCLK % prescaler);
    }
    htim->Instance->PSC = prescaler - 1;
    htim->Instance->ARR = (uint16_t) ((float) HCLK / (float) prescaler / freq) - 1;
}

// 倒序数组，用于floatToStr()
static inline void invert(char str[], uint8_t st, uint8_t ed) {
    for (uint8_t i = 0; i <= (uint8_t) (ed - st) / 2; i++) {
        char tmp = str[st + i];
        str[st + i] = str[ed - i];
        str[ed - i] = tmp;
    }
}

// 浮点数转字符串，size为小数位数
uint8_t floatToStr(char str[], float num, uint8_t size) {
    if (__isinff(num)) {
        str[0] = '-';
        str[1] = '-';
        str[2] = 0;
        return 2;
    }

    uint8_t p = 0; // str待写入的位置

    // 负号处理
    uint8_t is_negative = 0; // 负数标志
    if (num < 0) {
        is_negative = 1;
        str[p++] = '-';
        num = -num;
    }

    uint32_t integer = (uint32_t) num;
    float decimal = num - (float) integer;

    // 整数部分处理
    if (integer == 0)
        str[p++] = '0';
    else {
        while (integer) {
            str[p++] = integer % 10 + '0';
            integer /= 10;
        }
        // 倒序
        if (is_negative)
            invert(str, 1, p - 1);
        else
            invert(str, 0, p - 1);
    }

    // 小数部分处理
    if (size > 0)
        str[p++] = '.';
    for (uint8_t i = 0; i < size; i++) {
        decimal *= 10;
        uint32_t tmp = (uint32_t) decimal;
        decimal -= (float) tmp;
        str[p++] = tmp + '0';
    }

    // 结尾补0，表示字符串结束
    str[p] = 0;
    return p;
}
