LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;

PACKAGE types IS
	SUBTYPE bus_wire IS STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
   TYPE bus_array IS ARRAY(NATURAL RANGE<>) OF bus_wire;
END PACKAGE;