LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use WORK.constants.ALL;
use WORK.types.ALL;

ENTITY register_file IS
	PORT
	(
		in_clk : IN  STD_LOGIC;
		
		in_write_signal : IN  STD_LOGIC;		
		in_write_address : IN  STD_LOGIC_VECTOR( 4 DOWNTO 0);
		in_write_data : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		in_address_a : IN  STD_LOGIC_VECTOR( 4 DOWNTO 0);
		in_address_b : IN  STD_LOGIC_VECTOR( 4 DOWNTO 0);
		in_address_c : IN  STD_LOGIC_VECTOR( 4 DOWNTO 0);
		
		
		out_a : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_b : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_c : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END register_file;

ARCHITECTURE behavioral OF register_file IS
	SIGNAL s_register_file : bus_array(REGISTER_DEPTH - 1 DOWNTO 0);
	SIGNAL s_decoded_address : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
BEGIN
	
	PROCESS(in_write_address)
	BEGIN
		s_decoded_address <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, s_decoded_address'LENGTH));
		s_decoded_address(TO_INTEGER(UNSIGNED(in_write_address))) <= '1';
	END PROCESS;
	
	registers: FOR i IN 0 TO REGISTER_DEPTH - 1 GENERATE
	BEGIN
		current_register: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_clk => NOT(in_clk) AND in_write_signal AND s_decoded_address(i),

			in_d => in_write_data,
			
			
			out_q => s_register_file(i)
			
		);
	END GENERATE registers;
		
	mux_a: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 5
	)
	PORT MAP
	(
		in_i(REGISTER_DEPTH - 1 DOWNTO 0) => s_register_file,
		
		in_sel => in_address_a,
		
		
		out_o => out_a
	);
	
	mux_b: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 5
	)
	PORT MAP
	(
		in_i(REGISTER_DEPTH - 1 DOWNTO 0) => s_register_file,
		
		in_sel => in_address_b,
		
		
		out_o => out_b
	);
	
	mux_c: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 5
	)
	PORT MAP
	(
		in_i(REGISTER_DEPTH - 1 DOWNTO 0) => s_register_file,
		
		in_sel => in_address_c,
		
		
		out_o => out_c
	);
END behavioral;