-------------------------------------
-- PARALLEL REGISTER               --
-------------------------------------
--IN---------------------------------
-- D   :  input data               --
-- CLK :  1 bit input clock        --
-------------------------------------
--OUT--------------------------------
-- Q   :  output data              --
-------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE WORK.constants.ALL;

ENTITY parallel_register IS
	PORT
	(
		clk : IN  STD_LOGIC;
		-----------------------------------------------------
		d   : IN  STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
		-----------------------------------------------------
		q   : OUT STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0)
	);
END parallel_register;

ARCHITECTURE behavioral OF parallel_register IS
	-- Register memory signal
	SIGNAL memory : STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
	
BEGIN
   -- Wire output data to register memory
	q <= memory;

	PROCESS(clk)
	BEGIN
		-- Write to memory in rising edge if register is enabled
		IF RISING_EDGE(clk) THEN
			memory <= d;
		END IF;
	END PROCESS;
END behavioral;