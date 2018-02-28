-----------------------------
-- IO controller           --
-- PORT MAPPING            --
-- DATA : 32 bit data word --
-- ADDR : 32 bit MAR value --
-- EN   : 1 bit enable     --
-- CLK  : 1 bit clock      --
-----------------------------
-- OUT  : 32 bit data word --
-----------------------------

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
		---------------------------------------------------
		out_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		out_hex  : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END io_controller;

ARCHITECTURE behavioral OF io_controller IS
BEGIN
	-- DE2-115

	PROCESS(in_we, in_en, in_clk)
	BEGIN
				IF(RISING_EDGE(in_clk) AND in_we = '1' AND in_en = '1') THEN
					CASE(in_addr) IS
						-- Write hex display data  from mapped address
						WHEN "10000000000000000000000000000000" =>
							out_hex <= in_data;
						WHEN OTHERS =>
							-- Reading from non-mapped addresses is a code error
					END CASE;
				END IF;
				
				IF(RISING_EDGE(in_clk) AND in_we = '0' AND in_en = '1') THEN
					CASE(in_addr) IS
						-- Read hex display data  from mapped address
						WHEN "10000000000000000000000000000000" =>
							out_data <= out_hex;
						-- Read push button data  from mapped address
						WHEN "11000000000000000000000000000000" =>
							out_data <= "00000000000000000000000000000000";
							out_data(3 DOWNTO 0) <= in_push_buttons;
						-- Read switches data  from mapped address
						WHEN "11000000000000000000000000000001" =>
							out_data <= "00000000000000000000000000000000";
							out_data(17 DOWNTO 0) <= in_switches;							
						WHEN OTHERS =>
							-- Reading from non-mapped addresses is a code error
					END CASE;
				END IF;
	END PROCESS;

END behavioral;