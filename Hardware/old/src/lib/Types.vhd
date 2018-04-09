LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;

-- Type definitions
PACKAGE types IS
	-- STATE MACHINE SIGNAL TYPE
	type t_state_type       IS (fetch, decode, execute, mem_access, write_back);
	type t_instruction_type IS (single_reg, single_reg_data, double_reg, triple_reg, UNKNOWN);
	
	SUBTYPE bus_wire IS STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
   TYPE bus_array IS ARRAY(NATURAL RANGE<>) OF bus_wire;
END PACKAGE;