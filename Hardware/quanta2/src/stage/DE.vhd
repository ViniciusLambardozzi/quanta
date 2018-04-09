LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY d_e IS
	PORT
	(
		in_clk : IN STD_LOGIC;
	
		in_control_register_write : IN STD_LOGIC;
		
		in_control_we : IN STD_LOGIC;		
		
		in_control_alu : IN STD_LOGIC;
		in_control_immediate : IN STD_LOGIC;
		in_control_function : IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
		
		in_control_ram_data  : IN STD_LOGIC;
		
		
		in_opcode : IN STD_LOGIC_VECTOR( 7 DOWNTO 0);
		
		in_a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);		
		in_jump_address : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_immediate : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_write_back_address : IN STD_LOGIC_VECTOR( 4 DOWNTO 0);
		
		
		out_control_register_write : OUT STD_LOGIC;
		
		out_control_ram_data  : OUT STD_LOGIC;
		
		out_control_we : OUT STD_LOGIC;
		
		out_opcode : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0);
		
		
		out_control_function : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
		out_control_alu : OUT STD_LOGIC;
		out_control_immediate : OUT STD_LOGIC;
	
		out_a : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_b : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_immediate : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_jump_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);		
		out_write_back_address : OUT STD_LOGIC_VECTOR( 4 DOWNTO 0)
	);
END d_e;

ARCHITECTURE behavioral OF d_e IS
BEGIN
	control_register_write: ENTITY WORK.parallel_bit_register(behavioral)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_control_register_write,
		
		
		out_q => out_control_register_write
	);
	
	control_we : ENTITY WORK.parallel_bit_register(behavioral)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_control_we,
		
		
		out_q => out_control_we
	);
	
	control_alu: ENTITY WORK.parallel_bit_register(behavioral)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_control_alu,
		
		
		out_q => out_control_alu
	);
	control_immediate: ENTITY WORK.parallel_bit_register(behavioral)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_control_immediate,
		
		
		out_q => out_control_immediate
	);
	control_function: ENTITY WORK.parallel_register(behavioral)
	GENERIC MAP
	(
		g_data_width => 4
	)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_control_function,
		
		
		out_q => out_control_function
	);
	
	control_ram_data: ENTITY WORK.parallel_bit_register(behavioral)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_control_ram_data,
		
		
		out_q => out_control_ram_data
	);
	
	
	opcode: ENTITY WORK.parallel_register(behavioral)
	GENERIC MAP
	(
		g_data_width => 8
	)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_opcode,
		
		
		out_q => out_opcode
	);
	
	a: ENTITY WORK.parallel_register(behavioral)
	GENERIC MAP
	(
		g_data_width => 32
	)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_a,
		
		
		out_q => out_a
	);
	b: ENTITY WORK.parallel_register(behavioral)
	GENERIC MAP
	(
		g_data_width => 32
	)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_b,
		
		
		out_q => out_b
	);
	jump_address: ENTITY WORK.parallel_register(behavioral)
	GENERIC MAP
	(
		g_data_width => 32
	)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_jump_address,
		
		
		out_q => out_jump_address
	);
	immediate: ENTITY WORK.parallel_register(behavioral)
	GENERIC MAP
	(
		g_data_width => 32
	)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_immediate,
		
		
		out_q => out_immediate
	);
	write_back_address: ENTITY WORK.parallel_register(behavioral)
	GENERIC MAP
	(
		g_data_width => 5
	)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_write_back_address,
		
		
		out_q => out_write_back_address
	);
	
END behavioral;