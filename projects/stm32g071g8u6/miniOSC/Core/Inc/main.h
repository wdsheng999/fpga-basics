/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32g0xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

void HAL_TIM_MspPostInit(TIM_HandleTypeDef *htim);

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define Ain_Pin GPIO_PIN_0
#define Ain_GPIO_Port GPIOA
#define Aux_Pin GPIO_PIN_1
#define Aux_GPIO_Port GPIOA
#define TXD_Pin GPIO_PIN_2
#define TXD_GPIO_Port GPIOA
#define RXD_Pin GPIO_PIN_3
#define RXD_GPIO_Port GPIOA
#define Mic_Pin GPIO_PIN_4
#define Mic_GPIO_Port GPIOA
#define OLED_DC_Pin GPIO_PIN_6
#define OLED_DC_GPIO_Port GPIOA
#define OLED_RES_Pin GPIO_PIN_7
#define OLED_RES_GPIO_Port GPIOA
#define Key_OK_Pin GPIO_PIN_0
#define Key_OK_GPIO_Port GPIOB
#define Key_OK_EXTI_IRQn EXTI0_1_IRQn
#define Key_L_Pin GPIO_PIN_1
#define Key_L_GPIO_Port GPIOB
#define Key_L_EXTI_IRQn EXTI0_1_IRQn
#define Key_R_Pin GPIO_PIN_8
#define Key_R_GPIO_Port GPIOA
#define Key_R_EXTI_IRQn EXTI4_15_IRQn
#define Key_D_Pin GPIO_PIN_6
#define Key_D_GPIO_Port GPIOC
#define Key_D_EXTI_IRQn EXTI4_15_IRQn
#define Key_U_Pin GPIO_PIN_11
#define Key_U_GPIO_Port GPIOA
#define Key_U_EXTI_IRQn EXTI4_15_IRQn
#define OLED_CLK_Pin GPIO_PIN_15
#define OLED_CLK_GPIO_Port GPIOA
#define OLED_DIN_Pin GPIO_PIN_3
#define OLED_DIN_GPIO_Port GPIOB
#define STA_LED_Pin GPIO_PIN_8
#define STA_LED_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

/* User can use this section to tailor ADCx instance under use and associated
   resources */

/* Definitions of data related to this example */
  /* Full-scale digital value with a resolution of 12 bits (voltage range     */
  /* determined by analog voltage references Vref+ and Vref-,                 */
  /* refer to reference manual).                                              */
  #define DIGITAL_SCALE_12BITS             ((uint32_t) 0xFFF)

  /* Init variable out of ADC expected conversion data range */
  #define VAR_CONVERTED_DATA_INIT_VALUE    (DIGITAL_SCALE_12BITS + 1)

  /* Definition of ADCx conversions data table size */
  #define ADC_CONVERTED_DATA_BUFFER_SIZE   ((uint32_t)  128)

/* Compute the prescaler value to have TIM1 counter clock equal to 64000000 Hz */
#define TIM1_PRESCALER_VALUE     (uint32_t)(((SystemCoreClock) / 64000000) - 1)
/*TIM1 Channel1 duty cycle = (TIM1_CCR1/ TIM1_ARR + 1)* 100 = 50%*/
#define TIM1_PERIOD_VALUE       (uint32_t)(40000 - 1)              /* Period Value  */
#define TIM1_PULSE1_VALUE       (uint32_t)(40000 * 50 / 100)     /* Capture Compare 1 Value  */

/* Compute the prescaler value to have TIM1 counter clock equal to 64000000 Hz */
#define TIM2_PRESCALER_VALUE     (uint32_t)(((SystemCoreClock) / 64000000) - 1)
/*TIM1 Channel1 duty cycle = (TIM1_CCR1/ TIM1_ARR + 1)* 100 = 50%*/
#define TIM2_PERIOD_VALUE       (uint32_t)(256 - 1)              /* Period Value  */
#define TIM2_PULSE1_VALUE       (uint32_t)(256 * 50 / 100)     /* Capture Compare 1 Value  */

/* Compute the prescaler value to have TIM1 counter clock equal to 64000000 Hz */
#define TIM3_PRESCALER_VALUE     (uint32_t)(((SystemCoreClock) / 64000000) - 1)
/*TIM1 Channel1 duty cycle = (TIM1_CCR1/ TIM1_ARR + 1)* 100 = 50%*/
#define TIM3_PERIOD_VALUE       (uint32_t)(16 - 1)              /* Period Value  */
#define TIM3_PULSE1_VALUE       (uint32_t)(8)     /* Capture Compare 1 Value  */

/* Compute the prescaler value to have TIM1 counter clock equal to 64000000 Hz */
#define TIM16_PRESCALER_VALUE     (uint32_t)(((SystemCoreClock) / 64000000) - 1)
/*TIM1 Channel1 duty cycle = (TIM1_CCR1/ TIM1_ARR + 1)* 100 = 50%*/
#define TIM16_PERIOD_VALUE       (uint32_t)(2667 - 1)              /* Period Value  */
#define TIM16_PULSE1_VALUE       (uint32_t)(2667 * 20 / 100)     /* Capture Compare 1 Value  */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
