---------------------------------------------
-- N TO 1 MULTIPLEXER                      --
---------------------------------------------
--IN-----------------------------------------
-- I   : n-input array                     --
-- SEL : generic bit width input selection --
---------------------------------------------
--OUT----------------------------------------
-- O   : output value                      --
---------------------------------------------

USE WORK.types.ALL;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY mux IS 
    GENERIC
    (
		selection_width : POSITIVE := 2
    );
    PORT
    (
		-- Input array size is determined by generic selection width
      i   : IN  bus_array(2**selection_width - 1 DOWNTO 0);
      sel : IN  STD_LOGIC_VECTOR(selection_width - 1 DOWNTO 0);
      -------------------------------------------------------------
      o   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END mux;

ARCHITECTURE behavioral OF mux IS 
BEGIN 
    o <= i(TO_INTEGER(UNSIGNED(sel)));
END behavioral;