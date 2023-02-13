################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../USer/Scope/app.c \
../USer/Scope/display_scope.c \
../USer/Scope/global.c \
../USer/Scope/operate.c \
../USer/Scope/sample.c 

OBJS += \
./USer/Scope/app.o \
./USer/Scope/display_scope.o \
./USer/Scope/global.o \
./USer/Scope/operate.o \
./USer/Scope/sample.o 

C_DEPS += \
./USer/Scope/app.d \
./USer/Scope/display_scope.d \
./USer/Scope/global.d \
./USer/Scope/operate.d \
./USer/Scope/sample.d 


# Each subdirectory must supply rules for building sources it contributes
USer/Scope/%.o: ../USer/Scope/%.c USer/Scope/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DARM_MATH_CM0 -DUSE_HAL_DRIVER -DSTM32G031xx -c -I../Core/Inc -I"F:/STM32cubeIDE/STM32_G031/blink_g031/Drivers/CMSIS/DSP/Include" -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -I"F:/STM32cubeIDE/STM32_G031/blink_g031/USer/Inc" -I"F:/STM32cubeIDE/STM32_G031/blink_g031/USer/Scope" -I"F:/STM32cubeIDE/STM32_G031/blink_g031/USer/Spectrum" -I"F:/STM32cubeIDE/STM32_G031/blink_g031/USer/DSP/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-USer-2f-Scope

clean-USer-2f-Scope:
	-$(RM) ./USer/Scope/app.d ./USer/Scope/app.o ./USer/Scope/display_scope.d ./USer/Scope/display_scope.o ./USer/Scope/global.d ./USer/Scope/global.o ./USer/Scope/operate.d ./USer/Scope/operate.o ./USer/Scope/sample.d ./USer/Scope/sample.o

.PHONY: clean-USer-2f-Scope

