----------------------------------------
-- IO controller                      --
-- PORT MAPPING                       --
-- data_in : 32 bit data input        --
-- addr_in : 32 bit address input     --
-- enable  : 1 bit enable             --
-- clk     : 1 bit clock              --
----------------------------------------
-- data_out : 32 bit data output      --
----------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY io_controller IS
	PORT
	(
		in_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_we   : IN STD_LOGIC;
		in_en   : IN STD_LOGIC;
		in_clk  : IN STD_LOGIC;
		
		in_push_buttons : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		in_switches     : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		-------------------------------------------
		out_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		out_hex  : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END io_controller;

ARCHITECTURE behavioral OF io_controller IS
BEGIN
	-- DE2-115
	
	-- HEX DISPLAYS
	PROCESS(in_we, in_addr, in_en, in_clk)
	BEGIN
				IF(FALLING_EDGE(in_clk) AND in_we = '1' AND in_en = '1') THEN
					CASE(in_addr) IS
						WHEN "10000000000000000000000000000000" =>
							out_hex <= in_data;
						WHEN OTHERS =>
					END CASE;
				END IF;
				IF(FALLING_EDGE(in_clk) AND in_we = '0' AND in_en = '1') THEN
					CASE(in_addr) IS
						WHEN "10000000000000000000000000000000" =>
							out_data <= out_hex;
						WHEN "11000000000000000000000000000000" =>
							out_data <= "00000000000000000000000000000000";
							out_data(3 DOWNTO 0) <= in_push_buttons;
						WHEN "11000000000000000000000000000001" =>
							out_data <= "00000000000000000000000000000000";
							out_data(17 DOWNTO 0) <= in_switches;							
						WHEN OTHERS =>
						out_data <= "10101010101010101010010101010101";
					END CASE;
				END IF;
	END PROCESS;

END behavioral;