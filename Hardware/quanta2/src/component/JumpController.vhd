LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY jump_controller IS
	PORT
	(
		in_opcode : IN STD_LOGIC_VECTOR( 7 DOWNTO 0);
		in_status : IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
		--         0 - ZERO    
		--         1 - CARRY   
		--         2 - SIGN    
		--         3 - OVERFLOW
		
		out_jump : OUT STD_LOGIC
 	);
END jump_controller;

ARCHITECTURE behavioral OF jump_controller IS
BEGIN
	PROCESS(in_opcode, in_status)
	BEGIN
		CASE TO_INTEGER(UNSIGNED(in_opcode)) IS
			WHEN OPCODE_JUMP =>
				out_jump <= '1';
			
			WHEN OPCODE_JUMP_EQUALS =>
				out_jump <= in_status(0);
				
			WHEN OPCODE_JUMP_NOT_EQUALS =>
				out_jump <= NOT in_status(0);
				
			WHEN OPCODE_JUMP_LESSER_THEN =>
				out_jump <= in_status(2);
				
			WHEN OPCODE_JUMP_GREATER_THEN =>
				out_jump <= NOT in_status(2);
		
			WHEN OTHERS =>
				out_jump <= '0';
		END CASE;
	END PROCESS;

END behavioral;