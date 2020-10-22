#include "display.h"
#include "peripherals.h"

//  Modes
#define DISPLAY_4BITMODE (2U)

#define DISPLAY_LOWER_ORDER_BIT_MASK (15)
#define DISPLAY_HIGHER_ORDER_BIT_MASK (240)

// Register flags
#define DISPLAY_DATA_REGISTER_FLAG (1U)
#define DISPLAY_INSTRUCTION_REGISTER_FLAG (0U)

// Instruction commands
#define DISPLAY_CLEAR (1U)
#define DISPLAY_FUNCTION (32U)

uint8_t getHigherOrderBits(uint8_t data) {
	return (data & DISPLAY_HIGHER_ORDER_BIT_MASK) >> 4;
}

uint8_t getLowerOrderBits(uint8_t data) {
	return (data & DISPLAY_LOWER_ORDER_BIT_MASK);
}

void PinWrite(GPIO_Type* base, uint32_t pin, uint8_t output) {
	GPIO_PinWrite(base, pin, output^1);
}

void delay_us(uint32_t us) {
	SDK_DelayAtLeastUs(us, SDK_DEVICE_MAXIMUM_CPU_CLOCK_FREQUENCY);
}

void display_write4bits(display *display, uint8_t bits) {
	for (int i = 0; i <4; i++) {
		PinWrite(display->address, display->data_pins[i], (bits >> i) & 1U);
	}
	PinWrite(display->address, display->e, 1U);
	delay_us(40U);
	PinWrite(display->address, display->e, 0U);
}

void display_write_command(display *display, uint8_t command) {
	PinWrite(display->address, display->rs, DISPLAY_INSTRUCTION_REGISTER_FLAG);

	// write high order bits
	display_write4bits(display, getHigherOrderBits(command));

	// write low order bits
	display_write4bits(display, getLowerOrderBits(command));
}

void display_write_data(display *display, uint8_t data) {
	PinWrite(display->address, display->rs, DISPLAY_DATA_REGISTER_FLAG);

	// write high order bits
	display_write4bits(display, getHigherOrderBits(data));

	// write low order bits
	display_write4bits(display, getLowerOrderBits(data));
}


void display_clear(display* display) {
	display_write_command(display, DISPLAY_CLEAR);
	delay_us(1500U);
}

void display_function_set(display* display) {
	// explicitly enabled instruction mode so we can write initial instruction to switch to 4 bit mode
	PinWrite(display->address, display->rs, DISPLAY_INSTRUCTION_REGISTER_FLAG);
	// write single 4 bit instruction to activate 4 bit mode
	display_write4bits(display, 32U >> 4);
	// execute the command again but in 4 bit mode and with other desired function settings
	display_write_command(display, 32U | 8U);
}

void display_enable(display* display) {
	display_write_command(display, 15U);
}

void display_print(display* display, char message[]) {
	uint8_t length = strlen(message);
	for(uint8_t i = 0; i < length; i++) {
		display_write_data(display, message[i]);
	}
}

void display_position_cursor(display* display, uint8_t location) {
	display_write_command(display, 128U | location);
}


void display_entry_mode_set(display* display) {
	display_write_command(display, 4U | 2U);
}

/**
 * Initialize the display
 */
void display_initialize(display *display, GPIO_Type* address, uint32_t rs,
		uint32_t e, uint32_t d4, uint32_t d5, uint32_t d6, uint32_t d7) {
	display->address = address;
	display->data_pins[0] = d4;
	display->data_pins[1] = d5;
	display->data_pins[2] = d6;
	display->data_pins[3] = d7;
	display->e = e;
	display->rs = rs;

	// set columns and rows
	display_function_set(display);
	display_entry_mode_set(display);
	display_enable(display);
	display_clear(display);
}

