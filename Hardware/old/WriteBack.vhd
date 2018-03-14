LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY instruction_write_back IS
	PORT
	(
		in_data              : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_ram_data          : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);	
		in_immediate         : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		---------------------------------------------------------
		out_data             : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
 	);
END instruction_write_back;

ARCHITECTURE behavioral OF instruction_write_back IS

	
BEGIN
out_data             <= in_data;
END behavioral;