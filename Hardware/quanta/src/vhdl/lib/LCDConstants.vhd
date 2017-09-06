LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE lcd_constants IS

	-- Data:
	-- 3 : Backlight on/off
	-- 2 : Display on/off
	-- 1 : Cursor on/off
	-- 0 : Cursor blink on/off
	CONSTANT c_opcode_displayState : INTEGER := 0;
	
	type display_state IS (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18);

END PACKAGE; 