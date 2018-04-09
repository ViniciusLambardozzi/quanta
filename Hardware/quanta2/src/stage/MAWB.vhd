LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY ma_wb IS
	PORT
	(
		in_clk : IN STD_LOGIC;
	
		in_control_register_write : IN STD_LOGIC;
		in_ram_data_select : IN STD_LOGIC;
		
		in_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_ram_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_write_back_address : IN STD_LOGIC_VECTOR( 4 DOWNTO 0);
		
		out_control_register_write : OUT STD_LOGIC;
		out_ram_data_select : OUT STD_LOGIC;
		
		out_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_ram_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_write_back_address : OUT STD_LOGIC_VECTOR( 4 DOWNTO 0)
	);
END ma_wb;

ARCHITECTURE behavioral OF ma_wb IS
BEGIN
	control_register_write: ENTITY WORK.parallel_bit_register(behavioral)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_control_register_write,
		
		
		out_q => out_control_register_write
	);
	
	ram_data_select: ENTITY WORK.parallel_bit_register(behavioral)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_ram_data_select,
		
		
		out_q => out_ram_data_select
	);
	
	data: ENTITY WORK.parallel_register(behavioral)
	GENERIC MAP
	(
		g_data_width => 32
	)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_data,
		
		
		out_q => out_data
	);
	
	ram_data: ENTITY WORK.parallel_register(behavioral)
	GENERIC MAP
	(
		g_data_width => 32
	)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_ram_data,
		
		
		out_q => out_ram_data
	);
	
	write_back_address: ENTITY WORK.parallel_register(behavioral)
	GENERIC MAP
	(
		g_data_width => 5
	)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_write_back_address,
		
		
		out_q => out_write_back_address
	);
END behavioral;