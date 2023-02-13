#ifndef __SPECTRUM_INTERFACE_H__
#define __SPECTRUM_INTERFACE_H__

#include "os.h"
#include "settings1.h"
#include "global1.h"

#include "sample1.h"
#include "display_spectrum.h"
#include "operate1.h"

void Spectrum_Init(void);
void Spectrum_DeInit(void);
uint8_t Spectrum_Loop(void);

#endif
