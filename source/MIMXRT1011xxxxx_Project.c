/**
 * @file    MIMXRT1011xxxxx_Project.c
 * @brief   Application entry point.
 */
#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include "peripherals.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "MIMXRT1011.h"
#include "fsl_debug_console.h"

#include "display.h"
#include "math.h"

/**
 * Returns the period corresponding to the given period index.
 * Indexes greater than the number of items will return the period for modulus index.
 */
uint32_t getTimerPeriod(uint8_t index) {
	static uint32_t timeouts[] = {
			PIT_CHANNEL_0_TICKS*2,
			PIT_CHANNEL_0_TICKS,
			PIT_CHANNEL_0_TICKS/2,
			PIT_CHANNEL_0_TICKS/4,
			PIT_CHANNEL_0_TICKS/8
	};
	static size_t timeouts_length = sizeof(timeouts)/sizeof(timeouts[0]);

	return timeouts[index%timeouts_length];
}

display display1;

uint8_t timer_elapsed = 0U;
void PIT_IRQHandler(void) {
	PIT_ClearStatusFlags(PIT_PERIPHERAL, PIT_CHANNEL_0, PIT_TFLG_TIF(1));
	timer_elapsed = 1U;
	SDK_ISR_EXIT_BARRIER;
}

uint8_t button_pressed = 0U;
void GPIO2_GPIO_COMB_0_15_IRQHANDLER(void) {
	GPIO_PortClearInterruptFlags(BOARD_INITPINS_USER_BUTTON_GPIO, 1U << BOARD_INITPINS_USER_BUTTON_GPIO_PIN);
	button_pressed = 1U;
	SDK_ISR_EXIT_BARRIER;
}

uint8_t adc_sampled = 0U;
uint32_t result = 0U;
void  ADC1_IRQHANDLER(void) {
	//ADC_ClearStatusFlags(ADC1_PERIPHERAL, ADC1)
	result = ADC_GetChannelConversionValue(ADC1_PERIPHERAL, 0U);
	adc_sampled = 1U;
}

void handle_timer(void) {
	static uint32_t value = 0U;
	value ^= 1U;
	GPIO_PinWrite(BOARD_USER_LED_GPIO, BOARD_USER_LED_GPIO_PIN, value);
	GPIO_PinWrite(GPIO2, 2U, value);
	ADC_SetChannelConfig(ADC1_PERIPHERAL, 0U, &ADC1_channels_config[0]);
}

void handle_button_press(void) {
	static uint8_t timeout_index = 0;
	PIT_StopTimer(PIT_PERIPHERAL, PIT_CHANNEL_0);
	PIT_SetTimerPeriod(PIT_PERIPHERAL, PIT_CHANNEL_0, getTimerPeriod(timeout_index++));
	PIT_StartTimer(PIT_PERIPHERAL, PIT_CHANNEL_0);

}


double maxAdc = 4096.0;

double beta_inverse = 1/3435.0;
double standard_temp_inverse = 1/298.15;

void handle_adc_sampled(void) {
	char ascii_value[17];

	float tempC = (1 / (standard_temp_inverse + beta_inverse * log((maxAdc/result) - 1))) - 273.15;
	float tempF = (tempC * (9.0/5.0)) + 32;

	display_clear(&display1);
	display_print(&display1, "Temperature:");
	display_position_cursor(&display1, 0x40);
	sprintf(ascii_value, "%.1fF %.1fC", tempF, tempC);
	display_print(&display1, ascii_value);
}

/*
 * @brief   Application entry point.
 */
int main(void) {

  	/* Init board hardware. */
    BOARD_InitBootPins();
    BOARD_InitBootClocks();
    BOARD_InitBootPeripherals();
#ifndef BOARD_INIT_DEBUG_CONSOLE_PERIPHERAL
    /* Init FSL debug console. */
    BOARD_InitDebugConsole();
#endif
    display_initialize(&display1, GPIO2, 20U, 19U, 15U, 16U, 17U, 18U);
    display_print(&display1, "Hello Emily!");


    while(1) {
    	if (timer_elapsed) {
    		handle_timer();
    		timer_elapsed = 0U;
    	}

    	if (button_pressed) {
    		handle_button_press();
    		button_pressed = 0U;
    	}

    	if (adc_sampled) {
    		handle_adc_sampled();
    		adc_sampled = 0U;
    	}
    }
    return 0 ;
}
