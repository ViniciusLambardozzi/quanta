LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY execute IS
	PORT
	(
		immediate        : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		a                : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		b                : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		c                : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		w_back           : IN STD_LOGIC_VECTOR( 4 DOWNTO 0);
		-----------------------------------------------------
		op               : IN  STD_LOGIC_VECTOR( 3 DOWNTO 0);
		alu_select       : IN  STD_LOGIC;
		immediate_select : IN  STD_LOGIC;
		-----------------------------------------------------
		result           : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		status           : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
		address          : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		jump_address     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		w_back_pass      : OUT STD_LOGIC_VECTOR( 4 DOWNTO 0)
 	);
END execute;

ARCHITECTURE behavioral OF execute IS
	SIGNAL alu_select_vec       : STD_LOGIC_VECTOR(0 DOWNTO 0);
	SIGNAL immediate_select_vec : STD_LOGIC_VECTOR(0 DOWNTO 0);	
	SIGNAL alu_b_mux            : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	SIGNAL alu_result           : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL alu_status           : STD_LOGIC_VECTOR( 3 DOWNTO 0);
      
	SIGNAL shifter_result       : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL shifter_status       : STD_LOGIC_VECTOR( 3 DOWNTO 0);
BEGIN
	w_back_pass <= w_back;

	alu_select_vec(0)       <= alu_select;
   immediate_select_vec(0) <= immediate_select;

	jump_address <= c;
	address <= b;

	b_mux: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		selection_width => 1
	)
	PORT MAP
	(
		i(0) => b,
		i(1) => immediate,
		-----------------------------
		sel  => immediate_select_vec,
		-----------------------------
		o    => alu_b_mux
	);
	
	shifter: ENTITY WORK.shifter(behavioral)
	PORT MAP
	(
		in_a       => a,
		in_fun     => op( 2 DOWNTO 0),
		------------------------------
		out_c      => shifter_result,
		out_status => shifter_status
	);
	
	alu: ENTITY WORK.alu(behavioral)
	PORT MAP
	(
		in_a       => a,
		in_b       => alu_b_mux,
		in_cin     => '0',
		in_fun     => op,
		-------------------------
		out_c      => alu_result,
		out_status => alu_status
	);

	res_mux: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		selection_width => 1
	)
	PORT MAP
	(
		i(0) => shifter_result,
		i(1) => alu_result,
		-----------------------
		sel  => alu_select_vec,
		-----------------------
		o    => result
	);
	
	st_mux: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		selection_width => 1
	)
	PORT MAP
	(
		i(0)( 3 DOWNTO 0) => shifter_status,
		i(1)( 3 DOWNTO 0) => alu_status,
		------------------------------------
		sel               => alu_select_vec,
		------------------------------------
		o( 3 DOWNTO 0)    => status
	);
	
END behavioral;