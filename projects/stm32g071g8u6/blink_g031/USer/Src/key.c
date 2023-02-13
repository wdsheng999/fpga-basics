#include "key.h"

/*-----------------------------------------------------队列-----------------------------------------------------*/

static uint8_t queue[KEY_QUEUE_SIZE];
static uint8_t head = 0; // 指向队列第一个元素
static uint8_t tail = 0; // 指向队列最后一个元素的后一个

void Key_Push(Key key) {
    if (Key_Size() < KEY_QUEUE_SIZE) {
        queue[tail] = key;
        tail = (tail + 1) % KEY_QUEUE_SIZE;
    }
}

Key Key_Pop(void) {
    if (!Key_Empty()) {
        Key key = queue[head];
        head = (head + 1) % KEY_QUEUE_SIZE;
        return key;
    } else {
        return -1;
    }
}

void Key_Clear(void) {
    head = tail;
}

uint8_t Key_Empty(void) {
    return head == tail;
}

uint8_t Key_Size(void) {
    if (head >= tail)
        return head - tail;
    else
        return KEY_QUEUE_SIZE - tail + head;
}

/*-----------------------------------------------------检测-----------------------------------------------------*/

static uint32_t t1, t2; // 去抖动

static void Key_Scan(void) {
    typedef struct {
        GPIO_TypeDef *port;
        uint16_t pin;
    } GPIO;
    static const GPIO gpio[] = {
            {KEY_1_GPIO_Port, KEY_1_Pin},
            {KEY_2_GPIO_Port, KEY_2_Pin},
            {ENCODER_C_GPIO_Port, ENCODER_C_Pin}
    }; // 需要与枚举结构体的顺序保持一致
    static const uint8_t gpio_size = sizeof(gpio) / sizeof(gpio[0]);

    static uint8_t status[] = {1, 1, 1}; // 按键初始值为高电平

    for (uint8_t i = 0; i < gpio_size; i++) {
        uint8_t now_status = HAL_GPIO_ReadPin(gpio[i].port, gpio[i].pin);
        if (now_status != status[i]) { // 按键状态发生变化
            if (now_status) // 目前为高电平 -> 松开
                Key_Push(i);
            status[i] = now_status;
        }
    }
}

static void Encoder_Scan(void) {
    static uint8_t status = 1; // 初始值为高电平

    uint8_t now_status = HAL_GPIO_ReadPin(ENCODER_A_GPIO_Port, ENCODER_A_Pin);
    if (now_status != status) { // 按键状态发生变化
        if (!now_status) { // 目前为低电平，开始拨动，“按下”
            if (HAL_GPIO_ReadPin(ENCODER_B_GPIO_Port, ENCODER_B_Pin))
                Key_Push(Key_R);
            else
                Key_Push(Key_L);
        }
        status = now_status;
    }
}

void Key_Init(void) {
    Set_TIM_Freq(&KEY_HTIM, 1000);
}

void Key_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {
    UNUSED(GPIO_Pin);
    t1 = HAL_GetTick() + KEY_DEBOUNCE_T1;
    t2 = HAL_GetTick() + KEY_DEBOUNCE_T2;
    HAL_TIM_Base_Start_IT(&KEY_HTIM);
}

void Key_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
    if (htim == &KEY_HTIM) {
        if (t1 != 0 && HAL_GetTick() >= t1) {
            t1 = 0;
            Encoder_Scan();
        } else if (HAL_GetTick() >= t2) {
            Key_Scan();
            HAL_TIM_Base_Stop_IT(&KEY_HTIM);
        }
    }
}
