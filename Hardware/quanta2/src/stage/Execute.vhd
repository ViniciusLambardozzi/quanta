LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY execute IS
	PORT
	(
		in_op : IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
		in_alu_select : IN STD_LOGIC;
		in_immediate_select : IN STD_LOGIC;
		
		in_a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_immediate : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_jump_address : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_write_back_address : IN STD_LOGIC_VECTOR( 4 DOWNTO 0);		
		
		out_jump_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_status : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
		out_memory_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_write_back_address : OUT STD_LOGIC_VECTOR( 4 DOWNTO 0)
 	);
END execute;

ARCHITECTURE behavioral OF execute IS
	SIGNAL s_alu_select_vec : STD_LOGIC_VECTOR(0 DOWNTO 0);
	SIGNAL s_immediate_select_vec : STD_LOGIC_VECTOR(0 DOWNTO 0);
	
	SIGNAL s_alu_b_mux : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	SIGNAL s_alu_result : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_alu_status : STD_LOGIC_VECTOR( 3 DOWNTO 0);
      
	SIGNAL s_shifter_result : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_shifter_status : STD_LOGIC_VECTOR( 3 DOWNTO 0);
BEGIN
	out_write_back_address <= in_write_back_address;

	s_alu_select_vec(0) <= in_alu_select;
   s_immediate_select_vec(0) <= in_immediate_select;

	out_jump_address <= in_jump_address;
	out_memory_address <= in_b;

	b_mux: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 1
	)
	PORT MAP
	(
		in_i(0) => in_b,
		in_i(1) => in_immediate,
		
		in_sel => s_immediate_select_vec,
		
		
		out_o => s_alu_b_mux
	);
	
	shifter: ENTITY WORK.shifter(behavioral)
	PORT MAP
	(
		in_a => in_a,
		in_fun => in_op( 2 DOWNTO 0),
		
		
		out_c => s_shifter_result,
		out_status => s_shifter_status
	);
	
	alu: ENTITY WORK.alu(behavioral)
	PORT MAP
	(
		in_a => in_a,
		in_b => s_alu_b_mux,
		in_cin => '0',
		in_fun => in_op,
		
		
		out_c => s_alu_result,
		out_status => s_alu_status
	);

	res_mux: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 1
	)
	PORT MAP
	(
		in_i(0) => s_shifter_result,
		in_i(1) => s_alu_result,
		
		in_sel => s_alu_select_vec,
		
		
		out_o => out_result
	);
	
	st_mux: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 1
	)
	PORT MAP
	(
		in_i(0)( 3 DOWNTO 0) => s_shifter_status,
		in_i(1)( 3 DOWNTO 0) => s_alu_status,
		
		in_sel => s_alu_select_vec,
		
		
		out_o( 3 DOWNTO 0) => out_status
	);
	
END behavioral;