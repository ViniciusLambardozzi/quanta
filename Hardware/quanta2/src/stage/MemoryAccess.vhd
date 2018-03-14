LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY memory_access IS
	PORT
	(
		clk         : IN  STD_LOGIC;
		------------------------------------------------
		result      : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		address     : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		w_back      : IN  STD_LOGIC_VECTOR( 4 DOWNTO 0);
		------------------------------------------------
		we          : IN STD_LOGIC;
		------------------------------------------------
		data        : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		ram_data    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		w_back_pass : OUT STD_LOGIC_VECTOR( 4 DOWNTO 0)
 	);
END memory_access;

ARCHITECTURE behavioral OF memory_access IS

BEGIN
	data <= result;
	w_back_pass <= w_back;
	
	ram: ENTITY WORK.data_ram(behavioral)
	GENERIC MAP
	(
		addr_width => DATA_RAM_ADDR_WIDTH
	)
	PORT MAP
	(
		clk      => clk,
		------------------------------------------------------
		data_in  => result,
		addr     => address(DATA_RAM_ADDR_WIDTH - 1 DOWNTO 0),
		------------------------------------------------------
		we       => we,
		------------------------------------------------------
		data_out =>	ram_data
	);

END behavioral;
