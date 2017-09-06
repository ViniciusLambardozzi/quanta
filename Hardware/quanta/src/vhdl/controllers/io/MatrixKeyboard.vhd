----------------------------------------
-- 4x4 matrix keyboard decoder        --
-- PORT MAPPING                       --
-- SCAN_LINE : 4 bit scan input       --
-- clk       : 1 bit clock input      --
----------------------------------------
-- SCAN_ROW : 4 bit scan output       --
-- data     : 4 bit data output       --
----------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY matrix_keyboard_decoder IS
	PORT
	(
		in_scan_line : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		in_clk       : IN STD_LOGIC;
		-----------------------------------------------
		out_scan_row : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		out_data     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END matrix_keyboard_decoder;

ARCHITECTURE behavioral OF matrix_keyboard_decoder IS
	BEGIN
		PROCESS(in_clk)
		BEGIN
				in_scan_line <= "1111";
				FOR i IN 0 TO 3 LOOP
					out_scan_row <= "0000";
					out_scan_row(i) <= '1';
					
					FOR j IN 0 TO 3 LOOP
						IF(in_scan_line(j) = '0') THEN
							out_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(i * 4 + j, out_data'LENGTH));
							EXIT;
						ELSE
							out_data <= "0000";
							EXIT;
						END IF;
					END LOOP;
				END LOOP;
		END PROCESS;
END behavioral;