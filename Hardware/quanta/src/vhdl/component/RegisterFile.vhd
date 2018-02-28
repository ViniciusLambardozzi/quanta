--------------------------------------------
-- 32 bit 32 register register file       --
--------------------------------------------
--IN----------------------------------------
-- DATA   : 32 bit input value            --
-- ADDR_A : 5 bit A register selector     --
-- ADDR_B : 5 bit B register selector     --
-- CLK    : 1 bit system clock            --
-- EN     : 32 bit register enable signal --
--------------------------------------------
--OUT---------------------------------------
-- A      : 32 bit output value A         --
-- B      : 32 bit output value B         --
--------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY register_file IS
	PORT
	(
		in_data   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_addr_a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		in_addr_b : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		in_clk    : IN STD_LOGIC;
		in_en     : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		-----------------------------------------------
		out_a      : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_b      : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)	
	);
END register_file;

ARCHITECTURE behavioral OF register_file IS
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
	
	-- Register bank registers
	r00: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(0),
         in_clk,
			s_reg_00
		);

		r01: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(1),
         in_clk,
			s_reg_01
		);
	
		r02: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(2),
         in_clk,
			s_reg_02
		);

		r03: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(3),
         in_clk,
			s_reg_03
		);

		r04: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(4),
         in_clk,
			s_reg_04 
		);

		r05: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(5),
         in_clk,
			s_reg_05
		);

		r06: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(6),
         in_clk,
			s_reg_06
		);

		r07: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(7),
         in_clk,
			s_reg_07
		);

		r08: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(8),
         in_clk,
			s_reg_08
		);

		r09: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(9),
         in_clk,
			s_reg_09
		);

		r10: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(10),
         in_clk,
			s_reg_10
		);

		r11: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(11),
         in_clk,
			s_reg_11
		);

		r12: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(12),
         in_clk,
			s_reg_12
		);

		r13: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(13),
         in_clk,
			s_reg_13
		);

		r14: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(14),
         in_clk,
			s_reg_14
		);

		r15: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(15),
         in_clk,
			s_reg_15
		);

		r16: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(16),
         in_clk,
			s_reg_16
		);

		r17: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(17),
         in_clk,
			s_reg_17
		);

		r18: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(18),
         in_clk,
			s_reg_18
		);

		r19: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(19),
         in_clk,
			s_reg_19
		);

		r20: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(20),
         in_clk,
			s_reg_20
		);

		r21: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(21),
         in_clk,
			s_reg_21
		);

		r22: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(22),
         in_clk,
			s_reg_22
		);

		r23: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(23),
         in_clk,
			s_reg_23
		);

		r24: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(24),
         in_clk,
			s_reg_24
		);

		r25: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(25),
            in_clk,
			s_reg_25
		);

		r26: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(26),
         in_clk,
			s_reg_26
		);

		r27: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(27),
         in_clk,
			s_reg_27
		);

		r28: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(28),
         in_clk,
			s_reg_28
		);

		r29: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(29),
         in_clk,
			s_reg_29
		);

		r30: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(30),
         in_clk,
			s_reg_30
		);
		r31: ENTITY WORK.parallel_register(behavioral)
		PORT MAP
		(
			in_data,
			in_en(31),
         in_clk,
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
			in_sel => in_addr_a,
			out_o => out_a
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
			in_sel => in_addr_b,
			out_o => out_b
		);
END behavioral;