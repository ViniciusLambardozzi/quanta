-------------------------------------
-- CONTROLLER                      --
-------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY controller IS
	PORT
	(
		in_clk                 : IN  STD_LOGIC;
		-----------------------------------------------------------
		-- FETCH                                    
		out_fetch_en           : OUT STD_LOGIC_VECTOR( 1 DOWNTO 0);
		-----------------------------------------------------------
		-- DECODE
		out_decode_en          : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 in_decode_instruction : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		-----------------------------------------------------------
		-- EXECUTE
		out_execute_select : OUT STD_LOGIC;
		out_execute_op     : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0)
		-----------------------------------------------------------
 	);
END controller;

ARCHITECTURE behavioral OF controller IS
	SIGNAL s_state : t_state_type := fetch;
	
BEGIN	
	PROCESS(in_clk)
	BEGIN
		IF(RISING_EDGE(in_clk)) THEN
			out_fetch_en(c_fetch_enable_pc) <= '0';
			out_fetch_en(c_fetch_enable_ram) <= '0';
		
			CASE s_state IS
				WHEN fetch      =>
					out_fetch_en(c_fetch_enable_pc)  <= '1';
					out_fetch_en(c_fetch_enable_ram) <= '1';
				WHEN decode     =>
				WHEN execute    =>
				WHEN mem_access =>
				WHEN write_back =>
			END CASE;
		END IF;
	END PROCESS;
	
	PROCESS(in_decode_instruction)
	BEGIN
		CASE TO_INTEGER(UNSIGNED(in_decode_instruction(31 DOWNTO 24))) IS
			WHEN c_opcode_load_imediate =>
				out_execute_select <= c_execute_alu;
				out_execute_op     <= c_alu_pass;
				 
			WHEN OTHERS =>
				
		END CASE;
	END PROCESS;
	
END behavioral;