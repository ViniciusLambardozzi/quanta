LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY write_back IS
	PORT
	(
		data            : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ram_data        : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		w_back          : IN  STD_LOGIC_VECTOR( 4 DOWNTO 0); 
		----------------------------------------------------
		ram_data_select : IN  STD_LOGIC;
		----------------------------------------------------
		w_data          : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		w_back_pass     : OUT STD_LOGIC_VECTOR( 4 DOWNTO 0)		
 	);
END write_back;

ARCHITECTURE behavioral OF write_back IS
	SIGNAL ram_data_select_vec : STD_LOGIC_VECTOR( 0 DOWNTO 0);
	
BEGIN
	w_back_pass <= w_back;
	ram_data_select_vec(0) <= ram_data_select;
	
	res_mux: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		selection_width => 1
	)
	PORT MAP
	(
		i(0) => data,
		i(1) => ram_data,
		----------------------------
		sel  => ram_data_select_vec,
		----------------------------
		o    => w_data
	);

END behavioral;
