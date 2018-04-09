-------------------------------------
-- PROCESSOR                       --
-------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

use WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY processor IS
	PORT
	(
		clk      : IN  STD_LOGIC;
		-------------------------------------------
		tmp_data : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
 	);
END processor;

ARCHITECTURE behavioral OF processor IS
	
	SIGNAL fetch_instruction    : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	SIGNAL decode_immediate     : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL decode_a             : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL decode_b             : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL decode_c             : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL decode_opcode        : STD_LOGIC_VECTOR( 7 DOWNTO 0);
	SIGNAL decode_w_back        : STD_LOGIC_VECTOR( 4 DOWNTO 0);
	
	SIGNAL execute_result       : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL execute_status       : STD_LOGIC_VECTOR( 3 DOWNTO 0);
	SIGNAL execute_address      : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL execute_jump_address : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL execute_w_back       : STD_LOGIC_VECTOR( 4 DOWNTO 0);
	
	SIGNAL mem_data             : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL mem_ram_data         : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL mem_w_back_pass      : STD_LOGIC_VECTOR( 4 DOWNTO 0);
	
	SIGNAL back_w_data          : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL back_w_back_pass     : STD_LOGIC_VECTOR( 4 DOWNTO 0);
	
BEGIN
	
	fetch: ENTITY WORK.fetch(behavioral)
	PORT MAP
	(
		clk         => clk,
		--------------------------------------------------
		c_data      => "00000000000000000000000000000000",
		--------------------------------------------------
		jump        => '0',
		--------------------------------------------------
		instruction =>	fetch_instruction	
	);
	
	decode: ENTITY WORK.decode(behavioral)
	PORT MAP
	(
		clk         => clk,
		--------------------------------------------------
		instruction => fetch_instruction,
		--------------------------------------------------
		w_signal    => '0',
		w_addr      => back_w_back_pass,
		w_data      => back_w_data,
		--------------------------------------------------
		immediate   => decode_immediate,
		a           => decode_a,   
		b           => decode_b,      
		c           => decode_c,       
		opcode      => decode_opcode,   
		w_back      => decode_w_back   	
	);
	
	execute: ENTITY WORK.execute(behavioral)
	PORT MAP
	(
		immediate        => decode_immediate,
	   a                => decode_a,
	   b                => decode_b,
	   c                => decode_c,
		w_back           => decode_w_back,
	   -----------------------------------------
	   op               => "0100",
	   alu_select       => '1',
	   immediate_select => '0',
	   -----------------------------------------
	   result           => execute_result,
	   status           => execute_status,
	   address          => execute_address,
	   jump_address     => execute_jump_address,
		w_back_pass      => execute_w_back
	);
	
	memory_access: ENTITY WORK.memory_access(behavioral)
	PORT MAP
	(		
		clk         => clk,
		-------------------------------
		result      => execute_result,
		address     => execute_address,
		w_back      => execute_w_back,
		-------------------------------
		we          => '0',
		-------------------------------
		data        => mem_data,
		ram_data    => mem_ram_data,
		w_back_pass => mem_w_back_pass
	);
	
	write_back: ENTITY WORK.write_back(behavioral)
	PORT MAP
	(
		data            => mem_data,
		ram_data        => mem_ram_data,
		w_back          => mem_w_back_pass,
		-----------------------------------
		ram_data_select => '1',
		-----------------------------------
		w_data          => back_w_data,   
		w_back_pass     => back_w_back_pass
	);
	
	--tmp_data <= fetch_instruction(3 DOWNTO 0);
	
END behavioral; 