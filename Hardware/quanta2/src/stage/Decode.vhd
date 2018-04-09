LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY decode IS
	PORT
	(
		in_clk : IN  STD_LOGIC;
		in_write_signal : IN  STD_LOGIC;
		
		in_instruction : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_write_address : IN  STD_LOGIC_VECTOR( 4 DOWNTO 0);
		in_write_data : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		out_a : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_b : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_jump_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_immediate : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_opcode : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0);
		out_write_back_address : OUT STD_LOGIC_VECTOR( 4 DOWNTO 0)
 	);
END decode;

ARCHITECTURE behavioral OF decode IS

BEGIN
	
	out_immediate(15 DOWNTO 0) <= in_instruction(15 DOWNTO 0);
	out_opcode <= in_instruction(31 DOWNTO 24);
	out_write_back_address <= in_instruction(23 DOWNTO 19);

	reg_file: ENTITY WORK.register_file(behavioral)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_write_signal => in_write_signal,
		in_write_address => in_write_address,
		in_write_data => in_write_data,
		
		in_address_a => in_instruction(23 DOWNTO 19),
		in_address_b => in_instruction(18 DOWNTO 14),
		in_address_c => in_instruction(13 DOWNTO  9),
		
		out_a => out_a,
		out_b => out_b,
		out_c => out_jump_address	 
	);
END behavioral;