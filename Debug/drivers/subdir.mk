################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/fsl_adc.c \
../drivers/fsl_clock.c \
../drivers/fsl_common.c \
../drivers/fsl_gpio.c \
../drivers/fsl_gpt.c \
../drivers/fsl_lpuart.c \
../drivers/fsl_pit.c 

OBJS += \
./drivers/fsl_adc.o \
./drivers/fsl_clock.o \
./drivers/fsl_common.o \
./drivers/fsl_gpio.o \
./drivers/fsl_gpt.o \
./drivers/fsl_lpuart.o \
./drivers/fsl_pit.o 

C_DEPS += \
./drivers/fsl_adc.d \
./drivers/fsl_clock.d \
./drivers/fsl_common.d \
./drivers/fsl_gpio.d \
./drivers/fsl_gpt.d \
./drivers/fsl_lpuart.d \
./drivers/fsl_pit.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/%.o: ../drivers/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_MIMXRT1011DAE5A -DCPU_MIMXRT1011DAE5A_cm7 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=0 -DPRINTF_FLOAT_ENABLE=1 -DXIP_EXTERNAL_FLASH=1 -DXIP_BOOT_HEADER_ENABLE=1 -DSERIAL_PORT_TYPE_UART=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/drivers" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/component/lists" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/CMSIS" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/xip" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/component/serial_manager" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/utilities" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/device" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/component/uart" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/drivers" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/component/lists" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/CMSIS" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/xip" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/component/serial_manager" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/utilities" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/device" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/component/uart" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/board" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/source" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m7 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


