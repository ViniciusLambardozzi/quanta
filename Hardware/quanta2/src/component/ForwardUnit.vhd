LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

use ieee.std_logic_misc.all;

ENTITY forward_unit IS
	PORT
	(
		in_a_address : IN STD_LOGIC_VECTOR( 4 DOWNTO 0);
		in_b_address : IN STD_LOGIC_VECTOR( 4 DOWNTO 0);
		
		in_opcode : IN STD_LOGIC_VECTOR( 7 DOWNTO 0);
		
		in_register_write : IN STD_LOGIC;
		in_write_back_address : IN STD_LOGIC_VECTOR( 4 DOWNTO 0);
		
		out_forward_a : OUT STD_LOGIC;
		out_forward_b : OUT STD_LOGIC
 	);
END forward_unit;

ARCHITECTURE behavioral OF forward_unit IS
BEGIN
--	PROCESS(in_opcode, in_register_write, in_a_address, in_b_address)
--	BEGIN
--		CASE TO_INTEGER(UNSIGNED(in_opcode)) IS
--			WHEN OPCODE_ADD =>
--				out_forward_a <= in_register_write AND AND_REDUCE(in_a_address XNOR in_write_back_address);
--				out_forward_b <= in_register_write AND AND_REDUCE(in_b_address XNOR in_write_back_address);
--			WHEN OTHERS =>
--				out_forward_a <= '0';
--				out_forward_b <= '0';
--		END CASE;
--	END PROCESS;
	
	out_forward_a <= '0';
	out_forward_b <= '0';
END behavioral;