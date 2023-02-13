#include "app.h"

void Scope_Init(void) {
    scope_exit = 0;
    Scope_Sample_Init();
    Scope_UI_Init();
    Scope_Operate_Init();
}

void Scope_DeInit(void) {
    Scope_Sample_DeInit();
    Scope_UI_DeInit();
    Scope_Operate_DeInit();
}

// 返回1表示退出示波器程序
uint8_t Scope_Loop(void) {
    Scope_Sample_Try_Process();
    Scope_UI_Try_Refresh(0);
    Scope_Operate_Try_Process();
    return scope_exit;
}
