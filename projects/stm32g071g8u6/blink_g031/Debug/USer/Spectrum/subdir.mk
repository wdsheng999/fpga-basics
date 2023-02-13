################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../USer/Spectrum/app1.c \
../USer/Spectrum/display_spectrum.c \
../USer/Spectrum/global1.c \
../USer/Spectrum/operate1.c \
../USer/Spectrum/sample1.c 

OBJS += \
./USer/Spectrum/app1.o \
./USer/Spectrum/display_spectrum.o \
./USer/Spectrum/global1.o \
./USer/Spectrum/operate1.o \
./USer/Spectrum/sample1.o 

C_DEPS += \
./USer/Spectrum/app1.d \
./USer/Spectrum/display_spectrum.d \
./USer/Spectrum/global1.d \
./USer/Spectrum/operate1.d \
./USer/Spectrum/sample1.d 


# Each subdirectory must supply rules for building sources it contributes
USer/Spectrum/%.o: ../USer/Spectrum/%.c USer/Spectrum/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DARM_MATH_CM0 -DUSE_HAL_DRIVER -DSTM32G031xx -c -I../Core/Inc -I"F:/STM32cubeIDE/STM32_G031/blink_g031/Drivers/CMSIS/DSP/Include" -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -I"F:/STM32cubeIDE/STM32_G031/blink_g031/USer/Inc" -I"F:/STM32cubeIDE/STM32_G031/blink_g031/USer/Scope" -I"F:/STM32cubeIDE/STM32_G031/blink_g031/USer/Spectrum" -I"F:/STM32cubeIDE/STM32_G031/blink_g031/USer/DSP/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-USer-2f-Spectrum

clean-USer-2f-Spectrum:
	-$(RM) ./USer/Spectrum/app1.d ./USer/Spectrum/app1.o ./USer/Spectrum/display_spectrum.d ./USer/Spectrum/display_spectrum.o ./USer/Spectrum/global1.d ./USer/Spectrum/global1.o ./USer/Spectrum/operate1.d ./USer/Spectrum/operate1.o ./USer/Spectrum/sample1.d ./USer/Spectrum/sample1.o

.PHONY: clean-USer-2f-Spectrum

