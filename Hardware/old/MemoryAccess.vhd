-------------------------------------
-- MEMORY ACCESS                   --
-------------------------------------
--IN---------------------------------
-- CLK       : clock               --
-- EN        : enable              --
-- WE        : write enable        --
-- DATA      : execute result      --
-- DATA B    : reg read B          --
-- DATA C    : reg read C          --
-- IMMEDIATE : immediate data      --
-- INSTRUCTION :                   --
-------------------------------------
--OUT--------------------------------
-- DATA   : read output A          --
-- RAM DATA : read output B          --
-- IMMEDIATE 
-- INSTRUCTION 
-------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY instruction_mem_access IS
	PORT
	(
		in_clk               : IN  STD_LOGIC;
		in_en                : IN  STD_LOGIC;
		in_we                : IN  STD_LOGIC;
		
		in_data              : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_data_b            : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_data_c            : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_instruction       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);		
		in_immediate         : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		------------------------------------------------------
		out_data             : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_ram_data         : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_data_immediate   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		out_data_instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
 	);
END instruction_mem_access;

ARCHITECTURE behavioral OF instruction_mem_access IS

	
BEGIN
out_data             <= in_data;
out_ram_data         <= in_data; -- TMP
out_data_immediate   <= in_immediate;
out_data_instruction <= in_instruction;


END behavioral;