--------------------------------------------
-- 32 bit 32 register register file       --
--------------------------------------------
--IN----------------------------------------
-- DATA   : 32 bit input value            --
-- ADDR_A : 5 bit A register selector     --
-- ADDR_B : 5 bit B register selector     --
-- CLK    : 1 bit system clock            --
-- EN     : 32 bit register enable signal --
--------------------------------------------
--OUT---------------------------------------
-- A      : 32 bit output value A         --
-- B      : 32 bit output value B         --
--------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use WORK.constants.ALL;
use WORK.types.ALL;

ENTITY register_file IS
	PORT
	(
		clk    : IN  STD_LOGIC;
		-------------------------------------------
		w_data : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		-------------------------------------------
		addr_a : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		addr_b : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		addr_c : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		w_addr : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		
		--------------------------------------------
		a      : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		b      : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		c      : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END register_file;

ARCHITECTURE behavioral OF register_file IS
	SIGNAL reg_file : bus_array(REGISTER_DEPTH - 1 DOWNTO 0);
	
BEGIN
	
	registers: FOR i IN 0 TO REGISTER_DEPTH - 1 GENERATE
	BEGIN
		current_register: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			clk => clk,
         ------------------
			d   => w_data,
			------------------
			q   => reg_file(i)
			
		);
	END GENERATE registers;
		
	mux_a: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		selection_width => 5
	)
	PORT MAP
	(
		i(REGISTER_DEPTH - 1 DOWNTO 0) => reg_file,
		-------------------------------------------
		sel                              => addr_a,
		-------------------------------------------
		o                                => a
	);
	
	mux_b: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		selection_width => 5
	)
	PORT MAP
	(
		i(REGISTER_DEPTH - 1 DOWNTO 0) => reg_file,
		-------------------------------------------
		sel                              => addr_b,
		-------------------------------------------
		o                                => b
	);
	
	mux_c: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		selection_width => 5
	)
	PORT MAP
	(
		i(REGISTER_DEPTH - 1 DOWNTO 0) => reg_file,
		-------------------------------------------
		sel                            => addr_c,
		-------------------------------------------
		o                              => c
	);
END behavioral;