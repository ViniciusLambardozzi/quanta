USE WORK.types.ALL;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY mux IS 
    GENERIC
    (
		g_selection_width : POSITIVE := 2
    );
    PORT
    (
      in_i : IN bus_array(2**g_selection_width - 1 DOWNTO 0);
      in_sel : IN STD_LOGIC_VECTOR(g_selection_width - 1 DOWNTO 0);
		
		
      out_o : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END mux;

ARCHITECTURE behavioral OF mux IS 
BEGIN 
    out_o <= in_i(TO_INTEGER(UNSIGNED(in_sel)));
END behavioral;