################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../component/serial_manager/serial_manager.c \
../component/serial_manager/serial_port_uart.c 

OBJS += \
./component/serial_manager/serial_manager.o \
./component/serial_manager/serial_port_uart.o 

C_DEPS += \
./component/serial_manager/serial_manager.d \
./component/serial_manager/serial_port_uart.d 


# Each subdirectory must supply rules for building sources it contributes
component/serial_manager/%.o: ../component/serial_manager/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_MIMXRT1011DAE5A -DCPU_MIMXRT1011DAE5A_cm7 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=0 -DPRINTF_FLOAT_ENABLE=1 -DXIP_EXTERNAL_FLASH=1 -DXIP_BOOT_HEADER_ENABLE=1 -DSERIAL_PORT_TYPE_UART=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/drivers" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/component/lists" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/CMSIS" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/xip" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/component/serial_manager" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/utilities" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/device" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/component/uart" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/drivers" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/component/lists" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/CMSIS" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/xip" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/component/serial_manager" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/utilities" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/device" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/component/uart" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/board" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project/source" -I"/home/jacob/Documents/MCUXpresso_11.2.0_4120/workspace/MIMXRT1011xxxxx_Project" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m7 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


