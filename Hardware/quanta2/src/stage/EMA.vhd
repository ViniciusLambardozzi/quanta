LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY e_ma IS
	PORT
	(
		in_clk : IN STD_LOGIC;
	
		in_control_register_write : IN STD_LOGIC;
		in_ram_data_select : IN STD_LOGIC;
		in_we : IN STD_LOGIC;
		
		in_opcode : IN STD_LOGIC_VECTOR( 7 DOWNTO 0);
		in_jump_address : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_result : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_status : IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
		in_memory_address : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_write_back_address : IN STD_LOGIC_VECTOR( 4 DOWNTO 0);
		
		
		out_jump_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_opcode : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0);
		out_status : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
		
		out_control_register_write : OUT STD_LOGIC;
		out_ram_data_select : OUT STD_LOGIC;
		out_we : OUT STD_LOGIC;
		
		out_result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_memory_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_write_back_address : OUT STD_LOGIC_VECTOR( 4 DOWNTO 0)
	);
END e_ma;

ARCHITECTURE behavioral OF e_ma IS
BEGIN
	control_register_write: ENTITY WORK.parallel_bit_register(behavioral)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_control_register_write,
		
		
		out_q => out_control_register_write
	);
	
	ram_data_select: ENTITY WORK.parallel_bit_register(behavioral)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_ram_data_select,
		
		
		out_q => out_ram_data_select
	);
	
	we: ENTITY WORK.parallel_bit_register(behavioral)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_we,
		
		
		out_q => out_we
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
	
	result: ENTITY WORK.parallel_register(behavioral)
	GENERIC MAP
	(
		g_data_width => 32
	)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_result,
		
		
		out_q => out_result
	);
	
	status: ENTITY WORK.parallel_register(behavioral)
	GENERIC MAP
	(
		g_data_width => 4
	)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_status,
		
		
		out_q => out_status
	);
	
	memory_address: ENTITY WORK.parallel_register(behavioral)
	GENERIC MAP
	(
		g_data_width => 32
	)
	PORT MAP
	(
		in_clk => in_clk,
		
		in_d => in_memory_address,
		
		
		out_q => out_memory_address
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