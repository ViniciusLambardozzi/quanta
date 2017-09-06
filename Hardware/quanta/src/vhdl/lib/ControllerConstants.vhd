LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE controller_constants IS
	-- STATE MACHINE SIGNAL TYPE
	type t_state_type IS (fetch_0, fetch_1, fetch_2, execute_0, execute_1, execute_2, execute_3, execute_4);
	
	-- CONTROLLER SIGNAL CONSTANTS
	-- ENABLE
				CONSTANT c_clock_registerbank         : INTEGER := 00;
				CONSTANT c_clock_registerbank_size    : INTEGER := 32;
				CONSTANT c_clock_register_a           : INTEGER := 32;
				CONSTANT c_clock_register_b   	     : INTEGER := 33;
				CONSTANT c_clock_program_counter      : INTEGER := 34;
				CONSTANT c_clock_instruction_register : INTEGER := 35;
				CONSTANT c_clock_status_register      : INTEGER := 36;
				CONSTANT c_clock_mar                  : INTEGER := 37;
				CONSTANT c_clock_mdr                  : INTEGER := 38;
				CONSTANT c_clock_ram                  : INTEGER := 39;
	-- SELECTION
				CONSTANT c_select_mux_registerbank_a     : INTEGER := 00;
				CONSTANT c_select_mux_registerbank_b     : INTEGER := 05;
				CONSTANT c_select_mux_registerbank_width : INTEGER := 05;
				CONSTANT c_select_mux_main               : INTEGER := 09;
				CONSTANT c_select_mux_main_width         : INTEGER := 03;
				CONSTANT c_select_mux_jump               : INTEGER := 12;
				CONSTANT c_select_mux_status_alu_shifter : INTEGER := 13;
				CONSTANT c_select_mux_pc_incrementer     : INTEGER := 14;
	-- FUNCTION
				CONSTANT c_function_alu                  : INTEGER := 00;
				CONSTANT c_function_alu_width            : INTEGER := 04;
				CONSTANT c_function_alu_cin              : INTEGER := 04;
				CONSTANT c_function_shifter              : INTEGER := 05;
				CONSTANT c_function_shifter_width        : INTEGER := 03;
				CONSTANT c_function_ram_we               : INTEGER := 08;
				
	-- OPCODES
	-- DIRECT
		-- Loads value at memory addres of the 16 bottom bits to a register
		CONSTANT c_opcode_loadDirect  : POSITIVE := 02;
		-- Stores value of source register at memory address on the 16 bottom bits
		CONSTANT c_opcode_storeDirect : POSITIVE := 03;
		-- Adds the value of source and destination registers and stores it at the destination
		CONSTANT c_opcode_addDirect   : POSITIVE := 04;
		-- Moves the value from source to destination register
		CONSTANT c_opcode_moveDirect  : POSITIVE := 05;
		-- Subtracts the value of source and destination registers and stores it at the destination
		CONSTANT c_opcode_subDirect   : POSITIVE := 06;
		-- Ands the value of source and destination registers and stores it at the destination
		CONSTANT c_opcode_andDirect   : POSITIVE := 07;
		-- Ors the value of source and destination registers and stores it at the destination
		CONSTANT c_opcode_orDirect    : POSITIVE := 08;
		-- Xors the value of source and destination registers and stores it at the destination
		CONSTANT c_opcode_xorDirect   : POSITIVE := 09;
		-- Xnors the value of source and destination registers and stores it at the destination
		CONSTANT c_opcode_xnorDirect  : POSITIVE := 10;
		
		-- Logical shitfs the value of source register and overwrites it's value
		CONSTANT c_opcode_shiftLogicalLeft     : POSITIVE := 17;
		CONSTANT c_opcode_shiftLogicalRight    : POSITIVE := 18;
		
		-- Arithmetic shitfs the value of source register and overwrites it's value
		CONSTANT c_opcode_shiftArithmeticLeft  : POSITIVE := 19;
		CONSTANT c_opcode_shiftArithmeticRight : POSITIVE := 20;
		
		-- Rotates the value of source register and overwrites it's value
		CONSTANT c_opcode_shiftRotateLeft      : POSITIVE := 21;
		CONSTANT c_opcode_shiftRotateRight     : POSITIVE := 22;
		
		
	-- INDIRECT
		-- Inconditional jump to address in the address register
		CONSTANT c_opcode_jumpIndirect            : POSITIVE := 11;
		-- Conditional jump to address in the address register if source is equal to destination
		CONSTANT c_opcode_jumpEqualsIndirect      : POSITIVE := 12;
		-- Conditional jump to address in the address register if source is not equal to destination
		CONSTANT c_opcode_jumpNotEqualsIndirect   : POSITIVE := 13;
		-- Conditional jump to address in the address register if source is lesser then destination
		CONSTANT c_opcode_jumpLesserThenIndirect  : POSITIVE := 14;
		-- Conditional jump to address in the address register if source is greater then destination
		CONSTANT c_opcode_jumpGreaterThenIndirect : POSITIVE := 15;
		-- Inconditional jump to address, saving the return value to return address register
		CONSTANT c_opcode_jumpAndLink             : POSITIVE := 16;
		
		CONSTANT c_opcode_loadIndirect            : POSITIVE := 23;
		CONSTANT c_opcode_storeIndirect           : POSITIVE := 24;
		
	-- IMEDIATE
		-- Loads bottom 16 bits of instruction word to a register
		CONSTANT c_opcode_loadImediate : POSITIVE := 01;
		
	-- REGISTERS
		CONSTANT c_register_returnAddress : POSITIVE := 31;
END PACKAGE;