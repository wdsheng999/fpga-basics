#ifndef __SCOPE_APP_H__
#define __SCOPE_APP_H__

#include "os.h"
#include "settings.h"
#include "global.h"

#include "sample.h"
#include "display_scope.h"
#include "operate.h"

void Scope_Init(void);
void Scope_DeInit(void);
uint8_t Scope_Loop(void);

#endif
