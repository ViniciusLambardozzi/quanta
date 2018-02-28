-----------------------------------
-- 32 bit data mask              --
-----------------------------------
--IN-------------------------------
-- DATA   : 32 bit input value   --
-- MASK   : 32 bit data mask     --
-----------------------------------
--OUT------------------------------
-- A      : 32 bit output value  --
-----------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY data_mask IS
	PORT
	(
		in_data   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_mask   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		-----------------------------------------------
		out_data  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END data_mask;

ARCHITECTURE behavioral OF data_mask IS

BEGIN
	out_data <= in_data AND in_mask;
END behavioral;
