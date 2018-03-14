-------------------------------------
-- INSTRUCTION FETCH               --
-------------------------------------
--IN---------------------------------
-------------------------------------
-- CLK    : clock                  --
---------------------------------------
--DATA---------------------------------
-- C DATA      : jump address        --
---------------------------------------
--CONTROL------------------------------
-- ZERO        : alu zero            --
-- JUMP        : jump control        --
---------------------------------------
---------------------------------------
--OUT----------------------------------
---------------------------------------
--DATA---------------------------------
-- INSTRUCTION : fetched instruction --
---------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY fetch IS
	PORT
	(
		clk         : IN  STD_LOGIC;
		------------------------------------------------
		c_data      : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		------------------------------------------------
		jump        : IN  STD_LOGIC;
		------------------------------------------------
		instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
 	);
END fetch;

ARCHITECTURE behavioral OF fetch IS
	SIGNAL pc_value          : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL incrementer_value : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	SIGNAL jump_vector       : STD_LOGIC_VECTOR( 0 DOWNTO 0);
	SIGNAL mux_value         : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN

	jump_vector(0) <= jump;

	pc: ENTITY WORK.parallel_register(behavioral)
	PORT MAP 
	(
		clk => clk,
		-----------------
		d   => mux_value,
		-----------------
		q   => pc_value
	);
	
	adder: ENTITY WORK.adder(behavioral)
	PORT MAP
	(
		a     => pc_value,
		b     => STD_LOGIC_VECTOR(TO_UNSIGNED(1, 32)),
		cin   => '0',
		----------------------------------------------
		c    => incrementer_value,
		cout => OPEN
	);
	
	mux: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		selection_width => 1
	)
	PORT MAP
	(
		i(0) => incrementer_value,
		i(1) => c_data,
		--------------------------
		sel  => jump_vector,
		--------------------------
		o    => mux_value
	);

	ram: ENTITY WORK.ram(behavioral)
	GENERIC MAP
	(
		addr_width => PROGRAM_RAM_ADDR_WIDTH
	)
	PORT MAP
	(
		clk      => clk,
		----------------------------------------------------------

      addr     => pc_value(PROGRAM_RAM_ADDR_WIDTH - 1 DOWNTO 0),  
      ----------------------------------------------------------
      data_out => instruction
	);
	
END behavioral;