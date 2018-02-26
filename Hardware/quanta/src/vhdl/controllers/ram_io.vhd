LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ram_io IS
	PORT(
		in_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		in_push_buttons : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		in_switches     : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		
		in_we   : IN STD_LOGIC;
		in_en   : IN STD_LOGIC;
		
		in_clk  : IN STD_LOGIC;
		-------------------------------------------
		out_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		out_hex  : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END ram_io;

ARCHITECTURE behavioral OF ram_io IS

	SIGNAL s_ram_data_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL  s_io_data_out : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

	ram: ENTITY WORK.ram(behavioral)
	GENERIC MAP
	(
		g_addr_width => 10
	)
	PORT MAP
	(
		in_data,
      in_addr(9 DOWNTO 0),
      in_we,
      (in_en AND NOT(in_addr(31))),
      in_clk,
      -----------------------------
      s_ram_data_out
	);
	
	io: ENTITY WORK.io_controller(behavioral)
	PORT MAP
	(
		in_data,
		in_addr,
		in_we,
		(in_en AND in_addr(31)),
		in_clk,
		
		in_push_buttons,
		in_switches,
		-------------------------------------------
		s_io_data_out,
		
		out_hex
	);
	
	
	data_control_mux: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 1
	)
	PORT MAP
	(
		in_i(0) => s_ram_data_out,
		in_i(1) => s_io_data_out,
		in_sel => in_addr(31 DOWNTO 31),
		out_o => out_data
	);	
	
END behavioral;