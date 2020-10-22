#pragma once
#include "peripherals.h"
typedef struct display display;typedef struct display {
	GPIO_Type* address;
	uint32_t data_pins[4];
	uint32_t e;
	uint32_t rs;
} display;

void display_initialize(display *display, GPIO_Type* address, uint32_t rs,
		uint32_t e, uint32_t d4, uint32_t d5, uint32_t d6, uint32_t d7);

void display_print(display* display, char message[]);

void display_clear(display* display);

void display_position_cursor(display* display, uint8_t location);
