---------------------------------------------------
-- Ram/IO mapping module                         --
---------------------------------------------------
--IN-----------------------------------------------
-- DATA : 32 bit data word                       --
-- ADDR : 32 bit MAR value                       --
-- PUSH_BUTTONS : DE2-115 dev board push buttons --
-- SWITCHES     : DE2-115 dev board switches     --
-- WE           : 1 bit write enable signal      --
-- EN           : 1 bit enable signal            --
-- CLK          : 1 bit system clock             --
---------------------------------------------------
--OUT----------------------------------------------
-- DATA         : 32 bit data word               --
-- HEX          : DE2-115 dev board hex displays --
---------------------------------------------------

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
		---------------------------------------------------
		out_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		out_hex  : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END ram_io;

ARCHITECTURE behavioral OF ram_io IS

	-- Ram output data signal
	SIGNAL s_ram_data_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
	-- Mapped IO output data signal
	SIGNAL  s_io_data_out : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

	-- RAM module
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
		-- Enable signal for RAM is set based on address
		-- Bit 31 of address works as a flag for IO access
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
		-- Enable signal for RAM is set based on address
		-- Bit 31 of address works as a flag for IO access
		(in_en AND in_addr(31)),
		in_clk,		
		in_push_buttons,
		in_switches,
		------------------------
		s_io_data_out,
		
		out_hex
	);
	
	-- Multiplexer selects output data based on IO flag from MAR
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
		--------------------------------
		out_o => out_data
	);	
	
END behavioral;