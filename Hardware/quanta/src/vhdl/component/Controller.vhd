-----------------------------------
-- PROCESSOR CONTROL UNIT        --
-- PORT MAPPING                  --
-- IR: 32 bit instruction reg    --
-- ST: 32 bit status reg         --
-- CLK: 1 bit system clock       --
-----------------------------------
-- MASK: 32 bit MDR data mask    --
-- CLK: 38 bit clock signal      --
-- FUN: 8 bit function signal    --
-- SEL: 15 bit selection signal  --
-----------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.controller_constants.ALL;

ENTITY controller IS
	PORT
	(
		-- Negated main clock
		in_clk : IN STD_LOGIC;
	
		-- Controller state machine input signals
		in_ir  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_st  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		-- Processor control signals
		out_mask : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_en  : OUT STD_LOGIC_VECTOR(40 DOWNTO 0);
		out_fun  : OUT STD_LOGIC_VECTOR( 9 DOWNTO 0) := STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10));
		out_sel  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) := STD_LOGIC_VECTOR(TO_UNSIGNED(0, 16))
	);
END controller;

ARCHITECTURE behavioral OF controller IS
	-- State machine current stat, starts as fetch 0
 	signal s_state : t_state_type := fetch_0;
BEGIN
	-- Observe the clock signal
	PROCESS(in_clk)
	BEGIN
		-- Trigger a control cycle on every rising edge
		IF(in_clk'EVENT AND in_clk = '1') THEN
			-- Observe state machine
			CASE s_state IS
				-- FETCH CYCLE
					-- MAR <--- PC
					-- PC  <--- PC + 1
					-- MDR, IR <--- RAM[MAR]
					
				-- MAR <--- PC
				-- PC  <--- PC + 1
				WHEN fetch_0 =>
					-- Disable all active components from last controller cycle
					out_en  <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, out_en'LENGTH));
					
					-- Set main data multplexer to value of program counter
					out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "011";
					-- Set the pc multiplexer to output pc incrementer value
					out_sel(c_select_mux_pc_incrementer) <= '1';
					
					-- Save main data to mar
					out_en(c_clock_mar) <= '1';
					-- Save pc incrementer result to pc
					out_en(c_clock_program_counter) <= '1';
					-- Enable ram reading
					out_fun(c_function_ram_we) <= '0';
					
					-- Finish fetch 0
					s_state <= fetch_1;
					
				-- Ram read control signal
				WHEN fetch_1 =>
					-- Disable all active components from last controller cycle
					out_en  <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, out_en'LENGTH));					
					
					-- Enable ram read signal
					out_en(c_clock_ram) <= '1';	
					
					-- Finish fetch 1
					s_state <= fetch_2;
				WHEN fetch_2 =>
					-- Disable all active components from last controller cycle		
					out_en  <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, out_en'LENGTH));
					
					-- Save ram output to mdr
					out_en(c_clock_mdr) <= '1';
					-- Save ram output to ir
					out_en(c_clock_instruction_register) <= '1';
					
					-- Finish fetch cycle
					s_state <= execute_0;
				
				-- Execute last fetched instruction
				WHEN execute_0 =>
					-- Disable all active components from last controller cycle
					out_en  <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, out_en'LENGTH));
					
					-- Observe opcode as positive integer
					CASE TO_INTEGER(UNSIGNED(in_ir(31 DOWNTO 24))) IS
						-- Load imediate
						WHEN c_opcode_loadImediate =>
							-- Set data mask to clear top 16 bits
							out_mask <= x"0000FFFF";
							
							-- Set main multiplexer to data mask output
							out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "100";
							
							-- Load register with data
							out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
							
							-- Finish execution cycle
							s_state <= fetch_0;
							
						-- Load direct
						WHEN c_opcode_loadDirect =>
							-- Set data mask to clear top 16 bits
							out_mask <= x"0000FFFF";
							
							-- Set main multiplexer to data mask output
							out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "100";
							
							-- Load MAR with data
							out_en(c_clock_mar) <= '1';
							
							-- Set ram to read mode
							out_fun(c_function_ram_we) <= '0';	
							
							-- Set state to execute 1 
							s_state <= execute_1;	
							
						-- Store direct
						WHEN c_opcode_storeDirect =>
							-- Store data from source register in register a in the next rising edge
							out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
							out_en(c_clock_register_a) <= '1';
							
							-- Set alu to repeat value from register a
							out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0011";
							
							-- Set main multiplexer to data mask output
							out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "100";
							-- Load address from data mask to MAR
							out_en(c_clock_mar) <= '1';
							
							-- Set ram to write mode
							out_fun(c_function_ram_we) <= '1';							
							
							-- Set state to execute 1 
							s_state <= execute_1;
						
						-- Add
						WHEN c_opcode_addDirect =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Load register b from register bank
								out_sel(c_select_mux_registerbank_b + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_b) <= in_ir(18 DOWNTO 14);
								out_en(c_clock_register_b) <= '1';
								
							-- Set alu opcode to add
								out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0001";
								
							-- Set state to execute 1
								s_state <= execute_1;
						
						-- Move
						WHEN c_opcode_moveDirect =>
							-- Load register a from source
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(18 DOWNTO 14);
								out_en(c_clock_register_a) <= '1';
								
							-- Set alu to pass
								out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0011";
								
							-- Set state to execute 1
								s_state <= execute_1;
						-- Sub
						WHEN c_opcode_subDirect =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Load register b from register bank
								out_sel(c_select_mux_registerbank_b + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_b) <= in_ir(18 DOWNTO 14);
								out_en(c_clock_register_b) <= '1';
								
							-- Set alu opcode to SUB
								out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0010";
							
							-- Set state to execute 1
								s_state <= execute_1;
						
						-- And
						WHEN c_opcode_andDirect =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Load register b from register bank
								out_sel(c_select_mux_registerbank_b + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_b) <= in_ir(18 DOWNTO 14);
								out_en(c_clock_register_b) <= '1';
								
							-- Set alu opcode to AND
								out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0101";
							
							-- Set state to execute 1
								s_state <= execute_1;
								
						-- Or
						WHEN c_opcode_orDirect =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Load register b from register bank
								out_sel(c_select_mux_registerbank_b + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_b) <= in_ir(18 DOWNTO 14);
								out_en(c_clock_register_b) <= '1';
								
							-- Set alu opcode to OR
								out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0110";
							
							-- Set state to execute 1
								s_state <= execute_1;
						
						-- Xor
						WHEN c_opcode_xorDirect =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Load register b from register bank
								out_sel(c_select_mux_registerbank_b + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_b) <= in_ir(18 DOWNTO 14);
								out_en(c_clock_register_b) <= '1';
								
							-- Set alu opcode to XOR
								out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0111";
							
							-- Set state to execute 1
								s_state <= execute_1;
								
						-- Xnor
						WHEN c_opcode_xnorDirect =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Load register b from register bank
								out_sel(c_select_mux_registerbank_b + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_b) <= in_ir(18 DOWNTO 14);
								out_en(c_clock_register_b) <= '1';
								
							-- Set alu opcode to XNOR
								out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "1000";
							
							-- Set state to execute 1
								s_state <= execute_1;

						-- Jump
						WHEN c_opcode_jumpIndirect =>
							-- Load register a from register bank
							out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
							out_en(c_clock_register_a) <= '1';
								
							-- Set alu opcode to pass a
							out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0011";
							
							-- Set state to execute 1
							s_state <= execute_1;

						-- Jump equals
						WHEN c_opcode_jumpEqualsIndirect =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Load register b from register bank
								out_sel(c_select_mux_registerbank_b + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_b) <= in_ir(18 DOWNTO 14);
								out_en(c_clock_register_b) <= '1';
								
							-- Set alu opcode to SUB
								out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0010";
							
							-- Set state to execute 1
								s_state <= execute_1;
								
						-- Jump not equals
						WHEN c_opcode_jumpNotEqualsIndirect =>
							-- Load register a from register bank
							out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
							out_en(c_clock_register_a) <= '1';
							
							-- Load register b from register bank
							out_sel(c_select_mux_registerbank_b + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_b) <= in_ir(18 DOWNTO 14);
							out_en(c_clock_register_b) <= '1';
							
							-- Set alu opcode to SUB
							out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0010";
							
							-- Set state to execute 1
							s_state <= execute_1;
						
						-- Jump lesser then
						WHEN c_opcode_jumpLesserThenIndirect =>
							-- Load register a from register bank
							out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
							out_en(c_clock_register_a) <= '1';
							
							-- Load register b from register bank
							out_sel(c_select_mux_registerbank_b + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_b) <= in_ir(18 DOWNTO 14);
							out_en(c_clock_register_b) <= '1';
							
							-- Set alu opcode to SUB
							out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0010";
							
							-- Set state to execute 1
							s_state <= execute_1;
							
						-- Jump greater then or equals
						WHEN c_opcode_jumpGreaterThenIndirect =>
							-- Load register a from register bank
							out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
							out_en(c_clock_register_a) <= '1';
							
							-- Load register b from register bank
							out_sel(c_select_mux_registerbank_b + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_b) <= in_ir(18 DOWNTO 14);
							out_en(c_clock_register_b) <= '1';
							
							-- Set alu opcode to SUB
							out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0010";
							-- Set state to execute 1
							s_state <= execute_1;
							
						-- LSL
						WHEN c_opcode_shiftLogicalLeft =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Set shifter opcode to LSL
								out_fun(c_function_shifter + c_function_shifter_width - 1 DOWNTO c_function_shifter) <= "001";
							
							-- Set state to execute 1
								s_state <= execute_1;
								
						-- LSR
						WHEN c_opcode_shiftLogicalRight =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Set shifter opcode to LSR
								out_fun(c_function_shifter + c_function_shifter_width - 1 DOWNTO c_function_shifter) <= "010";
							
							-- Set state to execute 1
								s_state <= execute_1;
						
						-- ASL
						WHEN c_opcode_shiftArithmeticLeft =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Set shifter opcode to ASL
								out_fun(c_function_shifter + c_function_shifter_width - 1 DOWNTO c_function_shifter) <= "011";
							
							-- Set state to execute 1
								s_state <= execute_1;
						
						-- ASR
						WHEN c_opcode_shiftArithmeticRight =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Set shifter opcode to ASR
								out_fun(c_function_shifter + c_function_shifter_width - 1 DOWNTO c_function_shifter) <= "100";
							
							-- Set state to execute 1
								s_state <= execute_1;
								
						-- RL
						WHEN c_opcode_shiftRotateLeft =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Set shifter opcode to RL
								out_fun(c_function_shifter + c_function_shifter_width - 1 DOWNTO c_function_shifter) <= "101";
							
							-- Set state to execute 1
								s_state <= execute_1;
								
						-- RR
						WHEN c_opcode_shiftRotateRight =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Set shifter opcode to RR
								out_fun(c_function_shifter + c_function_shifter_width - 1 DOWNTO c_function_shifter) <= "110";
							
							-- Set state to execute 1
								s_state <= execute_1;
								
						-- LOAD INDIRECT
						WHEN c_opcode_loadIndirect =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Load register b from register bank
								out_sel(c_select_mux_registerbank_b + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_b) <= in_ir(18 DOWNTO 14);
								out_en(c_clock_register_b) <= '1';
							
							-- Set state to execute 1
							s_state <= execute_1;	
						
						-- STORE INDIRECT
						WHEN c_opcode_storeIndirect =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Load register b from register bank
								out_sel(c_select_mux_registerbank_b + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_b) <= in_ir(18 DOWNTO 14);
								out_en(c_clock_register_b) <= '1';
							
							-- Set state to execute 1
							s_state <= execute_1;
							
						WHEN c_opcode_jumpAndLink =>
							-- Load register a from register bank
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(23 DOWNTO 19);
								out_en(c_clock_register_a) <= '1';
								
							-- Set alu opcode to pass a
								out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0011";
							
							-- Set the pc multiplexer to output data bus
								out_sel(c_select_mux_pc_incrementer) <= '0';
							
							-- Set main multiplexer output to pc
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "011";
								
							s_state <= execute_1;
						
						-- Invalid opcodes
						WHEN OTHERS =>
							-- Skip invalid instructions and go back to fetch cycle
							s_state <= fetch_0;						
					END CASE;						
					
				WHEN execute_1 =>
					-- Disable all active components from last controller cycle
					out_en  <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, out_en'LENGTH));
					
					-- Observe opcode
					CASE TO_INTEGER(UNSIGNED(in_ir(31 DOWNTO 24))) IS
						
						-- Load direct
						WHEN c_opcode_loadDirect =>
						-- Read ram on next clock rising edge
						out_en(c_clock_ram) <= '1';					
						
						-- Set state to execute 2
						s_state <= execute_2;
						
						-- Store direct
						WHEN c_opcode_storeDirect =>
							-- Set main multiplexer output to alu
							out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";
							
							-- Store value in ram on the next rising edge
							out_en(c_clock_ram) <= '1';
							
							s_state <= fetch_0;
						
						-- Add
						WHEN c_opcode_addDirect =>
							-- Set main multiplexer to alu output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";
							
							-- Load result to destination register
								out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
							
							-- Finish cycle
								s_state <= fetch_0;
								
						-- Move
						WHEN c_opcode_moveDirect =>
							-- Move value from source to destination
							-- Set main multiplexer to alu output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";
							-- Load result to destination register
								out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
							-- Finish cycle
								s_state <= fetch_0;
						
						-- Sub
						WHEN c_opcode_subDirect =>
							-- Set main multiplexer to alu output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";
							-- Set status mux to ALU
								out_sel(c_select_mux_status_alu_shifter DOWNTO c_select_mux_status_alu_shifter) <= "0";
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Load result to destination register
								out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
							-- Finish cycle
								s_state <= fetch_0;
						
						-- And
						WHEN c_opcode_andDirect =>
							-- Set main multiplexer to alu output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";
							-- Load result to destination register
								out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
							-- Set status mux to ALU
								out_sel(c_select_mux_status_alu_shifter DOWNTO c_select_mux_status_alu_shifter) <= "0";
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Finish cycle
								s_state <= fetch_0;
								
						-- Or
						WHEN c_opcode_orDirect =>
							-- Set main multiplexer to alu output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";
							-- Load result to destination register
								out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
							-- Set status mux to ALU
								out_sel(c_select_mux_status_alu_shifter DOWNTO c_select_mux_status_alu_shifter) <= "0";
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Finish cycle
								s_state <= fetch_0;
								
						-- Xor
						WHEN c_opcode_xorDirect =>
							-- Set main multiplexer to alu output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";
							-- Load result to destination register
								out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
							-- Set status mux to ALU
								out_sel(c_select_mux_status_alu_shifter DOWNTO c_select_mux_status_alu_shifter) <= "0";
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Finish cycle
								s_state <= fetch_0;
								
						-- Xnor
						WHEN c_opcode_xnorDirect =>
							-- Set main multiplexer to alu output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";
							-- Load result to destination register
								out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
							-- Set status mux to ALU
								out_sel(c_select_mux_status_alu_shifter DOWNTO c_select_mux_status_alu_shifter) <= "0";
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Finish cycle
								s_state <= fetch_0;
								
						-- Jump
						WHEN c_opcode_jumpIndirect =>
							-- Set main multiplexer to alu output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";
							-- set pc incrementer mux to main mux output
								out_sel(c_select_mux_pc_incrementer) <= '0';
							-- Load PC
								out_en(c_clock_program_counter) <= '1';
							-- Finish cycle
								s_state <= fetch_0;
								
						-- Jump equals
						WHEN c_opcode_jumpEqualsIndirect =>
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Set status to execute 2
								s_state <= execute_2;
						
						-- Jump not equals
						WHEN c_opcode_jumpNotEqualsIndirect =>
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Set status to execute 2
								s_state <= execute_2;
								
						-- Jump lesser then
						WHEN c_opcode_jumpLesserThenIndirect =>
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Set status to execute 2
								s_state <= execute_2;
								
						-- Jump greater then or equals
						WHEN c_opcode_jumpGreaterThenIndirect =>
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Set status to execute 2
								s_state <= execute_2;
							
						-- LSL
						WHEN c_opcode_shiftLogicalLeft =>
							-- Set main multiplexer to shifter output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "000";
							-- Load result to destination register
								out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
							-- Set status mux to shifter
								out_sel(c_select_mux_status_alu_shifter DOWNTO c_select_mux_status_alu_shifter) <= "1";
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Finish cycle
								s_state <= fetch_0;
								
						-- LSR
						WHEN c_opcode_shiftLogicalRight =>
							-- Set main multiplexer to shifter output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "000";
							-- Load result to destination register
								out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
							-- Set status mux to shifter
								out_sel(c_select_mux_status_alu_shifter DOWNTO c_select_mux_status_alu_shifter) <= "1";
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Finish cycle
								s_state <= fetch_0;
						
						-- ASL
						WHEN c_opcode_shiftArithmeticLeft =>
							-- Set main multiplexer to shifter output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "000";
							-- Load result to destination register
								out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
							-- Set status mux to shifter
								out_sel(c_select_mux_status_alu_shifter DOWNTO c_select_mux_status_alu_shifter) <= "1";
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Finish cycle
								s_state <= fetch_0;
						
						-- ASR
						WHEN c_opcode_shiftArithmeticRight =>
							-- Set main multiplexer to shifter output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "000";
							-- Load result to destination register
								out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
							-- Set status mux to shifter
								out_sel(c_select_mux_status_alu_shifter DOWNTO c_select_mux_status_alu_shifter) <= "1";
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Finish cycle
								s_state <= fetch_0;
								
						-- RL
						WHEN c_opcode_shiftRotateLeft =>
							-- Set main multiplexer to shifter output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "000";
							-- Load result to destination register
								out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
							-- Set status mux to shifter
								out_sel(c_select_mux_status_alu_shifter DOWNTO c_select_mux_status_alu_shifter) <= "1";
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Finish cycle
								s_state <= fetch_0;
								
						-- RR
						WHEN c_opcode_shiftRotateRight =>
							-- Set main multiplexer to shifter output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "000";
							-- Load result to destination register
								out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
							-- Set status mux to shifter
								out_sel(c_select_mux_status_alu_shifter DOWNTO c_select_mux_status_alu_shifter) <= "1";
							-- Load status to Status Register
								out_en(c_clock_status_register) <= '1';
							-- Finish cycle
								s_state <= fetch_0;
								
						WHEN c_opcode_loadIndirect =>	
							-- Set alu opcode to PASS B
							out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "1001";
							
							-- Set main multiplexer to alu output
							out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";
							
							-- Load MAR with data
							out_en(c_clock_mar) <= '1';
							
							-- Set ram to read mode
							out_fun(c_function_ram_we) <= '0';	
							
							-- Finish cycle
							s_state <= execute_2;
							
						WHEN c_opcode_storeIndirect =>	
							-- Set alu opcode to PASS B
							out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "1001";
							
							-- Set main multiplexer to alu output
							out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";
							
							-- Load MAR with data
							out_en(c_clock_mar) <= '1';
							
							-- Set ram to write mode
							out_fun(c_function_ram_we) <= '1';	
							
							-- Finish cycle
							s_state <= execute_2;
							
						WHEN c_opcode_jumpAndLink =>
							-- Store PC into jump register
								out_en(c_clock_registerbank + c_register_returnAddress) <= '1';
								
							s_state <= execute_2;
							
						-- VHDL forces code to catch all cases
						-- Invalid cases should never get passed execute 0
						WHEN OTHERS =>
						s_state <= fetch_0;
					END CASE;
					
				WHEN execute_2 =>
					-- Disable all active components from last controller cycle
					out_en  <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, out_en'LENGTH));
					
					-- Observe opcode 
					CASE TO_INTEGER(UNSIGNED(in_ir(31 DOWNTO 24))) IS
						-- Load direct
						WHEN c_opcode_loadDirect =>					
						out_en(c_clock_mdr) <= '1';

						s_state <= execute_3;
						
						-- Jump equals
						WHEN c_opcode_jumpEqualsIndirect =>
							-- If result was 0, do the jump
							IF(in_st(0) = '1') THEN
							-- Load jump address register to register a
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(13 DOWNTO 9);
								out_en(c_clock_register_a) <= '1';
							
							-- Set alu opcode to PASS
								out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0011";
							
							-- Set main multiplexer to alu output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";

							-- Use next state to load jump address to pc
							s_state <= execute_3;
							ELSE						
							-- finish cycle
								s_state <= fetch_0;
							END IF;
						
						-- Jump not equals
						WHEN c_opcode_jumpNotEqualsIndirect =>
							-- If result was not 0, do the jump
							IF(in_st(0) = '0') THEN
							-- Load jump address register to register a
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(13 DOWNTO 9);
								out_en(c_clock_register_a) <= '1';
							
							-- Set alu opcode to PASS
								out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0011";
							
							-- Set main multiplexer to alu output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";

							-- Use next state to load jump address to pc
							s_state <= execute_3;
							ELSE						
							-- finish cycle
								s_state <= fetch_0;
							END IF;
						
						-- Jump lesser then
						WHEN c_opcode_jumpLesserThenIndirect =>
							-- If the signal of the result is negative, do the jump
							IF(in_st(2) = '1') THEN
							-- Load jump address register to register a
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(13 DOWNTO 9);
								out_en(c_clock_register_a) <= '1';
							-- Set alu opcode to PASS
								out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0011";
							-- Set main multiplexer to alu output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";

							-- Use next state to load jump address to pc
							s_state <= execute_3;
							ELSE						
							-- finish cycle
								s_state <= fetch_0;
							END IF;
							
						-- Jump greater then or equals
						WHEN c_opcode_jumpGreaterThenIndirect =>
							-- If the signal of the result was not negative, do the jump
							IF(in_st(2) = '0') THEN
							-- Load jump address register to register a
								out_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a) <= in_ir(13 DOWNTO 9);
								out_en(c_clock_register_a) <= '1';
							-- Set alu opcode to PASS
								out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0011";
							-- Set main multiplexer to alu output
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";

							-- Use next state to load jump address to pc
							s_state <= execute_3;
							ELSE						
							-- finish cycle
								s_state <= fetch_0;
							END IF;
							
						WHEN c_opcode_loadIndirect =>
							-- Read value from ram on the next rising edge
							out_en(c_clock_ram) <= '1';
							
							s_state <= execute_3;
							
						WHEN c_opcode_storeIndirect =>
							-- Set alu opcode to PASS A
							out_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu) <= "0011";
							
							-- Store value in ram on the next rising edge
							out_en(c_clock_ram) <= '1';
							s_state <= fetch_0;
							
						WHEN c_opcode_jumpAndLink =>
							-- Set main multiplexer output to alu
								out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "001";
							
							-- store register A into pc
							out_en(c_clock_program_counter) <= '1';
							
							s_state <= fetch_0;
							
						WHEN OTHERS =>
						s_state <= fetch_0;
					END CASE;	
					
				WHEN execute_3 =>

					out_en  <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, out_en'LENGTH));
					
					CASE TO_INTEGER(UNSIGNED(in_ir(31 DOWNTO 24))) IS
						-- Load direct
						WHEN c_opcode_loadDirect =>
						-- Set main multiplexer to mdr output
						out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "010";
						
						-- Load destination register from MDR
						out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
					
						s_state <= fetch_0;
						
						-- Jump equals
						WHEN c_opcode_jumpEqualsIndirect =>
								-- set pc incrementer mux to main mux output
								out_sel(c_select_mux_pc_incrementer) <= '0';
								out_en(c_clock_program_counter) <= '1';
								
								-- finish cycle
								s_state <= fetch_0;
								
						-- Jump not equals
						WHEN c_opcode_jumpNotEqualsIndirect =>
								-- set pc incrementer mux to main mux output
								out_sel(c_select_mux_pc_incrementer) <= '0';
								out_en(c_clock_program_counter) <= '1';
								
								-- finish cycle
								s_state <= fetch_0;
								
						-- Jump lesser then
						WHEN c_opcode_jumpLesserThenIndirect =>
								-- set pc incrementer mux to main mux output
								out_sel(c_select_mux_pc_incrementer) <= '0';
								out_en(c_clock_program_counter) <= '1';
								
								-- finish cycle
								s_state <= fetch_0;
						
						-- Jump greater then or equals
						WHEN c_opcode_jumpGreaterThenIndirect =>
								-- set pc incrementer mux to main mux output
								out_sel(c_select_mux_pc_incrementer) <= '0';
								out_en(c_clock_program_counter) <= '1';
								
								-- finish cycle
								s_state <= fetch_0;
								
							WHEN c_opcode_loadIndirect =>
								out_en(c_clock_mdr) <= '1';
								s_state <= execute_4;
								
						WHEN OTHERS =>
						s_state <= fetch_0;
					END CASE;					
					
				WHEN execute_4 =>
					out_en  <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, out_en'LENGTH));
					
					CASE TO_INTEGER(UNSIGNED(in_ir(31 DOWNTO 24))) IS
					
					WHEN c_opcode_loadIndirect =>
						-- Set main multiplexer to mdr output
						out_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main) <= "010";
						
						-- Load destination register from MDR
						out_en(c_clock_registerbank + TO_INTEGER(UNSIGNED(in_ir(23 DOWNTO 19)))) <= '1';
					
						s_state <= fetch_0;
					
					WHEN OTHERS =>
						s_state <= fetch_0;
					END CASE;
					
			END CASE;
		END IF;
	END PROCESS;
END behavioral;