/**
  @page DAC_SignalsGeneration DAC Signals generation example
  
  @verbatim
  ******************************************************************************
  * @file    DAC/DAC_SignalsGeneration/readme.txt 
  * @author  MCD Application Team
  * @brief   Description of the DAC Signals generation example.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  @endverbatim

@par Example Description 

How to use the DAC peripheral to generate several signals using the DMA
controller and the DAC internal wave generator.
For each press on User push-button, 
A signal has been selected and can be monitored on  
the DAC channel one:
    - Triangle waveform (Channel 1), amplitute: ~1V, frequency: order of Hz.
    - Escalator waveform (Channel 1) using DMA transfer, amplitute: ~3V, frequency: order of KHz.

	
NUCLEO-G0B1RE board's LED can be used to monitor the process status:
  - LED4 is slowly blinking (1 sec. period) and example is stopped (using infinite loop)
  when there is an error during process.

@note Care must be taken when using HAL_Delay(), this function provides accurate delay (in milliseconds)
      based on variable incremented in SysTick ISR. This implies that if HAL_Delay() is called from
      a peripheral ISR process, then the SysTick interrupt must have higher priority (numerically lower)
      than the peripheral interrupt. Otherwise the caller ISR process will be blocked.
      To change the SysTick interrupt priority you have to use HAL_NVIC_SetPriority() function.
      
@note The application need to ensure that the SysTick time base is always set to 1 millisecond
      to have correct HAL operation.

@par Keywords

Analog, DAC, Signals generation, DMA, Triangle, Escalator, Waveform, Amplitude

@par Directory contents 

  - DAC/DAC_SignalsGeneration/Inc/stm32g0xx_hal_conf.h    HAL configuration file
  - DAC/DAC_SignalsGeneration/Inc/stm32g0xx_it.h          DAC interrupt handlers header file
  - DAC/DAC_SignalsGeneration/Inc/main.h                  Header for main.c module  
  - DAC/DAC_SignalsGeneration/Src/stm32g0xx_it.c          DAC interrupt handlers
  - DAC/DAC_SignalsGeneration/Src/main.c                  Main program
  - DAC/DAC_SignalsGeneration/Src/stm32g0xx_hal_msp.c     HAL MSP file
  - DAC/DAC_SignalsGeneration/Src/system_stm32g0xx.c      STM32G0xx system source file

@par Hardware and Software environment  
  - This example runs on STM32G0B1RETx devices.
    
  - This example has been tested with NUCLEO-G0B1RE board and can be
    easily tailored to any other supported device and development board.

  - NUCLEO-G0B1RE Set-up :
      
      - Connect PA4 (DAC Channel1) (pin 32 in CN7) to an oscilloscope.
      
      - Use User push-button connected to PC.13.

@par How to use it ? 

In order to make the program work, you must do the following :
 - Open your preferred toolchain 
 - Rebuild all files and load your image into target memory
 - Run the example
  

 */

