LIBRARY ieee;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

USE WORK.constants.ALL;

ENTITY fetch IS
	PORT
	(
		in_clk : IN  STD_LOGIC;
		in_jump_signal : IN STD_LOGIC;
		
		in_jump_address : IN STD_LOGIC_VECTOR(31 DOWNTO 0);	
		
		
		out_instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		out_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
 	);
END fetch;

ARCHITECTURE behavioral OF fetch IS
	SIGNAL s_pc_value : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_incrementer_value : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	SIGNAL s_jump_vector : STD_LOGIC_VECTOR( 0 DOWNTO 0);
	SIGNAL s_mux_value : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN

	s_jump_vector(0) <= in_jump_signal;
	out_address <= s_pc_value;

	pc: ENTITY WORK.parallel_register(behavioral)
	PORT MAP 
	(
		in_clk => in_clk,
		
		in_d   => s_mux_value,
		
		
		out_q   => s_pc_value
	);
	
	adder: ENTITY WORK.adder(behavioral)
	PORT MAP
	(
		in_a => s_pc_value,
		in_b => STD_LOGIC_VECTOR(TO_UNSIGNED(1, 32)),
		in_cin => '0',
		
		
		out_c => s_incrementer_value,
		out_cout => OPEN
	);
	
	mux: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 1
	)
	PORT MAP
	(
		in_i(0) => s_incrementer_value,
		in_i(1) => in_jump_address,
		
		in_sel => s_jump_vector,
		
		
		out_o => s_mux_value
	);

	instruction_ram: ENTITY WORK.instruction_ram(behavioral)
	GENERIC MAP
	(
		g_addr_width => INSTRUCTION_RAM_ADDR_WIDTH
	)
	PORT MAP
	(
		in_clk => in_clk,		

      in_addr => s_pc_value(INSTRUCTION_RAM_ADDR_WIDTH - 1 DOWNTO 0), 
		
		
      out_data => out_instruction
	);
	

END behavioral;