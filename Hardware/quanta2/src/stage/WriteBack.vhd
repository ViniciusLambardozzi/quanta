LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY write_back IS
	PORT
	(
		in_ram_data_select : IN  STD_LOGIC;
	
		in_data : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_ram_data : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		
		out_write_back_data: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
 	);
END write_back;

ARCHITECTURE behavioral OF write_back IS
	SIGNAL s_ram_data_select_vec : STD_LOGIC_VECTOR( 0 DOWNTO 0);
	
BEGIN
	s_ram_data_select_vec(0) <= in_ram_data_select;
	
	res_mux: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 1
	)
	PORT MAP
	(
		in_i(0) => in_data,
		in_i(1) => in_ram_data,
		
		in_sel => s_ram_data_select_vec,
		
		
		out_o => out_write_back_data
	);

END behavioral;
