LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY decode IS
	PORT
	(
		clk         : IN  STD_LOGIC;
		------------------------------------------------
		instruction : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		------------------------------------------------
		w_signal    : IN  STD_LOGIC;
		w_addr      : IN  STD_LOGIC_VECTOR( 4 DOWNTO 0);
		w_data      : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		------------------------------------------------
		immediate   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		a           : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		b           : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		c           : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		opcode      : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0);
		w_back      : OUT STD_LOGIC_VECTOR( 4 DOWNTO 0)
 	);
END decode;

ARCHITECTURE behavioral OF decode IS

BEGIN
	
	immediate(15 DOWNTO 0) <= instruction(15 DOWNTO 0);
	opcode <= instruction(31 DOWNTO 24);
	w_back <= instruction(23 DOWNTO 19);

	reg_file: ENTITY WORK.register_file(behavioral)
	PORT MAP
	(
		clk      => clk,
		--------------------------------------
		w_signal => w_signal,
		w_addr   => w_addr,
		w_data   => w_data,
		--------------------------------------
		addr_a   => instruction(23 DOWNTO 19),
		addr_b   => instruction(18 DOWNTO 14),
		addr_c   => instruction(13 DOWNTO  9),
		--------------------------------------
		a        => a,
		b        => b,
		c        =>	c	 
	);
END behavioral;