LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY f_d IS
	PORT
	(
		in_clk : IN STD_LOGIC;
	
		in_instruction : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		
		out_instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END f_d;

ARCHITECTURE behavioral OF f_d IS
BEGIN

	instruction: ENTITY WORK.parallel_register(behavioral)
	GENERIC MAP
	(
		g_data_width => 32
	)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_instruction,
		
		
		out_q => out_instruction
	);

END behavioral;