################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/OLED/oled.c 

OBJS += \
./Drivers/OLED/oled.o 

C_DEPS += \
./Drivers/OLED/oled.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/OLED/oled.o: ../Drivers/OLED/oled.c Drivers/OLED/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32G031xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -I../Drivers/OLED -I../DSP/Include -I../DSP/Source/ -I../DSP/Source/CommonTables -O1 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/OLED/oled.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

