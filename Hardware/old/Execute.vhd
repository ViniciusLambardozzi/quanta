-------------------------------------
-- INSTRUCTION EXECUTE             --
-------------------------------------
--IN---------------------------------
-- A         : register A          --
-- B         : register B          --
-- OPCODE    : ALU/SHIFTER OPCODE  --
-- SELECT    : ALU/SHIFTER select  --
-- C         : triple register C   --
-- IMMEDIATE : masked immediate    --
-------------------------------------
--OUT--------------------------------
-- DATA      : operation result    --
-- STATUS    : operation status    --
-- C         : triple register C   --
-- IMMEDIATE : masked immediate    --
-------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

use WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY instruction_execute IS
	PORT
	(
		in_a            : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_b            : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_cin          : IN  STD_LOGIC;
	  
		in_opcode       : IN  STD_LOGIC_VECTOR( 3 DOWNTO 0);
		in_select       : IN  STD_LOGIC;
		  
		in_c            : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);		
		in_immediate    : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		 
		in_instruction  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		-----------------------------------------------------
		out_data        : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_status      : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
		  
		out_c           : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);		
		out_immediate   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		out_instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
 	);
END instruction_execute;

ARCHITECTURE behavioral OF instruction_execute IS
	SIGNAL s_shifter_data   : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_alu_data       : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	SIGNAL s_shifter_status : STD_LOGIC_VECTOR( 3 DOWNTO 0);
	SIGNAL s_alu_status     : STD_LOGIC_VECTOR( 3 DOWNTO 0);
	
	SIGNAL s_select_vector  : STD_LOGIC_VECTOR( 0 DOWNTO 0);
BEGIN
	out_c         <= in_c;
	out_immediate <= in_immediate;
	s_select_vector(0) <= in_select;

	e_shifter: ENTITY WORK.shifter(behavioral)
	PORT MAP
	(
		in_a       => in_a,
		in_fun     => in_opcode( 2 DOWNTO 0),
		------------------------------
		out_c      => s_shifter_data,
		out_status => s_shifter_status
	);
	e_alu: ENTITY WORK.alu(behavioral)
	PORT MAP
	(
		in_a       => in_a,
		in_b       => in_b,
		in_cin     => in_cin,
		in_fun     => in_opcode,
		--------------------------
		out_c      => s_alu_data,
		out_status => s_alu_status
	);
	
	e_mux_data: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 1
	)
	PORT MAP
	(
		in_i(0) => s_shifter_data,
		in_i(1) => s_alu_data,
		in_sel  => s_select_vector,
		---------------------------------------
		out_o   => out_data		
	);
	e_mux_status: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 1
	)
	PORT MAP
	(
		in_i(0)(3 DOWNTO 0) => s_shifter_status,
		in_i(1)(3 DOWNTO 0) => s_alu_status,
		in_sel              => s_select_vector,
		----------------------------------------
		out_o               => out_data		
	);
END behavioral;