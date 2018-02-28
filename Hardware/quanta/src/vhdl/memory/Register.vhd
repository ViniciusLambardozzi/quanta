-------------------------------------
-- 32 BIT PARALLEL REGISTER        --
-------------------------------------
--IN---------------------------------
-- D   : 32 bit input data         --
-- EN  :  1 bit input enable       --
-- CLK :  1 bit input clock        --
-------------------------------------
--OUT--------------------------------
-- Q : 32 bit output data          --
-------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY parallel_register IS
	GENERIC
	(
		g_data_width : POSITIVE := 32
	);
	PORT
	(
		in_d   : IN STD_LOGIC_VECTOR(g_data_width - 1 DOWNTO 0);
		in_en  : IN STD_LOGIC;
      in_clk : IN STD_LOGIC;
		--------------------------------------------------------
		out_q  : OUT STD_LOGIC_VECTOR(g_data_width - 1 DOWNTO 0)
	);
END parallel_register;

ARCHITECTURE behavioral OF parallel_register IS
	-- Register memory signal                     
	SIGNAL s_memory : STD_LOGIC_VECTOR(g_data_width - 1 DOWNTO 0);
	
BEGIN
   -- Wire output data to register memory
	out_q <= s_memory;

	PROCESS(in_en, in_clk)
	BEGIN
		-- Write to memory in rising edge if register is enabled
		IF(RISING_EDGE(in_clk) AND in_en = '1') THEN
			s_memory <= in_d;
		END IF;
	END PROCESS;
END behavioral;