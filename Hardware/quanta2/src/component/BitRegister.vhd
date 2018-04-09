LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;

ENTITY parallel_bit_register IS
	PORT
	(
		in_clk : IN  STD_LOGIC;
		
		in_d : IN  STD_LOGIC;
		
		
		out_q : OUT STD_LOGIC
	);
END parallel_bit_register;

ARCHITECTURE behavioral OF parallel_bit_register IS
	-- Register memory signal
	SIGNAL s_memory : STD_LOGIC;
	
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