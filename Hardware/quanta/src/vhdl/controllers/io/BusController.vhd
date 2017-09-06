----------------------------------------
-- Memory address bus controller      --
-- PORT MAPPING                       --
-- mar      : 32 bit mar input        --
-- data     : 32 bit data input       --
-- io_in    : 32 bit io input         --
-- ram_in   : 32 bit ram input        --
-- clk      : 1 bit clock             --
----------------------------------------
-- addr     : 32 bit address output   --
-- data_out : 32 bit data output      --
-- mdr      : 32 bit mdr output       --
-- ram_clk  : 1 bit ram clock         --
-- io_clk   : 1 bit io clock          --
----------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bus_controller IS
	PORT
	(
		in_mar  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_io   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_ram  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_en   : IN STD_LOGIC;
		-------------------------------------------
		out_addr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_mdr  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_ram_en : OUT STD_LOGIC;
		out_io_en  : OUT STD_LOGIC
	);
END bus_controller;

ARCHITECTURE behavioral OF bus_controller IS
BEGIN
	
	out_addr <= in_mar;
	out_data <= in_data;
	
	PROCESS(in_mar, in_en, in_ram, in_io)
	BEGIN
		IF(in_mar(31) = '1') THEN
			out_io_en <= in_en;
			out_ram_en <= '0';
			
			out_mdr <= in_io;
		ELSE
			out_io_en <= '0';
			out_ram_en <= in_en;
			
			out_mdr <= in_ram;
		END IF;
	END PROCESS;

END behavioral;