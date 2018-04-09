LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;

ENTITY parallel_register IS
	GENERIC
	(
		g_data_width : INTEGER := DATA_WIDTH
	);
	PORT
	(
		in_clk : IN  STD_LOGIC;
		
		in_d : IN  STD_LOGIC_VECTOR(g_data_width - 1 DOWNTO 0);
		
		
		out_q : OUT STD_LOGIC_VECTOR(g_data_width - 1 DOWNTO 0)
	);
END parallel_register;

ARCHITECTURE behavioral OF parallel_register IS
	-- Register memory signal
	SIGNAL s_memory : STD_LOGIC_VECTOR(g_data_width - 1 DOWNTO 0);
	
BEGIN
   -- Wire output data to register memory
	out_q <= s_memory;

	PROCESS(in_clk)
	BEGIN
		-- Write to memory in rising edge if register is enabled
		IF RISING_EDGE(in_clk) THEN
			s_memory <= in_d;
		END IF;
	END PROCESS;
END behavioral;