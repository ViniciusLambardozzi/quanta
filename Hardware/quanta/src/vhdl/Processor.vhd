-----------------------------------
-- PROCESSOR                     --
-- Test bench for now            --
-----------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE WORK.controller_constants.ALL;

ENTITY processor IS
	PORT
	(
		-- Main processor clock
		system_clock : IN STD_LOGIC;
		
		-- Debug outputs
		--ir : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		--mar : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		--mdr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		pc : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		r0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		--r1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		--r2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		--r3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		--r4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		--signal_alu : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		--ra : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		--rb : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		--status : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		buttons  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		switches : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		hex      : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END processor;

ARCHITECTURE behavioral OF processor IS
	-- Control signals from the controller
	SIGNAL s_controller_mask : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_controller_en   : STD_LOGIC_VECTOR(40 DOWNTO 0);
	SIGNAL s_controller_fun  : STD_LOGIC_VECTOR( 9 DOWNTO 0);
	SIGNAL s_controller_sel  : STD_LOGIC_VECTOR(15 DOWNTO 0);

	-- Program counter input/output signals
	SIGNAL s_pc_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_pc_input  : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Program counter incrementer unity data output
	SIGNAL s_pc_incrementer_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Memory addres register data output
	SIGNAL s_mar_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
	-- Ram data output
	SIGNAL s_ram_output : STD_LOGIC_VECTOR(31 DOWNTO 0); 
	-- Instruction register data output
	SIGNAL s_ir_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	SIGNAL s_ram_enable : STD_LOGIC;
	SIGNAL s_io_enable : STD_LOGIC;
	
	-- Main bus data
	SIGNAL s_bus_data : STD_LOGIC_VECTOR(31 DOWNTO 0);
	-- Main bus address
	SIGNAL s_bus_addr : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- IO data output
	SIGNAL s_io_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Hex display output
	SIGNAL s_hex_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Memory destination register data input
	SIGNAL s_mdr_input : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Memory destination register data output
	SIGNAL s_mdr_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Value masked by the controler data mask
	SIGNAL s_mask_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Main data multiplexer
	SIGNAL s_main_mux_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Register bank output for register a
	SIGNAL s_register_bank_output_a : STD_LOGIC_VECTOR(31 DOWNTO 0);
	-- Register bank output for register b
	SIGNAL s_register_bank_output_b : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Alu register a output
	SIGNAL s_register_a_output : STD_LOGIC_VECTOR(31 DOWNTO 0);	
	-- Alu register b output
	SIGNAL s_register_b_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Bit shifter data output
	SIGNAL s_shifter_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
	-- Bit shifter status flag output
	SIGNAL s_shifter_status_output : STD_LOGIC_VECTOR(31 DOWNTO 0) := STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32));
	
	-- Alu register data output
	SIGNAL s_alu_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
	-- Alu status flag output
	SIGNAL s_alu_status_output : STD_LOGIC_VECTOR(31 DOWNTO 0) := STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32));
	
	-- Status multiplexer data output (selects status from alu or bit shifter)
	SIGNAL s_mux_status_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
	-- Status register output
	SIGNAL s_status_register_output : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Register bank register signals
	SIGNAL s_reg_00 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_01 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_02 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_03 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_04 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_05 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_06 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_07 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_08 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_09 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_10 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_11 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_12 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_13 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_14 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_15 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_16 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_17 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_18 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_19 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_20 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_21 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_22 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_23 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_24 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_25 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_26 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_27 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_28 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_29 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_30 : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_reg_31 : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
	-- Debug output hooks
	--ir(31 DOWNTO 0) <= s_ir_output(31 DOWNTO 0);
	--mar(31 DOWNTO 0) <= s_mar_output(31 DOWNTO 0);
	--mdr(31 DOWNTO 0) <= s_mdr_output(31 DOWNTO 0);
	pc(31 DOWNTO 0) <= s_pc_output(31 DOWNTO 0);
	r0(31 DOWNTO 0) <= s_reg_31(31 DOWNTO 0);
	--r1(31 DOWNTO 0) <= s_reg_01(31 DOWNTO 0);
	--r2(31 DOWNTO 0) <= s_reg_02(31 DOWNTO 0);
	--r3(31 DOWNTO 0) <= s_reg_03(31 DOWNTO 0);
	--r4(31 DOWNTO 0) <= s_reg_04(31 DOWNTO 0);
	--signal_alu(31 DOWNTO 0) <= s_alu_output(31 DOWNTO 0);
	--ra(31 DOWNTO 0) <= s_register_a_output(31 DOWNTO 0);
	--rb(31 DOWNTO 0) <= s_register_b_output(31 DOWNTO 0);
	--status(31 DOWNTO 0) <= s_status_register_output;
	
	
	hex(31 DOWNTO 0) <= s_hex_output;

	-- Main data multiplexer driven by control selection signal
	main_mux: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 3
	)
	PORT MAP
	(
		in_i(0) => s_shifter_output,
		in_i(1) => s_alu_output,
		in_i(2) => s_mdr_output,
		in_i(3) => s_pc_output,
		in_i(4) => s_mask_output,
		in_sel(2 DOWNTO 0) => s_controller_sel(c_select_mux_main + c_select_mux_main_width - 1 DOWNTO c_select_mux_main),
		out_o => s_main_mux_output
	);

	-- Controller unity receives ir, status and negated clock for double speed
	controller: ENTITY WORK.controller(behavioral)
	PORT MAP
	(
		in_ir => s_ir_output,
		in_st => s_status_register_output,
		in_clk => NOT(system_clock),
		out_mask => s_controller_mask,
		out_en => s_controller_en,
		out_fun => s_controller_fun,
		out_sel => s_controller_sel
	);
	
	-- Program counter register
	program_counter: ENTITY WORK.parallel_register(behavioral)
	PORT MAP
	(
		s_pc_input,
		s_controller_en(c_clock_program_counter),
      system_clock,
		s_pc_output
	);
	
	-- Program counter incrementer
	pc_incrementer: ENTITY WORK.adder(behavioral)
	PORT MAP
	(
		s_pc_output,
        STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
        '1',
		s_pc_incrementer_output,
		OPEN
	);
	
	-- Program counter data selection multiplexer
	pc_incrementer_mux: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 1
	)
	PORT MAP
	(
		in_i(0) => s_main_mux_output,
		in_i(1) => s_pc_incrementer_output,
		in_sel => s_controller_sel(c_select_mux_pc_incrementer DOWNTO c_select_mux_pc_incrementer),
		out_o => s_pc_input
	);
	
	-- Memory address register
	memory_address_register: ENTITY WORK.parallel_register(behavioral)
	PORT MAP
	(
		s_main_mux_output,
		s_controller_en(c_clock_mar),
      system_clock,
		s_mar_output
	);
	
	-- Memory destination register
	memory_destination_register: ENTITY WORK.parallel_register(behavioral)
	PORT MAP
	(
	s_mdr_input,
		s_controller_en(c_clock_mdr),
		system_clock,
		s_mdr_output
	);
	
	-- Instruction register
	instruction_register: ENTITY WORK.parallel_register(behavioral)
	PORT MAP
	(
		s_ram_output,
		s_controller_en(c_clock_instruction_register),
      system_clock,
		s_ir_output
	);
	
	-- IO/Memory bus controller
	io_memory_bus: ENTITY WORK.bus_controller(behavioral)
	PORT MAP
	(
		s_mar_output,
		s_main_mux_output,
		s_io_output,
		s_ram_output,
		s_controller_en(c_clock_ram),
		s_bus_addr,
		s_bus_data,
		s_mdr_input,
		s_ram_enable,
		s_io_enable
	);
	
	-- IO controller	
	io_data_controller: ENTITY WORK.io_controller(behavioral)
	PORT MAP
	(
		s_bus_data,
		s_bus_addr,
		s_controller_fun(c_function_ram_we),
		s_io_enable,
		system_clock,
		buttons,
		switches,
		s_io_output,
		s_hex_output
	);
	
	-- Ram block
	ram: ENTITY WORK.ram(behavioral)
	GENERIC MAP
	(
		g_addr_width => 10
	)
	PORT MAP
	(
		s_bus_data,
		s_bus_addr(9 DOWNTO 0),
		s_controller_fun(c_function_ram_we),
		s_ram_enable,
		system_clock,
		s_ram_output	
	);
	
	
	
	-- Alu register a
	register_a: ENTITY WORK.parallel_register(behavioral)
	PORT MAP
	(
		s_register_bank_output_a,
		s_controller_en(c_clock_register_a),
      system_clock,
		s_register_a_output		
	);
	
	-- Alu register b
	register_b: ENTITY WORK.parallel_register(behavioral)
	PORT MAP
	(
		s_register_bank_output_b,
		s_controller_en(c_clock_register_b),
      system_clock,
		s_register_b_output
	);
	
	-- Bit shifter
	shifter: ENTITY WORK.shifter(behavioral)
	PORT MAP
	(
		s_register_a_output,
		s_controller_fun(c_function_shifter + c_function_shifter_width - 1 DOWNTO c_function_shifter),
		s_shifter_output,
		s_shifter_status_output(3 DOWNTO 0)
	);
	
	-- Alu
	alu: ENTITY WORK.alu(behavioral)
	PORT MAP
	(
		s_register_a_output,
		s_register_b_output,
		s_controller_fun(c_function_alu_cin),
		s_controller_fun(c_function_alu + c_function_alu_width - 1 DOWNTO c_function_alu),
		s_alu_output,
		s_alu_status_output(3 DOWNTO 0)	
	);
	
	-- Status selector multiplexer driven by control selection signal
	status_mux: ENTITY WORK.mux(behavioral)
	GENERIC MAP
	(
		g_selection_width => 1
	)
	PORT MAP 
	(
		in_i(0) => s_alu_status_output,
		in_i(1) => s_shifter_status_output,
		in_sel => s_controller_sel(c_select_mux_status_alu_shifter DOWNTO c_select_mux_status_alu_shifter),
		out_o => s_mux_status_output
	);
	
	-- Status register
	status_register: ENTITY WORK.parallel_register
	PORT MAP
	(
		s_mux_status_output,
		s_controller_en(c_clock_status_register),
      system_clock,
		s_status_register_output
	);
	
	-- Register bank registers
	r00: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(0),
         system_clock,
			s_reg_00
		);
		
		r01: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(1),
         system_clock,
			s_reg_01
		);
		
		r02: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(2),
         system_clock,
			s_reg_02
		);
		
		r03: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(3),
         system_clock,
			s_reg_03
		);
		
		r04: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(4),
         system_clock,
			s_reg_04 
		);
		
		r05: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(5),
         system_clock,
			s_reg_05
		);
		
		r06: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(6),
         system_clock,
			s_reg_06
		);
		
		r07: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(7),
         system_clock,
			s_reg_07
		);
		
		r08: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(8),
         system_clock,
			s_reg_08
		);
		
		r09: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(9),
         system_clock,
			s_reg_09
		);
		
		r10: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(10),
         system_clock,
			s_reg_10
		);
		
		r11: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(11),
         system_clock,
			s_reg_11
		);
		
		r12: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(12),
         system_clock,
			s_reg_12
		);
		
		r13: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(13),
         system_clock,
			s_reg_13
		);
		
		r14: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(14),
         system_clock,
			s_reg_14
		);
		
		r15: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(15),
         system_clock,
			s_reg_15
		);
		
		r16: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(16),
         system_clock,
			s_reg_16
		);
		
		r17: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(17),
         system_clock,
			s_reg_17
		);
		
		r18: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(18),
         system_clock,
			s_reg_18
		);
		
		r19: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(19),
         system_clock,
			s_reg_19
		);
		
		r20: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(20),
         system_clock,
			s_reg_20
		);
		
		r21: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(21),
         system_clock,
			s_reg_21
		);
		
		r22: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(22),
         system_clock,
			s_reg_22
		);
		
		r23: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(23),
         system_clock,
			s_reg_23
		);
		
		r24: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(24),
         system_clock,
			s_reg_24
		);
		
		r25: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(25),
            system_clock,
			s_reg_25
		);
		
		r26: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(26),
         system_clock,
			s_reg_26
		);
		
		r27: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(27),
         system_clock,
			s_reg_27
		);
		
		r28: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(28),
         system_clock,
			s_reg_28
		);
		
		r29: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(29),
         system_clock,
			s_reg_29
		);
		
		r30: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(30),
         system_clock,
			s_reg_30
		);
		
		r31: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			s_main_mux_output,
			s_controller_en(31),
         system_clock,
			s_reg_31
		);
		
		-- Register bank data output a multiplexer driven by selection signal
		m1: ENTITY WORK.mux(behavioral)
		GENERIC MAP
		(
			g_selection_width => 5
		)
		PORT MAP
		(
			in_i(0) => s_reg_00,
			in_i(1) => s_reg_01,
			in_i(2) => s_reg_02,
			in_i(3) => s_reg_03,
			in_i(4) => s_reg_04,
			in_i(5) => s_reg_05,
			in_i(6) => s_reg_06,
			in_i(7) => s_reg_07,
			in_i(8) => s_reg_08,
			in_i(9) => s_reg_09,
			in_i(10) => s_reg_10,
			in_i(11) => s_reg_11,
			in_i(12) => s_reg_12,
			in_i(13) => s_reg_13,
			in_i(14) => s_reg_14,
			in_i(15) => s_reg_15,
			in_i(16) => s_reg_16,
			in_i(17) => s_reg_17,
			in_i(18) => s_reg_18,
			in_i(19) => s_reg_19,
			in_i(20) => s_reg_20,
			in_i(21) => s_reg_21,
			in_i(22) => s_reg_22,
			in_i(23) => s_reg_23,
			in_i(24) => s_reg_24,
			in_i(25) => s_reg_25,
			in_i(26) => s_reg_26,
			in_i(27) => s_reg_27,
			in_i(28) => s_reg_28,
			in_i(29) => s_reg_29,
			in_i(30) => s_reg_30,
			in_i(31) => s_reg_31,
			in_sel => s_controller_sel(c_select_mux_registerbank_a + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_a),
			out_o => s_register_bank_output_a
		);
		
		-- Register bank data output b multiplexer driven by selection signal
		m2: ENTITY WORK.mux(behavioral)
		GENERIC MAP
		(
			g_selection_width => 5
		)
		PORT MAP
		(
			in_i(0) => s_reg_00,
			in_i(1) => s_reg_01,
			in_i(2) => s_reg_02,
			in_i(3) => s_reg_03,
			in_i(4) => s_reg_04,
			in_i(5) => s_reg_05,
			in_i(6) => s_reg_06,
			in_i(7) => s_reg_07,
			in_i(8) => s_reg_08,
			in_i(9) => s_reg_09,
			in_i(10) => s_reg_10,
			in_i(11) => s_reg_11,
			in_i(12) => s_reg_12,
			in_i(13) => s_reg_13,
			in_i(14) => s_reg_14,
			in_i(15) => s_reg_15,
			in_i(16) => s_reg_16,
			in_i(17) => s_reg_17,
			in_i(18) => s_reg_18,
			in_i(19) => s_reg_19,
			in_i(20) => s_reg_20,
			in_i(21) => s_reg_21,
			in_i(22) => s_reg_22,
			in_i(23) => s_reg_23,
			in_i(24) => s_reg_24,
			in_i(25) => s_reg_25,
			in_i(26) => s_reg_26,
			in_i(27) => s_reg_27,
			in_i(28) => s_reg_28,
			in_i(29) => s_reg_29,
			in_i(30) => s_reg_30,
			in_i(31) => s_reg_31,
			in_sel => s_controller_sel(c_select_mux_registerbank_b + c_select_mux_registerbank_width - 1 DOWNTO c_select_mux_registerbank_b),
			out_o => s_register_bank_output_b
		);
	
	-- Data masking
	s_mask_output <= s_controller_mask AND s_mdr_output;

END behavioral;