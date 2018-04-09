LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY controller IS
	PORT
	(
		in_opcode : IN  STD_LOGIC_VECTOR( 7 DOWNTO 0);
		
		
		out_register_write : OUT STD_LOGIC;
		
		out_we : OUT STD_LOGIC;

		out_alu : OUT STD_LOGIC;
		out_immediate : OUT STD_LOGIC;
		out_function : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
		
		
		out_ram_data  : OUT STD_LOGIC
 	);
END controller;

ARCHITECTURE behavioral OF controller IS

	
BEGIN
	PROCESS(in_opcode)
	BEGIN
		CASE TO_INTEGER(UNSIGNED(in_opcode)) IS
			WHEN OPCODE_NOOP =>
				out_register_write <= '0';
			
				out_we <= '0';
				
				out_alu <= '0';
				out_immediate <= '0';
				out_function <= ALU_ZERO;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_LOAD_IMMEDIATE =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '1';
				out_immediate <= '1';
				out_function <= ALU_PASS_B;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_MOVE =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '1';
				out_immediate <= '0';
				out_function <= ALU_PASS_B;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_LOAD =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '1';
				out_immediate <= '0';
				out_function <= ALU_ZERO;
				
				
				out_ram_data <= '1';
				
			WHEN OPCODE_STORE =>
				out_register_write <= '0';
			
				out_we <= '1';
				
				out_alu <= '1';
				out_immediate <= '0';
				out_function <= ALU_PASS;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_ADD =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '1';
				out_immediate <= '0';
				out_function <= ALU_ADD;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_SUBTRACT =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '1';
				out_immediate <= '0';
				out_function <= ALU_SUBTRACT;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_AND =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '1';
				out_immediate <= '0';
				out_function <= ALU_AND;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_OR =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '1';
				out_immediate <= '0';
				out_function <= ALU_OR;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_XOR =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '1';
				out_immediate <= '0';
				out_function <= ALU_XOR;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_XNOR =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '1';
				out_immediate <= '0';
				out_function <= ALU_XNOR;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_NOT =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '1';
				out_immediate <= '0';
				out_function <= ALU_NOT;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_SHIFT_LEFT =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '0';
				out_immediate <= '0';
				out_function <= SHIFTER_LEFT;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_SHIFT_RIGHT =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '0';
				out_immediate <= '0';
				out_function <= SHIFTER_RIGHT;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_ARITHMETIC_SHIFT_LEFT =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '0';
				out_immediate <= '0';
				out_function <= SHIFTER_ARITHMETIC_LEFT;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_ARITHMETIC_SHIFT_RIGHT =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '0';
				out_immediate <= '0';
				out_function <= SHIFTER_ARITHMETIC_RIGHT;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_ROTATE_LEFT =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '0';
				out_immediate <= '0';
				out_function <= SHIFTER_ROTATE_LEFT;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_ROTATE_RIGHT =>
				out_register_write <= '1';
			
				out_we <= '0';
				
				out_alu <= '0';
				out_immediate <= '0';
				out_function <= SHIFTER_ROTATE_RIGHT;
				
				
				out_ram_data <= '0';
				
			
			WHEN OPCODE_JUMP =>
				out_register_write <= '0';
			
				out_we <= '0';
				
				out_alu <= '0';
				out_immediate <= '0';
				out_function <= ALU_ZERO;
				
				
				out_ram_data <= '0';
				
			WHEN OPCODE_JUMP_EQUALS =>
				out_register_write <= '0';
			
				out_we <= '0';
				
				out_alu <= '1';
				out_immediate <= '0';
				out_function <= ALU_SUBTRACT;
				
				
				out_ram_data <= '0';
			
		WHEN OPCODE_JUMP_NOT_EQUALS =>
				out_register_write <= '0';
			
				out_we <= '0';
				
				out_alu <= '1';
				out_immediate <= '0';
				out_function <= ALU_SUBTRACT;
				
				
				out_ram_data <= '0';	
			
		WHEN OPCODE_JUMP_LESSER_THEN =>
				out_register_write <= '0';
			
				out_we <= '0';
				
				out_alu <= '1';
				out_immediate <= '0';
				out_function <= ALU_SUBTRACT;
				
				
				out_ram_data <= '0';	
				
		WHEN OPCODE_JUMP_GREATER_THEN =>
				out_register_write <= '0';
			
				out_we <= '0';
				
				out_alu <= '1';
				out_immediate <= '0';
				out_function <= ALU_SUBTRACT;
				
				
				out_ram_data <= '0';	
			
			WHEN OTHERS =>
		END CASE;
	END PROCESS;
END behavioral;