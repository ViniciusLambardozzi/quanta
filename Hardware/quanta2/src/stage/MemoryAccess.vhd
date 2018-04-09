LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY memory_access IS
	PORT
	(
		in_clk : IN  STD_LOGIC;
		in_we : IN STD_LOGIC;
		
		in_result : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_memory_address : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_write_back_address : IN  STD_LOGIC_VECTOR( 4 DOWNTO 0);
		
		
		out_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_ram_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_write_back_address : OUT STD_LOGIC_VECTOR( 4 DOWNTO 0);
		
		out_debug_port : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
 	);
END memory_access;

ARCHITECTURE behavioral OF memory_access IS
	SIGNAL s_debug_port : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
	out_data <= in_result;
	out_write_back_address <= in_write_back_address;
	
	ram: ENTITY WORK.data_ram(behavioral)
	GENERIC MAP
	(
		g_address_width => DATA_RAM_ADDR_WIDTH
	)
	PORT MAP
	(
		in_clk => in_clk,
		in_we => in_we,
		
		in_data => in_result,
		in_address => in_memory_address(DATA_RAM_ADDR_WIDTH - 1 DOWNTO 0),
		
		
		out_data => out_ram_data
	);
	
	PROCESS(in_memory_address)
	BEGIN
		IF(in_memory_address = "00000000000000000000000011111111") THEN
			out_debug_port <= in_result;
		END IF;
	END PROCESS;

END behavioral;
