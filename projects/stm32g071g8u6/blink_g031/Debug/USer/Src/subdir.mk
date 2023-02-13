################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../USer/Src/buzzer.c \
../USer/Src/common.c \
../USer/Src/key.c \
../USer/Src/oled.c \
../USer/Src/os.c 

OBJS += \
./USer/Src/buzzer.o \
./USer/Src/common.o \
./USer/Src/key.o \
./USer/Src/oled.o \
./USer/Src/os.o 

C_DEPS += \
./USer/Src/buzzer.d \
./USer/Src/common.d \
./USer/Src/key.d \
./USer/Src/oled.d \
./USer/Src/os.d 


# Each subdirectory must supply rules for building sources it contributes
USer/Src/%.o: ../USer/Src/%.c USer/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DARM_MATH_CM0 -DUSE_HAL_DRIVER -DSTM32G031xx -c -I../Core/Inc -I"F:/STM32cubeIDE/STM32_G031/blink_g031/Drivers/CMSIS/DSP/Include" -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -I"F:/STM32cubeIDE/STM32_G031/blink_g031/USer/Inc" -I"F:/STM32cubeIDE/STM32_G031/blink_g031/USer/Scope" -I"F:/STM32cubeIDE/STM32_G031/blink_g031/USer/Spectrum" -I"F:/STM32cubeIDE/STM32_G031/blink_g031/USer/DSP/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-USer-2f-Src

clean-USer-2f-Src:
	-$(RM) ./USer/Src/buzzer.d ./USer/Src/buzzer.o ./USer/Src/common.d ./USer/Src/common.o ./USer/Src/key.d ./USer/Src/key.o ./USer/Src/oled.d ./USer/Src/oled.o ./USer/Src/os.d ./USer/Src/os.o

.PHONY: clean-USer-2f-Src

