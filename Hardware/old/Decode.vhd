-------------------------------------
-- INSTRUCTION DECODE              --
-------------------------------------
--IN---------------------------------
-- CLK    : clock                  --
-- EN     : enable                 --
-- ADDR A : reg read A             --
-- ADDR B : reg read B             --
-- W BACK : reg write data         --
-------------------------------------
--OUT--------------------------------
-- DATA A : read output A          --
-- DATA B : read output B          --
-------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY instruction_decode IS
	PORT
	(
		in_clk               : IN  STD_LOGIC;
		in_en                : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		in_instruction       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		in_w_back            : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		------------------------------------------------------
		out_data_a           : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_data_b           : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_data_c           : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_data_immediate   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		out_data_instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
 	);
END instruction_decode;

ARCHITECTURE behavioral OF instruction_decode IS

	SIGNAL s_reg_file : bus_array(REGISTER_DEPTH - 1 DOWNTO 0);
	
	SIGNAL s_addr_a    : STD_LOGIC_VECTOR( 4 DOWNTO 0);
	SIGNAL s_addr_b    : STD_LOGIC_VECTOR( 4 DOWNTO 0);
	SIGNAL s_addr_c    : STD_LOGIC_VECTOR( 4 DOWNTO 0);
	SIGNAL s_immediate : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	FUNCTION opcode_to_type(opcode : IN POSITIVE) RETURN t_instruction_type IS
	BEGIN
		CASE opcode IS
			WHEN c_opcode_load_imediate =>
				RETURN single_reg_data;
			WHEN OTHERS =>
				RETURN UNKNOWN;
		END CASE;
	END opcode_to_type;	
BEGIN

	s_addr_a             <= in_instruction(23 DOWNTO 19);
	s_addr_b             <= in_instruction(18 DOWNTO 14);
	s_addr_c             <= in_instruction(13 DOWNTO  9);
	s_immediate          <= in_instruction(15 DOWNTO  0);
	
	out_data_instruction <= in_instruction(31 DOWNTO 0);
	
	e_registers: FOR i IN 0 TO c_register_depth - 1 GENERATE
	BEGIN
		current_register: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_d   => in_w_back,
			in_en  => in_en(i),
         in_clk => in_clk,
			-----------------------
			out_q  => s_reg_file(i)
		); 
	END GENERATE e_registers;
		
	-- Register bank data output a multiplexer driven by selection signal
	e_m1: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 5
	)
	PORT MAP
	(
		in_i(c_register_depth - 1 DOWNTO 0) => s_reg_file,
		in_sel                              => s_addr_a,
		--------------------------------------------------
		out_o                               => out_data_a
	);
	
	-- Register bank data output b multiplexer driven by selection signal
	e_m2: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 5
	)
	PORT MAP
	(
		in_i(c_register_depth - 1 DOWNTO 0) => s_reg_file,
		in_sel                              => s_addr_b,
		--------------------------------------------------
		out_o                               => out_data_b
	);
	
	e_m3: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 5
	)
	PORT MAP
	(
		in_i(c_register_depth - 1 DOWNTO 0) => s_reg_file,
		in_sel                              => s_addr_c,
		--------------------------------------------------
		out_o                               => out_data_c
	);	
END behavioral;