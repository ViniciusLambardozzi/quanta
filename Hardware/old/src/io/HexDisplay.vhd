----------------------------------
-- Hex display controller       --
----------------------------------
--IN------------------------------
-- VALUE   : 4 bit input value  --
----------------------------------
--OUT-----------------------------
-- DISPLAY : 7 bit output value --
----------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY hex_display IS
	PORT
	(
		in_value    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		out_display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END hex_display;

ARCHITECTURE behavioral OF hex_display IS

BEGIN
	PROCESS(in_value)
	BEGIN
		-- For each 4 bit number set corresponding 7 segments
		CASE in_value IS
			WHEN "0000" => out_display <= "0000001";
			WHEN "0001" => out_display <= "1001111";
			WHEN "0010" => out_display <= "0010010";
			WHEN "0011" => out_display <= "0000110";
			WHEN "0100" => out_display <= "1001100";
			WHEN "0101" => out_display <= "0100100";
			WHEN "0110" => out_display <= "0100000";
			WHEN "0111" => out_display <= "0001111";
			WHEN "1000" => out_display <= "0000000";
			WHEN "1001" => out_display <= "0000100";
			WHEN "1010" => out_display <= "0001000";
			WHEN "1011" => out_display <= "1100000";
			WHEN "1100" => out_display <= "0110001";
			WHEN "1101" => out_display <= "1000010";
			WHEN "1110" => out_display <= "0110000";
			WHEN "1111" => out_display <= "0111000";			
		END CASE;		
	END PROCESS;

END behavioral;