/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
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
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "arm_math.h"
#include "arm_const_structs.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

#define DEBUGMODE 0
  /* Value of analog reference voltage (Vref+), connected to analog voltage   */
  /* supply Vdda (unit: mV).                                                  */
  #define VDDA_APPLI                       (3300U)
#define RisingEdge 0
#define FallingEdge 1

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
ADC_HandleTypeDef hadc1;
DMA_HandleTypeDef hdma_adc1;

UART_HandleTypeDef hlpuart1;

TIM_HandleTypeDef htim1;
TIM_HandleTypeDef htim2;
TIM_HandleTypeDef htim3;
TIM_HandleTypeDef htim16;
DMA_HandleTypeDef hdma_tim1_up;

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/

/* ADC handler declaration */
/* Variables for ADC conversion data */
__IO   uint16_t   aADCxConvertedData[ADC_CONVERTED_DATA_BUFFER_SIZE]; /* ADC group regular conversion data (array of data) */

/* Variable to report status of DMA transfer of ADC group regular conversions */
/*  0: DMA transfer is not completed                                          */
/*  1: DMA transfer is completed                                              */
/*  2: DMA transfer has not yet been started yet (initial state)              */
__IO   uint8_t ubDmaTransferStatus = 2; /* Variable set into DMA interruption callback */

/* Variable to manage push button on board: interface between ExtLine interruption and main program */
__IO   uint8_t ubUserButtonClickEvent = RESET;  /* Event detection: Set after User Button interrupt */

/* Variables for ADC conversion data computation to physical values */
__IO uint16_t uhADCxConvertedData_VoltageMic_mVolt = 0U;        /* Value of voltage on GPIO pin (on which is mapped ADC channel) calculated from ADC conversion data (unit: mV) */
__IO uint16_t uhADCxConvertedData_VoltageAin_mVolt = 0U;        /* Value of voltage on GPIO pin (on which is mapped ADC channel) calculated from ADC conversion data (unit: mV) */
__IO uint16_t uhADCxConvertedData_VrefInt_mVolt = 0U;            /* Value of internal voltage reference VrefInt calculated from ADC conversion data (unit: mV) */
__IO  int16_t hADCxConvertedData_Temperature_DegreeCelsius = 0U; /* Value of temperature calculated from ADC conversion data (unit: degree Celsius) */

float32_t adc_converted_data_f32[ADC_CONVERTED_DATA_BUFFER_SIZE*2];
static float32_t testOutput[ADC_CONVERTED_DATA_BUFFER_SIZE];
int32_t  aADCxConvertedSum;
uint16_t aADCxConvertedMax;
uint16_t aADCxConvertedMin;
uint16_t aADCxConvertedVpp;
uint16_t aADCxConvertedTrigger;
uint16_t aADCxConvertedTrigPos;
uint8_t cAtEdge=0;
uint8_t cUseChannel=0;
uint16_t Key_Pressed;
uint8_t Menu_cnt;
uint16_t TIM3_PERIOD_VAL[12]={16,32,64,128,320,640,1280,3200,6400,12800,32000,64000};
uint8_t *TIM3_PERIOD_CHR[12]={"4Msp","2Msp","1Msp","500k","200k","100k","50ks","20ks","10ks","5ksp","2ksp","1ksp"};
uint8_t TIM3_PERIOD_cnt;
uint8_t Wav_Frq = 0;
uint8_t AC_DC = 0;
uint8_t inDDS = 0;
float32_t fft_Max;
uint32_t fft_Max_Index;
float32_t freq_in;
int32_t TIM1_PERIOD_VAL;
int16_t tmp_phase;
int16_t tmp_ampl = 128;
int16_t tmp_offset = 128;
int16_t DDS_FREQ = 50;
uint8_t DDS_mode;
uint8_t *DDS_WAVE[3] = {" SIN"," TRI" ," SQU"};
uint32_t tmp_sinTable[32];

ADC_ChannelConfTypeDef sConfigAin = {.Channel = ADC_CHANNEL_0,.Rank = ADC_REGULAR_RANK_1,.SamplingTime = ADC_SAMPLINGTIME_COMMON_1};
ADC_ChannelConfTypeDef sConfigMic = {.Channel = ADC_CHANNEL_4,.Rank = ADC_REGULAR_RANK_1,.SamplingTime = ADC_SAMPLINGTIME_COMMON_1};
extern uint8_t OLED_GRAM[128][8];
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_ADC1_Init(void);
static void MX_LPUART1_UART_Init(void);
static void MX_TIM2_Init(void);
static void MX_TIM16_Init(void);
static void MX_TIM1_Init(void);
static void MX_TIM3_Init(void);
/* USER CODE BEGIN PFP */
#if defined (__ICCARM__) || defined (__ARMCC_VERSION)
#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#elif defined(__GNUC__)
   /* With GCC, small printf (option LD Linker->Libraries->Small printf
   set to 'Yes') calls __io_putchar() */
#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#endif /* __ICCARM__ || __ARMCC_VERSION */


/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/*TIM3: 16->4M SPS =>100K~200k
        32->2M SPS =>40K~200K
        64->1M SPS =>20K~100K
        128->500K SPS=>10K~50K
        256->250K SPS
        320->200K SPS=>5k~16K
        640->100K SPS=>2K~10K
        1280->50K SPS=>1K~5K
        3200->20K SPS=>500~2K
        6400->10K SPS=>200~1K
        12800->5K SPS=>100~500
        32000->2K SPS=>50~200
        64000->1K SPS=>20~100
        */




/*
 * TIM1:  1000 ->2K
 *        1333 ->1.5K
 *        2000 ->1K
 *        4000 ->500
 *        5000 ->400
 *        10000->200
 *        20000->100
 *        40000->50
 *
 */

void Update_DDS(int16_t amp, int16_t offset, uint8_t mode)
{
  int16_t temp;
  switch (mode)
  {
    case 0:
      for (tmp_phase = 0; tmp_phase < 32; tmp_phase++)
      {
        temp = tmp_ampl*sinf(tmp_phase*PI/16.0)+tmp_offset;
        temp = temp>256 ? 256 : temp<0 ? 0 : temp;
        tmp_sinTable[tmp_phase] =(uint16_t)temp;
      }
      break;
    case 1:
      for (tmp_phase = 0; tmp_phase < 16; tmp_phase++)
      {
        temp = tmp_ampl * (tmp_phase-8)/8.0 + tmp_offset;
        temp = temp>256 ? 256 : temp<0 ? 0 : temp;
        tmp_sinTable[tmp_phase] = (uint16_t)temp;
        tmp_sinTable[31 - tmp_phase] = (uint16_t)temp;
      }
      break;
    case 2:
      for (tmp_phase = 0; tmp_phase < 16; tmp_phase++)
      {
        temp = tmp_offset + tmp_ampl;
        temp = temp>256 ? 256 : temp<0 ? 0 : temp;
        tmp_sinTable[tmp_phase] = (uint16_t)temp;
      }
      for (tmp_phase = 16; tmp_phase < 32; tmp_phase++)
      {
        temp = tmp_offset - tmp_ampl;
        temp = temp>256 ? 256 : temp<0 ? 0 : temp;
        tmp_sinTable[tmp_phase] = (uint16_t)temp;
      }
      break;
    default:
      break;
  }
}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */
  uint32_t tmp_index_adc_converted_data = 0;
  uint8_t txt[10];
  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_ADC1_Init();
  MX_LPUART1_UART_Init();
  MX_TIM2_Init();
  MX_TIM16_Init();
  MX_TIM1_Init();
  MX_TIM3_Init();
  /* USER CODE BEGIN 2 */
  //ADC_ExternalTrigConvCmd
  for (tmp_index_adc_converted_data = 0; tmp_index_adc_converted_data < ADC_CONVERTED_DATA_BUFFER_SIZE; tmp_index_adc_converted_data++)
  {
    aADCxConvertedData[tmp_index_adc_converted_data] = VAR_CONVERTED_DATA_INIT_VALUE;
  }

  if (HAL_ADCEx_Calibration_Start(&hadc1) != HAL_OK)
  {
    /* Calibration Error */
    Error_Handler();
    printf("** ADC failed. ** \n\r");
  }

  /* Start ADC group regular conversion with DMA */
  if (HAL_ADC_Start_DMA(&hadc1,
                        (uint32_t *)aADCxConvertedData,
                        ADC_CONVERTED_DATA_BUFFER_SIZE
                       ) != HAL_OK)
  {
    /* ADC conversion start error */
    Error_Handler();
  }
  //HAL_TIM_PWM_Start_DMA
#if DEBUGMODE
  printf("** ADC finished successfully. ** \n\r");

  /* Output a message on Hyperterminal using printf function */
  printf("\n\r UART Printf Example: retarget the C library printf function to the UART\n\r");
  printf("** Test finished successfully. ** \n\r");
#endif

  /* Start channel 2 */
  if (HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_2) != HAL_OK)
  {
    /* PWM Generation Error */
    Error_Handler();
  }

  /* Start channel 2 */
  if (HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_2) != HAL_OK)
  {
    /* PWM Generation Error */
    Error_Handler();
  }

  /* Start channel 1*/
  if (HAL_TIM_PWM_Start(&htim16, TIM_CHANNEL_1) != HAL_OK)
  {
    /* PWM Generation Error */
    Error_Handler();
  }

  /* Start channel 2 */
  if (HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_3) != HAL_OK)
  {
    /* PWM Generation Error */
    Error_Handler();
  }

  /* Start Channel1 */
  if (HAL_TIM_Base_Start_IT(&htim1) != HAL_OK)
  {
    /* Starting Error */
    Error_Handler();
  }


  Update_DDS(tmp_ampl, tmp_offset, 0);
  //HAL_DMA_Start(&hdma_tim1_up, (uint32_t *)tmp_sinTable, &htim2.Instance->CCR2, 30);


  //HAL_GPIO_ReadPin(Key_OK_GPIO_Port, Key_OK_Pin);
  OLED_Init();

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */

  //OLED_ShowChinese(0,0,0,16,1);//

  //OLED_Refresh();
  while (1)
  {
    /* Wait for ADC conversion and DMA transfer completion (update of variable ubDmaTransferStatus) */
    //HAL_Delay(10);
    //while(ubDmaTransferStatus != 1){;}

    /* Check whether ADC has converted all ranks of the sequence */
    if (ubDmaTransferStatus == 1)
    {
      memset(OLED_GRAM, 0, sizeof(OLED_GRAM));
      if(Key_Pressed)
      {
        if (Key_Pressed & Key_OK_Pin)
        {
          inDDS = inDDS ? 0 : 1;
         __HAL_TIM_SET_COMPARE(&htim16,TIM_CHANNEL_1,20);
        }
        if (inDDS==1)
        {
          if (Key_Pressed & Key_U_Pin)
          {
            Menu_cnt = (Menu_cnt==0) ? 6 : (Menu_cnt-1);
            __HAL_TIM_SET_COMPARE(&htim16,TIM_CHANNEL_1,300);
          }
          if (Key_Pressed & Key_D_Pin)
          {
            Menu_cnt = (Menu_cnt==6) ? 0 : (Menu_cnt+1);
            __HAL_TIM_SET_COMPARE(&htim16,TIM_CHANNEL_1,500);
          }
          if (Key_Pressed & Key_L_Pin)
          {
            switch (Menu_cnt)
            {
              case 0:
                DDS_FREQ -= 50;
                DDS_FREQ = DDS_FREQ<50 ? 50 : DDS_FREQ;
                TIM1_PERIOD_VAL = (int)(2000000.0/DDS_FREQ+0.5);
                __HAL_TIM_SET_AUTORELOAD(&htim1, TIM1_PERIOD_VAL);
                break;
              case 1:
                tmp_ampl -= 16;
                Update_DDS(tmp_ampl, tmp_offset, DDS_mode);
                break;
              case 2:
                tmp_offset -= 16;
                Update_DDS(tmp_ampl, tmp_offset, DDS_mode);
                break;
              case 3:
                DDS_mode = DDS_mode>0 ? --DDS_mode : 0;
                Update_DDS(tmp_ampl, tmp_offset, DDS_mode);
                break;
              default:
                break;
           }
           __HAL_TIM_SET_COMPARE(&htim16,TIM_CHANNEL_1,100);
         }
          if (Key_Pressed & Key_R_Pin)
          {
            switch (Menu_cnt)
            {
              case 0:
                DDS_FREQ += 50;
                DDS_FREQ = DDS_FREQ>2000 ? 2000 : DDS_FREQ;
                TIM1_PERIOD_VAL = (int)(2000000.0/DDS_FREQ+0.5);
                __HAL_TIM_SET_AUTORELOAD(&htim1, TIM1_PERIOD_VAL);
                break;
              case 1:
                tmp_ampl += 16;
                Update_DDS(tmp_ampl, tmp_offset, DDS_mode);
                break;
              case 2:
                tmp_offset += 16;
                Update_DDS(tmp_ampl, tmp_offset, DDS_mode);
                break;
              case 3:
                DDS_mode = DDS_mode<2 ? ++DDS_mode : 2;
                Update_DDS(tmp_ampl, tmp_offset, DDS_mode);
              default:
                break;
             }
             __HAL_TIM_SET_COMPARE(&htim16,TIM_CHANNEL_1,200);
          }
        }
        else
        {
          if (Key_Pressed & Key_U_Pin)
          {
            Menu_cnt = (Menu_cnt==0) ? 6 : (Menu_cnt-1);
            __HAL_TIM_SET_COMPARE(&htim16,TIM_CHANNEL_1,300);
          }
          if (Key_Pressed & Key_D_Pin)
          {
            Menu_cnt = (Menu_cnt==6) ? 0 : (Menu_cnt+1);
            __HAL_TIM_SET_COMPARE(&htim16,TIM_CHANNEL_1,500);
          }
          if (Key_Pressed & Key_L_Pin)
          {
            switch (Menu_cnt)
            {
              case 0:
                (TIM3_PERIOD_cnt == 0) ? : (TIM3_PERIOD_cnt--);
                __HAL_TIM_SET_AUTORELOAD(&htim3,TIM3_PERIOD_VAL[TIM3_PERIOD_cnt]);
                break;
              case 1:
                cUseChannel = cUseChannel ? 0 : 1;
                if (HAL_ADC_ConfigChannel(&hadc1, cUseChannel==0?&sConfigAin:&sConfigMic) != HAL_OK)
                {
                  Error_Handler();
                }
                break;
              case 2:
                Wav_Frq = Wav_Frq ? 0 : 1;
                break;
              case 3:
                cAtEdge = cAtEdge ? 0 : 1;
                break;
              case 4:
                if(Wav_Frq == 0)
                  AC_DC = AC_DC ? 0 : 1;
                break;
              default:
                break;
           }
           __HAL_TIM_SET_COMPARE(&htim16,TIM_CHANNEL_1,100);
         }
          if (Key_Pressed & Key_R_Pin)
          {
            switch (Menu_cnt)
            {
              case 0:
                (TIM3_PERIOD_cnt == 11) ? :(TIM3_PERIOD_cnt++);
                __HAL_TIM_SET_AUTORELOAD(&htim3,TIM3_PERIOD_VAL[TIM3_PERIOD_cnt]);
                break;
              case 1:
                cUseChannel = cUseChannel ? 0 : 1;
                if (HAL_ADC_ConfigChannel(&hadc1, cUseChannel==0?&sConfigAin:&sConfigMic) != HAL_OK)
                {
                  Error_Handler();
                }
                break;
              case 2:
                Wav_Frq = Wav_Frq ? 0 : 1;
                break;
              case 3:
                cAtEdge = cAtEdge ? 0 : 1;
                break;
              case 4:
                if(Wav_Frq == 0)
                  AC_DC = AC_DC ? 0 : 1;
                break;
              default:
                break;
             }
             __HAL_TIM_SET_COMPARE(&htim16,TIM_CHANNEL_1,200);
          }
        }
        Key_Pressed=0;
      }

      aADCxConvertedSum = 0;
      aADCxConvertedMax = 0;
      aADCxConvertedMin = 3300;

      for (tmp_index_adc_converted_data = 0; tmp_index_adc_converted_data < ADC_CONVERTED_DATA_BUFFER_SIZE; tmp_index_adc_converted_data++)
      {
        aADCxConvertedData[tmp_index_adc_converted_data] = __LL_ADC_CALC_DATA_TO_VOLTAGE(VDDA_APPLI, aADCxConvertedData[tmp_index_adc_converted_data], LL_ADC_RESOLUTION_12B);
        aADCxConvertedSum += aADCxConvertedData[tmp_index_adc_converted_data];

        if (aADCxConvertedMax < aADCxConvertedData[tmp_index_adc_converted_data])
          aADCxConvertedMax = aADCxConvertedData[tmp_index_adc_converted_data];
        if (aADCxConvertedMin > aADCxConvertedData[tmp_index_adc_converted_data])
          aADCxConvertedMin = aADCxConvertedData[tmp_index_adc_converted_data];
#if DEBUGMODE
        printf("m: %d",aADCxConvertedData[tmp_index_adc_converted_data]);
        printf("\n");
#endif
      }
      aADCxConvertedSum /= ADC_CONVERTED_DATA_BUFFER_SIZE;//calc average of buffer
      aADCxConvertedVpp = aADCxConvertedMax - aADCxConvertedMin;

      //aADCxConvertedVpp = aADCxConvertedVpp > 0 ? aADCxConvertedVpp : 1;
      aADCxConvertedVpp = aADCxConvertedVpp > 150 ? aADCxConvertedVpp : 150;
      aADCxConvertedTrigger = (aADCxConvertedMax + aADCxConvertedMin)/2;

      for (tmp_index_adc_converted_data = 0; tmp_index_adc_converted_data < ADC_CONVERTED_DATA_BUFFER_SIZE; tmp_index_adc_converted_data++)
      {
        adc_converted_data_f32[tmp_index_adc_converted_data*2] = (float)(aADCxConvertedData[tmp_index_adc_converted_data]-aADCxConvertedSum);
        adc_converted_data_f32[tmp_index_adc_converted_data*2+1] = 0;
      }

      /* Process the data through the CFFT/CIFFT module */
      arm_cfft_f32(&arm_cfft_sR_f32_len128, adc_converted_data_f32, 0, 1);

      /* Process the data through the Complex Magnitude Module for
      calculating the magnitude at each bin */
      arm_cmplx_mag_f32(adc_converted_data_f32, testOutput, ADC_CONVERTED_DATA_BUFFER_SIZE);

      arm_max_f32(testOutput, ADC_CONVERTED_DATA_BUFFER_SIZE/2, &fft_Max, &fft_Max_Index);
      fft_Max = fft_Max > 8000 ? fft_Max : 8000;
#if DEBUGMODE
      for (tmp_index_adc_converted_data = 0; tmp_index_adc_converted_data < ADC_CONVERTED_DATA_BUFFER_SIZE/2; tmp_index_adc_converted_data++)
      {
        //uhADCxConvertedData_VoltageAin_mVolt = __LL_ADC_CALC_DATA_TO_VOLTAGE(VDDA_APPLI, aADCxConvertedData[tmp_index_adc_converted_data], LL_ADC_RESOLUTION_12B);
        printf("m: %f", testOutput[tmp_index_adc_converted_data]);
        printf("\n");
      }
#endif

#if DEBUGMODE
      for (tmp_index_adc_converted_data = 0; tmp_index_adc_converted_data < ADC_CONVERTED_DATA_BUFFER_SIZE/2; tmp_index_adc_converted_data++)
      {
        //uhADCxConvertedData_VoltageAin_mVolt = __LL_ADC_CALC_DATA_TO_VOLTAGE(VDDA_APPLI, aADCxConvertedData[tmp_index_adc_converted_data], LL_ADC_RESOLUTION_12B);
        printf("m: %f", testOutput[tmp_index_adc_converted_data]);
        printf("\n");
      }
#endif
      if(Wav_Frq == 0)
      {
        aADCxConvertedTrigPos = ADC_CONVERTED_DATA_BUFFER_SIZE/4;
        for (tmp_index_adc_converted_data = ADC_CONVERTED_DATA_BUFFER_SIZE/4; tmp_index_adc_converted_data < ADC_CONVERTED_DATA_BUFFER_SIZE - (ADC_CONVERTED_DATA_BUFFER_SIZE/4); tmp_index_adc_converted_data++)
        {
          if (cAtEdge == RisingEdge)
          {
            if(aADCxConvertedData[tmp_index_adc_converted_data-1] <= aADCxConvertedTrigger && aADCxConvertedData[tmp_index_adc_converted_data] > aADCxConvertedTrigger )
            {
              aADCxConvertedTrigPos = tmp_index_adc_converted_data;
              break;
            }
          }
          else if (cAtEdge == FallingEdge)
          {
            if(aADCxConvertedData[tmp_index_adc_converted_data-1] >= aADCxConvertedTrigger && aADCxConvertedData[tmp_index_adc_converted_data] < aADCxConvertedTrigger )
            {
              aADCxConvertedTrigPos = tmp_index_adc_converted_data;
              break;
            }
          }
        }
        if(AC_DC == 0)
        {
          for(char x = 0; x<64; x++)
          {
            OLED_DrawPoint(x, 63-(uint8_t)((aADCxConvertedData[aADCxConvertedTrigPos-(ADC_CONVERTED_DATA_BUFFER_SIZE/4)+x])*63.0 / 3300 ), 1);
            //OLED_DrawPoint(x, 31-(int8_t)(63.0*(aADCxConvertedData[aADCxConvertedTrigPos-(ADC_CONVERTED_DATA_BUFFER_SIZE/4)+x] - aADCxConvertedTrigger)/aADCxConvertedVpp), 1);
          }
        }
        else
        {
          for(char x = 0; x<64; x++)
          {
            //OLED_DrawPoint(x, 63-(uint8_t)((aADCxConvertedData[aADCxConvertedTrigPos-(ADC_CONVERTED_DATA_BUFFER_SIZE/4)+x] - aADCxConvertedMin)*63.0 / aADCxConvertedVpp ), 1);
            OLED_DrawPoint(x, 31-(int8_t)(63.0*(aADCxConvertedData[aADCxConvertedTrigPos-(ADC_CONVERTED_DATA_BUFFER_SIZE/4)+x] - aADCxConvertedTrigger)/aADCxConvertedVpp), 1);
          }
        }

      }
      else
      {
        for(char x = 0; x<64; x++)
        {
          OLED_DrawLine(x, 63-(uint8_t)(testOutput[x]*63.0/fft_Max), x, 63, 1);
        }
      }

      OLED_ShowChar(64, Menu_cnt*8, '>', 8, 1);

      if(inDDS==0)
      { //OSC menu
        sprintf(txt,"SPS:%4s", TIM3_PERIOD_CHR[TIM3_PERIOD_cnt]);
        OLED_ShowString(70, 0, txt, 8, 1);

        sprintf(txt,"SRC:%4s", cUseChannel==0 ? "Ain+":"Mic+");
        OLED_ShowString(70, 8, txt, 8, 1);

        sprintf(txt,"T/F:%4s", Wav_Frq==0?"Time":"Freq");
        OLED_ShowString(70, 16, txt, 8, 1);

        sprintf(txt,"TRI:%4s", cAtEdge==0 ? "Rise":"Fall");
        OLED_ShowString(70, 24, txt, 8, 1);

        if(Wav_Frq == 0)
        {
          sprintf(txt,"A_D:%4s", AC_DC == 0 ? " DC " : " AC ");
          OLED_ShowString(70, 32, txt, 8, 1);

          switch (TIM3_PERIOD_cnt)
          {
            case 0:
              freq_in = (fft_Max_Index)*2/64.0;
              sprintf(txt,"FRQ:%1.1fM", freq_in);
              break;
            case 1:
              freq_in = (fft_Max_Index)*1/64.0;
              sprintf(txt,"FRQ:%1.1fM", freq_in);
              break;
            case 2:
              freq_in = (fft_Max_Index)*500/64.0;
              sprintf(txt,"FRQ:%3.0fk", freq_in);
              break;
            case 3:
              freq_in = (fft_Max_Index)*250/64.0;
              sprintf(txt,"FRQ:%3.0fk", freq_in);
              break;
            case 4:
              freq_in = (fft_Max_Index)*100/64.0;
              sprintf(txt,"FRQ:%3.0fk", freq_in);
              break;
            case 5:
              freq_in = (fft_Max_Index)*50/64.0;
              sprintf(txt,"FRQ:%3.0fk", freq_in);
              break;
            case 6:
              freq_in = (fft_Max_Index)*25/64.0;
              sprintf(txt,"FRQ:%3.0fk", freq_in);
              break;
            case 7:
              freq_in = (fft_Max_Index)*10/64.0;
              sprintf(txt,"FRQ:%3.0fk", freq_in);
              break;
            case 8:
              freq_in = (fft_Max_Index)*5/64.0;
              sprintf(txt,"FRQ:%3.0fk", freq_in);
              break;
            case 9:
              freq_in = (fft_Max_Index)*2500/64.0;
              sprintf(txt,"FRQ:%4.0f", freq_in);
              break;
            case 10:
              freq_in = (fft_Max_Index)*1000/64.0;
              sprintf(txt,"FRQ:%4.0f", freq_in);
              break;
            case 11:
              freq_in = (fft_Max_Index)*500/64.0;
              sprintf(txt,"FRQ:%4.0f", freq_in);
              break;
            default:
              break;
          }
          OLED_ShowString(70, 40, txt, 8, 1);

          sprintf(txt,"VPP:%4d", aADCxConvertedVpp);
          OLED_ShowString(70, 48, txt, 8, 1);

          sprintf(txt,"DCC:%4d", aADCxConvertedSum);
          OLED_ShowString(70, 56, txt, 8, 1);
        }
        else
        {
          switch (TIM3_PERIOD_cnt)
          {
            case 0:
              freq_in = (fft_Max_Index)*2/64.0;
              sprintf(txt,"FRQ:%1.1fM", freq_in);
              break;
            case 1:
              freq_in = (fft_Max_Index)*1/64.0;
              sprintf(txt,"FRQ:%1.1fM", freq_in);
              break;
            case 2:
              freq_in = (fft_Max_Index)*500/64.0;
              sprintf(txt,"FRQ:%3.0fk", freq_in);
              break;
            case 3:
              freq_in = (fft_Max_Index)*250/64.0;
              sprintf(txt,"FRQ:%3.0fk", freq_in);
              break;
            case 4:
              freq_in = (fft_Max_Index)*100/64.0;
              sprintf(txt,"FRQ:%3.0fk", freq_in);
              break;
            case 5:
              freq_in = (fft_Max_Index)*50/64.0;
              sprintf(txt,"FRQ:%3.0fk", freq_in);
              break;
            case 6:
              freq_in = (fft_Max_Index)*25/64.0;
              sprintf(txt,"FRQ:%3.0fk", freq_in);
              break;
            case 7:
              freq_in = (fft_Max_Index)*10/64.0;
              sprintf(txt,"FRQ:%3.0fk", freq_in);
              break;
            case 8:
              freq_in = (fft_Max_Index)*5/64.0;
              sprintf(txt,"FRQ:%3.0fk", freq_in);
              break;
            case 9:
              freq_in = (fft_Max_Index)*2500/64.0;
              sprintf(txt,"FRQ:%4.0f", freq_in);
              break;
            case 10:
              freq_in = (fft_Max_Index)*1000/64.0;
              sprintf(txt,"FRQ:%4.0f", freq_in);
              break;
            case 11:
              freq_in = (fft_Max_Index)*500/64.0;
              sprintf(txt,"FRQ:%4.0f", freq_in);
              break;
            default:
              break;
          }
          OLED_ShowString(70, 32, txt, 8, 1);

          if(fft_Max_Index<32)
          {
            sprintf(txt,"2nd:%1.2f", testOutput[fft_Max_Index*2] / testOutput[fft_Max_Index]);
            OLED_ShowString(70, 40, txt, 8, 1);

            sprintf(txt,"3rd:%1.2f", testOutput[fft_Max_Index*3] / testOutput[fft_Max_Index]);
            OLED_ShowString(70, 48, txt, 8, 1);

            sprintf(txt,"4th:%1.2f", testOutput[fft_Max_Index*4] / testOutput[fft_Max_Index]);
            OLED_ShowString(70, 56, txt, 8, 1);
          }
        }
      }
      else
      { //DDS menu
        sprintf(txt,"FRQ:%4d", DDS_FREQ);
        OLED_ShowString(70, 0, txt, 8, 1);

        sprintf(txt,"AMP:%4d", tmp_ampl);
        OLED_ShowString(70, 8, txt, 8, 1);

        sprintf(txt,"DC :%4d", tmp_offset);
        OLED_ShowString(70, 16, txt, 8, 1);

        sprintf(txt,"WAV:%4s", DDS_WAVE[DDS_mode]);
        OLED_ShowString(70, 24, txt, 8, 1);
      }
      OLED_Refresh();

      ubDmaTransferStatus = 0;

      /* Start ADC group regular conversion with DMA */
      if (HAL_ADC_Start_DMA(&hadc1,
                            (uint32_t *)aADCxConvertedData,
                            ADC_CONVERTED_DATA_BUFFER_SIZE
                           ) != HAL_OK)
      {
        /* ADC conversion start error */
        Error_Handler();
      }

    }


    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Configure the main internal regulator output voltage
  */
  HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSIDiv = RCC_HSI_DIV1;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = RCC_PLLM_DIV1;
  RCC_OscInitStruct.PLL.PLLN = 8;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = RCC_PLLQ_DIV2;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the peripherals clocks
  */
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_LPUART1|RCC_PERIPHCLK_ADC
                              |RCC_PERIPHCLK_TIM1;
  PeriphClkInit.Lpuart1ClockSelection = RCC_LPUART1CLKSOURCE_PCLK1;
  PeriphClkInit.AdcClockSelection = RCC_ADCCLKSOURCE_SYSCLK;
  PeriphClkInit.Tim1ClockSelection = RCC_TIM1CLKSOURCE_PCLK1;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief ADC1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_ADC1_Init(void)
{

  /* USER CODE BEGIN ADC1_Init 0 */

  /* USER CODE END ADC1_Init 0 */

  ADC_ChannelConfTypeDef sConfig = {0};

  /* USER CODE BEGIN ADC1_Init 1 */

  /* USER CODE END ADC1_Init 1 */
  /** Configure the global features of the ADC (Clock, Resolution, Data Alignment and number of conversion)
  */
  hadc1.Instance = ADC1;
  hadc1.Init.ClockPrescaler = ADC_CLOCK_ASYNC_DIV1;
  hadc1.Init.Resolution = ADC_RESOLUTION_12B;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.ScanConvMode = ADC_SCAN_DISABLE;
  hadc1.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
  hadc1.Init.LowPowerAutoWait = DISABLE;
  hadc1.Init.LowPowerAutoPowerOff = DISABLE;
  hadc1.Init.ContinuousConvMode = DISABLE;
  hadc1.Init.NbrOfConversion = 1;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConv = ADC_EXTERNALTRIG_T3_TRGO;
  hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_RISING;
  hadc1.Init.DMAContinuousRequests = DISABLE;
  hadc1.Init.Overrun = ADC_OVR_DATA_PRESERVED;
  hadc1.Init.SamplingTimeCommon1 = ADC_SAMPLETIME_1CYCLE_5;
  hadc1.Init.SamplingTimeCommon2 = ADC_SAMPLETIME_160CYCLES_5;
  hadc1.Init.OversamplingMode = DISABLE;
  hadc1.Init.TriggerFrequencyMode = ADC_TRIGGER_FREQ_HIGH;
  if (HAL_ADC_Init(&hadc1) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Regular Channel
  */
  sConfig.Channel = ADC_CHANNEL_0;
  sConfig.Rank = ADC_REGULAR_RANK_1;
  sConfig.SamplingTime = ADC_SAMPLINGTIME_COMMON_1;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN ADC1_Init 2 */

  /* USER CODE END ADC1_Init 2 */

}

/**
  * @brief LPUART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_LPUART1_UART_Init(void)
{

  /* USER CODE BEGIN LPUART1_Init 0 */

  /* USER CODE END LPUART1_Init 0 */

  /* USER CODE BEGIN LPUART1_Init 1 */

  /* USER CODE END LPUART1_Init 1 */
  hlpuart1.Instance = LPUART1;
  hlpuart1.Init.BaudRate = 2000000;
  hlpuart1.Init.WordLength = UART_WORDLENGTH_8B;
  hlpuart1.Init.StopBits = UART_STOPBITS_1;
  hlpuart1.Init.Parity = UART_PARITY_NONE;
  hlpuart1.Init.Mode = UART_MODE_TX_RX;
  hlpuart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  hlpuart1.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  hlpuart1.Init.ClockPrescaler = UART_PRESCALER_DIV1;
  hlpuart1.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  hlpuart1.FifoMode = UART_FIFOMODE_DISABLE;
  if (HAL_UART_Init(&hlpuart1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_SetTxFifoThreshold(&hlpuart1, UART_TXFIFO_THRESHOLD_1_8) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_SetRxFifoThreshold(&hlpuart1, UART_RXFIFO_THRESHOLD_1_8) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_DisableFifoMode(&hlpuart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN LPUART1_Init 2 */

  /* USER CODE END LPUART1_Init 2 */

}

/**
  * @brief TIM1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM1_Init(void)
{

  /* USER CODE BEGIN TIM1_Init 0 */

  /* USER CODE END TIM1_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};
  TIM_BreakDeadTimeConfigTypeDef sBreakDeadTimeConfig = {0};

  /* USER CODE BEGIN TIM1_Init 1 */

  /* USER CODE END TIM1_Init 1 */
  htim1.Instance = TIM1;
  htim1.Init.Prescaler = TIM1_PRESCALER_VALUE;
  htim1.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim1.Init.Period = TIM1_PERIOD_VALUE;
  htim1.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim1.Init.RepetitionCounter = 0;
  htim1.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  if (HAL_TIM_Base_Init(&htim1) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim1, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_Init(&htim1) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterOutputTrigger2 = TIM_TRGO2_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim1, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = TIM1_PULSE1_VALUE;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCNPolarity = TIM_OCNPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_ENABLE;
  sConfigOC.OCIdleState = TIM_OCIDLESTATE_RESET;
  sConfigOC.OCNIdleState = TIM_OCNIDLESTATE_RESET;
  if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_3) != HAL_OK)
  {
    Error_Handler();
  }
  sBreakDeadTimeConfig.OffStateRunMode = TIM_OSSR_DISABLE;
  sBreakDeadTimeConfig.OffStateIDLEMode = TIM_OSSI_DISABLE;
  sBreakDeadTimeConfig.LockLevel = TIM_LOCKLEVEL_OFF;
  sBreakDeadTimeConfig.DeadTime = 0;
  sBreakDeadTimeConfig.BreakState = TIM_BREAK_DISABLE;
  sBreakDeadTimeConfig.BreakPolarity = TIM_BREAKPOLARITY_HIGH;
  sBreakDeadTimeConfig.BreakFilter = 0;
  sBreakDeadTimeConfig.BreakAFMode = TIM_BREAK_AFMODE_INPUT;
  sBreakDeadTimeConfig.Break2State = TIM_BREAK2_DISABLE;
  sBreakDeadTimeConfig.Break2Polarity = TIM_BREAK2POLARITY_HIGH;
  sBreakDeadTimeConfig.Break2Filter = 0;
  sBreakDeadTimeConfig.Break2AFMode = TIM_BREAK_AFMODE_INPUT;
  sBreakDeadTimeConfig.AutomaticOutput = TIM_AUTOMATICOUTPUT_DISABLE;
  if (HAL_TIMEx_ConfigBreakDeadTime(&htim1, &sBreakDeadTimeConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM1_Init 2 */

  /* USER CODE END TIM1_Init 2 */
  HAL_TIM_MspPostInit(&htim1);

}

/**
  * @brief TIM2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM2_Init(void)
{

  /* USER CODE BEGIN TIM2_Init 0 */

  /* USER CODE END TIM2_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};

  /* USER CODE BEGIN TIM2_Init 1 */

  /* USER CODE END TIM2_Init 1 */
  htim2.Instance = TIM2;
  htim2.Init.Prescaler = TIM2_PRESCALER_VALUE;
  htim2.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim2.Init.Period = TIM2_PERIOD_VALUE;
  htim2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim2.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim2) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim2, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_Init(&htim2) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim2, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = TIM2_PULSE1_VALUE;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_ENABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim2, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM2_Init 2 */

  /* USER CODE END TIM2_Init 2 */
  HAL_TIM_MspPostInit(&htim2);

}

/**
  * @brief TIM3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM3_Init(void)
{

  /* USER CODE BEGIN TIM3_Init 0 */

  /* USER CODE END TIM3_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};

  /* USER CODE BEGIN TIM3_Init 1 */

  /* USER CODE END TIM3_Init 1 */
  htim3.Instance = TIM3;
  htim3.Init.Prescaler = TIM3_PRESCALER_VALUE;
  htim3.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim3.Init.Period = TIM3_PERIOD_VALUE;
  htim3.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim3.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim3) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim3, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_Init(&htim3) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_UPDATE;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim3, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = TIM3_PULSE1_VALUE;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_ENABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM3_Init 2 */

  /* USER CODE END TIM3_Init 2 */
  HAL_TIM_MspPostInit(&htim3);

}

/**
  * @brief TIM16 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM16_Init(void)
{

  /* USER CODE BEGIN TIM16_Init 0 */

  /* USER CODE END TIM16_Init 0 */

  TIM_OC_InitTypeDef sConfigOC = {0};
  TIM_BreakDeadTimeConfigTypeDef sBreakDeadTimeConfig = {0};

  /* USER CODE BEGIN TIM16_Init 1 */

  /* USER CODE END TIM16_Init 1 */
  htim16.Instance = TIM16;
  htim16.Init.Prescaler = TIM16_PRESCALER_VALUE;
  htim16.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim16.Init.Period = TIM16_PERIOD_VALUE;
  htim16.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim16.Init.RepetitionCounter = 0;
  htim16.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim16) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_Init(&htim16) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = TIM16_PULSE1_VALUE;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCNPolarity = TIM_OCNPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_ENABLE;
  sConfigOC.OCIdleState = TIM_OCIDLESTATE_RESET;
  sConfigOC.OCNIdleState = TIM_OCNIDLESTATE_RESET;
  if (HAL_TIM_PWM_ConfigChannel(&htim16, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  sBreakDeadTimeConfig.OffStateRunMode = TIM_OSSR_DISABLE;
  sBreakDeadTimeConfig.OffStateIDLEMode = TIM_OSSI_DISABLE;
  sBreakDeadTimeConfig.LockLevel = TIM_LOCKLEVEL_OFF;
  sBreakDeadTimeConfig.DeadTime = 0;
  sBreakDeadTimeConfig.BreakState = TIM_BREAK_DISABLE;
  sBreakDeadTimeConfig.BreakPolarity = TIM_BREAKPOLARITY_HIGH;
  sBreakDeadTimeConfig.BreakFilter = 0;
  sBreakDeadTimeConfig.AutomaticOutput = TIM_AUTOMATICOUTPUT_DISABLE;
  if (HAL_TIMEx_ConfigBreakDeadTime(&htim16, &sBreakDeadTimeConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM16_Init 2 */

  /* USER CODE END TIM16_Init 2 */
  HAL_TIM_MspPostInit(&htim16);

}

/**
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA1_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Channel1_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Channel1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Channel1_IRQn);
  /* DMA1_Channel2_3_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Channel2_3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Channel2_3_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, OLED_DC_Pin|OLED_RES_Pin|OLED_CLK_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(OLED_DIN_GPIO_Port, OLED_DIN_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pins : OLED_DC_Pin OLED_RES_Pin OLED_CLK_Pin */
  GPIO_InitStruct.Pin = OLED_DC_Pin|OLED_RES_Pin|OLED_CLK_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : Key_OK_Pin Key_L_Pin */
  GPIO_InitStruct.Pin = Key_OK_Pin|Key_L_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pins : Key_R_Pin Key_U_Pin */
  GPIO_InitStruct.Pin = Key_R_Pin|Key_U_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pin : Key_D_Pin */
  GPIO_InitStruct.Pin = Key_D_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(Key_D_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : OLED_DIN_Pin */
  GPIO_InitStruct.Pin = OLED_DIN_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  HAL_GPIO_Init(OLED_DIN_GPIO_Port, &GPIO_InitStruct);

  /* EXTI interrupt init*/
  HAL_NVIC_SetPriority(EXTI0_1_IRQn, 2, 0);
  HAL_NVIC_EnableIRQ(EXTI0_1_IRQn);

  HAL_NVIC_SetPriority(EXTI4_15_IRQn, 2, 0);
  HAL_NVIC_EnableIRQ(EXTI4_15_IRQn);

}

/* USER CODE BEGIN 4 */
void HAL_GPIO_EXTI_Falling_Callback(uint16_t GPIO_Pin)
{
  switch (GPIO_Pin)
  {
    case Key_OK_Pin:
      Key_Pressed |= Key_OK_Pin;
      break;
    case Key_L_Pin:
      Key_Pressed |= Key_L_Pin;
      break;
    case Key_R_Pin:
      Key_Pressed |= Key_R_Pin;
      break;
    case Key_D_Pin:
      Key_Pressed |= Key_D_Pin;
      break;
    case Key_U_Pin:
      Key_Pressed |= Key_U_Pin;
      break;
    default:
      break;
  }
}
/**
  * @brief  Period elapsed callback in non blocking mode
  * @param  htim : TIM handle
  * @retval None
  */

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  //BSP_LED_Toggle(LED4);
  if (htim->Instance == TIM1)
  {
    uint16_t tmp_sin;
    if(tmp_phase > 31)
    {
      tmp_phase = 0;
    }
    //tmp_sin =(uint16_t)128*sinf(tmp_phase*PI/15.0)+128;
    __HAL_TIM_SET_COMPARE(&htim2, TIM_CHANNEL_2, tmp_sinTable[tmp_phase]);
    tmp_phase++;
  }
}

/**
  * @brief  Conversion complete callback in non blocking mode
  * @param  hadc: ADC handle
  * @note   This example shows a simple way to report end of conversion
  *         and get conversion result. You can add your own implementation.
  * @retval None
  */
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef *hadc)
{
  /* Update status variable of DMA transfer */
  HAL_ADC_Stop_DMA(&hadc1);
  ubDmaTransferStatus = 1;
  /* Set LED depending on DMA transfer status */
  /* - Turn-on if DMA transfer is completed */
  /* - Turn-off if DMA transfer is not completed */
  //BSP_LED_On(LED4);
}
///**
//  * @brief  Conversion DMA half-transfer callback in non blocking mode
//  * @note   This example shows a simple way to report end of conversion
//  *         and get conversion result. You can add your own implementation.
//  * @retval None
//  */
//void HAL_ADC_ConvHalfCpltCallback(ADC_HandleTypeDef *hadc)
//{
//  /* Set LED depending on DMA transfer status */
//  /* - Turn-on if DMA transfer is completed */
//  /* - Turn-off if DMA transfer is not completed */
//  //BSP_LED_Off(LED4);
//}

/**
  * @brief  ADC error callback in non blocking mode
  *        (ADC conversion with interruption or transfer by DMA)
  * @param  hadc: ADC handle
  * @retval None
  */
void HAL_ADC_ErrorCallback(ADC_HandleTypeDef *hadc)
{
  /* In case of ADC error, call main error handler */
  Error_Handler();
}

/**
  * @brief  Retargets the C library printf function to the USART.
  * @param  None
  * @retval None
  */
PUTCHAR_PROTOTYPE
{
  /* Place your implementation of fputc here */
  /* e.g. write a character to the USART1 and Loop until the end of transmission */
  HAL_UART_Transmit(&hlpuart1, (uint8_t *)&ch, 1, 0xFFFF);

  return ch;
}

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
