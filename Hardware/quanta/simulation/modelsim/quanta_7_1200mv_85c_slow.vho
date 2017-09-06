-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.0.0 Build 200 06/17/2014 SJ Web Edition"

-- DATE "04/05/2017 09:12:47"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	quanta IS
    PORT (
	out_clock : OUT std_logic;
	sys_clock : IN std_logic;
	data : OUT std_logic_vector(3 DOWNTO 0)
	);
END quanta;

-- Design Ports Information
-- out_clock	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[3]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[2]	=>  Location: PIN_AC21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[1]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[0]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sys_clock	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF quanta IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_out_clock : std_logic;
SIGNAL ww_sys_clock : std_logic;
SIGNAL ww_data : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \sys_clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \out_clock~output_o\ : std_logic;
SIGNAL \data[3]~output_o\ : std_logic;
SIGNAL \data[2]~output_o\ : std_logic;
SIGNAL \data[1]~output_o\ : std_logic;
SIGNAL \data[0]~output_o\ : std_logic;
SIGNAL \sys_clock~input_o\ : std_logic;
SIGNAL \sys_clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst|memory_destination_register|s_memory[3]~feeder_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[0]~2_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[1]~3_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[2]~4_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[8]~0_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[3]~1_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[4]~5_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[5]~6_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[8]~7_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[8]~8_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[6]~9_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[7]~10_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[8]~11_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[15]~12_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[9]~13_combout\ : std_logic;
SIGNAL \inst|controller|out_mask[13]~2_q\ : std_logic;
SIGNAL \inst|controller|Selector3~0_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[21]~0_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[22]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[23]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[25]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[30]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[29]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[32]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[31]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[34]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[33]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[36]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[38]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[37]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a8\ : std_logic;
SIGNAL \inst|ram|s_memory~59_combout\ : std_logic;
SIGNAL \inst|controller|s_state~8_combout\ : std_logic;
SIGNAL \inst|controller|s_state.execute_2~q\ : std_logic;
SIGNAL \inst|controller|Selector1~0_combout\ : std_logic;
SIGNAL \inst|ram|out_data[3]~0_combout\ : std_logic;
SIGNAL \inst|controller|Selector41~0_combout\ : std_logic;
SIGNAL \inst|controller|Selector42~0_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux31~0_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux23~0_combout\ : std_logic;
SIGNAL \inst|memory_address_register|s_memory[8]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[35]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~58_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux24~0_combout\ : std_logic;
SIGNAL \inst|memory_address_register|s_memory[7]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \inst|ram|s_memory~57_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux25~0_combout\ : std_logic;
SIGNAL \inst|memory_address_register|s_memory[6]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \inst|ram|s_memory~56_combout\ : std_logic;
SIGNAL \inst|memory_destination_register|s_memory[5]~feeder_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux26~0_combout\ : std_logic;
SIGNAL \inst|memory_address_register|s_memory[5]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \inst|ram|s_memory~55_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux27~0_combout\ : std_logic;
SIGNAL \inst|memory_address_register|s_memory[4]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[26]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~51_combout\ : std_logic;
SIGNAL \inst|memory_destination_register|s_memory[2]~feeder_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux29~0_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[24]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~52_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux30~0_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \inst|ram|s_memory~53_combout\ : std_logic;
SIGNAL \inst|memory_destination_register|s_memory[0]~feeder_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux31~2_combout\ : std_logic;
SIGNAL \inst|memory_destination_register|s_memory[24]~feeder_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[10]~42_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[11]~41_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[15]~14_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[12]~40_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[13]~39_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[14]~38_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[15]~15_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[15]~37_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[16]~36_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[17]~35_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[22]~16_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[18]~34_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[19]~33_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[20]~32_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[22]~17_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[21]~31_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[22]~30_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[23]~29_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[29]~18_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[24]~28_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux10~0_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux7~0_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[71]~1_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[72]~feeder_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[25]~25_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[26]~26_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux5~0_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[76]~feeder_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[29]~19_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[27]~27_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[28]~20_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[29]~21_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[30]~22_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[30]~23_combout\ : std_logic;
SIGNAL \inst|program_counter|s_memory[31]~24_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux0~0_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a30\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[82]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~63_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux1~0_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a29\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[80]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~62_combout\ : std_logic;
SIGNAL \inst|memory_destination_register|s_memory[29]~feeder_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux2~0_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a28\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[78]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~61_combout\ : std_logic;
SIGNAL \inst|memory_destination_register|s_memory[28]~feeder_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux3~0_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a27\ : std_logic;
SIGNAL \inst|ram|s_memory~67_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux4~0_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a25\ : std_logic;
SIGNAL \inst|ram|s_memory~65_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux6~0_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a24\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[70]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~68_combout\ : std_logic;
SIGNAL \inst|instruction_register|s_memory[24]~feeder_combout\ : std_logic;
SIGNAL \inst|controller|out_fun~0_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~54_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a31\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[84]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~64_combout\ : std_logic;
SIGNAL \inst|instruction_register|s_memory[31]~feeder_combout\ : std_logic;
SIGNAL \inst|instruction_register|s_memory[30]~feeder_combout\ : std_logic;
SIGNAL \inst|instruction_register|s_memory[29]~feeder_combout\ : std_logic;
SIGNAL \inst|controller|Mux0~0_combout\ : std_logic;
SIGNAL \inst|instruction_register|s_memory[25]~feeder_combout\ : std_logic;
SIGNAL \inst|controller|Mux0~1_combout\ : std_logic;
SIGNAL \inst|controller|Mux0~2_combout\ : std_logic;
SIGNAL \inst|controller|out_mask[13]~1_q\ : std_logic;
SIGNAL \inst|main_mux|Mux31~1_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[40]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[39]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9~portbdataout\ : std_logic;
SIGNAL \inst|ram|s_memory~60_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux22~0_combout\ : std_logic;
SIGNAL \inst|memory_address_register|s_memory[9]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[19]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[18]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[20]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~48_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[5]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[6]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~44_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[16]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[15]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~46_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[10]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[9]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~45_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[2]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[1]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[3]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~43_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~47_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~49_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[74]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[73]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a26\ : std_logic;
SIGNAL \inst|ram|s_memory~66_combout\ : std_logic;
SIGNAL \inst|controller|Mux47~0_combout\ : std_logic;
SIGNAL \inst|controller|Selector43~0_combout\ : std_logic;
SIGNAL \inst|controller|Selector43~1_combout\ : std_logic;
SIGNAL \inst|controller|s_state.fetch_0~q\ : std_logic;
SIGNAL \inst|controller|out_en[34]~0_combout\ : std_logic;
SIGNAL \inst|controller|Selector3~1_combout\ : std_logic;
SIGNAL \inst|controller|s_state.execute_1~q\ : std_logic;
SIGNAL \inst|controller|Selector2~0_combout\ : std_logic;
SIGNAL \inst|main_mux|Mux28~0_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[27]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \inst|ram|s_memory_rtl_0_bypass[28]~feeder_combout\ : std_logic;
SIGNAL \inst|ram|s_memory~50_combout\ : std_logic;
SIGNAL \inst|instruction_register|s_memory[3]~feeder_combout\ : std_logic;
SIGNAL \inst|instruction_register|s_memory[2]~feeder_combout\ : std_logic;
SIGNAL \inst|instruction_register|s_memory[0]~feeder_combout\ : std_logic;
SIGNAL \inst|memory_address_register|s_memory\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst|controller|out_sel\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst|memory_destination_register|s_memory\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst|instruction_register|s_memory\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst|ram|out_data\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst|program_counter|s_memory\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst|ram|s_memory_rtl_0_bypass\ : std_logic_vector(0 TO 84);
SIGNAL \inst|controller|out_fun\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst|controller|out_en\ : std_logic_vector(40 DOWNTO 0);
SIGNAL \ALT_INV_sys_clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst|controller|ALT_INV_out_en\ : std_logic_vector(37 DOWNTO 37);

BEGIN

out_clock <= ww_out_clock;
ww_sys_clock <= sys_clock;
data <= ww_data;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (\inst|main_mux|Mux23~0_combout\ & \inst|main_mux|Mux24~0_combout\ & \inst|main_mux|Mux25~0_combout\ & \inst|main_mux|Mux26~0_combout\ & \inst|main_mux|Mux27~0_combout\ & 
\inst|main_mux|Mux28~0_combout\ & \inst|main_mux|Mux29~0_combout\ & \inst|main_mux|Mux30~0_combout\ & \inst|main_mux|Mux31~2_combout\);

\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\inst|memory_address_register|s_memory\(9) & \inst|memory_address_register|s_memory\(8) & \inst|memory_address_register|s_memory\(7) & 
\inst|memory_address_register|s_memory\(6) & \inst|memory_address_register|s_memory\(5) & \inst|memory_address_register|s_memory\(4) & \inst|memory_address_register|s_memory\(3) & \inst|memory_address_register|s_memory\(2) & 
\inst|memory_address_register|s_memory\(1) & \inst|memory_address_register|s_memory\(0));

\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\inst|main_mux|Mux22~0_combout\ & \inst|main_mux|Mux23~0_combout\ & \inst|main_mux|Mux24~0_combout\ & \inst|main_mux|Mux25~0_combout\ & \inst|main_mux|Mux26~0_combout\ & 
\inst|main_mux|Mux27~0_combout\ & \inst|main_mux|Mux28~0_combout\ & \inst|main_mux|Mux29~0_combout\ & \inst|main_mux|Mux30~0_combout\ & \inst|main_mux|Mux31~2_combout\);

\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a1\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a2\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a3\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a4\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a5\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a6\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a7\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a8\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(8);

\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\ <= (\inst|main_mux|Mux0~0_combout\ & \inst|main_mux|Mux1~0_combout\ & \inst|main_mux|Mux2~0_combout\ & \inst|main_mux|Mux3~0_combout\ & \inst|main_mux|Mux4~0_combout\ & 
\inst|main_mux|Mux5~0_combout\ & \inst|main_mux|Mux6~0_combout\ & \inst|main_mux|Mux7~0_combout\ & \inst|main_mux|Mux22~0_combout\);

\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\inst|memory_address_register|s_memory\(9) & \inst|memory_address_register|s_memory\(8) & \inst|memory_address_register|s_memory\(7) & 
\inst|memory_address_register|s_memory\(6) & \inst|memory_address_register|s_memory\(5) & \inst|memory_address_register|s_memory\(4) & \inst|memory_address_register|s_memory\(3) & \inst|memory_address_register|s_memory\(2) & 
\inst|memory_address_register|s_memory\(1) & \inst|memory_address_register|s_memory\(0));

\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\ <= (\inst|main_mux|Mux22~0_combout\ & \inst|main_mux|Mux23~0_combout\ & \inst|main_mux|Mux24~0_combout\ & \inst|main_mux|Mux25~0_combout\ & \inst|main_mux|Mux26~0_combout\ & 
\inst|main_mux|Mux27~0_combout\ & \inst|main_mux|Mux28~0_combout\ & \inst|main_mux|Mux29~0_combout\ & \inst|main_mux|Mux30~0_combout\ & \inst|main_mux|Mux31~2_combout\);

\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9~portbdataout\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(0);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a24\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(1);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a25\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(2);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a26\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(3);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a27\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(4);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a28\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(5);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a29\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(6);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a30\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(7);
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a31\ <= \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(8);

\sys_clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \sys_clock~input_o\);
\ALT_INV_sys_clock~inputclkctrl_outclk\ <= NOT \sys_clock~inputclkctrl_outclk\;
\inst|controller|ALT_INV_out_en\(37) <= NOT \inst|controller|out_en\(37);

-- Location: IOOBUF_X105_Y0_N16
\out_clock~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sys_clock~input_o\,
	devoe => ww_devoe,
	o => \out_clock~output_o\);

-- Location: IOOBUF_X102_Y0_N16
\data[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|instruction_register|s_memory\(3),
	devoe => ww_devoe,
	o => \data[3]~output_o\);

-- Location: IOOBUF_X102_Y0_N23
\data[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|instruction_register|s_memory\(2),
	devoe => ww_devoe,
	o => \data[2]~output_o\);

-- Location: IOOBUF_X109_Y0_N9
\data[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|instruction_register|s_memory\(1),
	devoe => ww_devoe,
	o => \data[1]~output_o\);

-- Location: IOOBUF_X107_Y0_N2
\data[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|instruction_register|s_memory\(0),
	devoe => ww_devoe,
	o => \data[0]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\sys_clock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sys_clock,
	o => \sys_clock~input_o\);

-- Location: CLKCTRL_G4
\sys_clock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \sys_clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \sys_clock~inputclkctrl_outclk\);

-- Location: LCCOMB_X55_Y15_N24
\inst|memory_destination_register|s_memory[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|memory_destination_register|s_memory[3]~feeder_combout\ = \inst|ram|out_data\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(3),
	combout => \inst|memory_destination_register|s_memory[3]~feeder_combout\);

-- Location: LCCOMB_X53_Y15_N26
\inst|program_counter|s_memory[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[0]~2_combout\ = \inst|program_counter|s_memory\(0) $ (\inst|controller|out_en\(34))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|program_counter|s_memory\(0),
	datad => \inst|controller|out_en\(34),
	combout => \inst|program_counter|s_memory[0]~2_combout\);

-- Location: FF_X53_Y15_N27
\inst|program_counter|s_memory[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(0));

-- Location: LCCOMB_X53_Y15_N20
\inst|program_counter|s_memory[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[1]~3_combout\ = \inst|program_counter|s_memory\(1) $ (((\inst|program_counter|s_memory\(0) & \inst|controller|out_en\(34))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(0),
	datac => \inst|program_counter|s_memory\(1),
	datad => \inst|controller|out_en\(34),
	combout => \inst|program_counter|s_memory[1]~3_combout\);

-- Location: FF_X53_Y15_N21
\inst|program_counter|s_memory[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[1]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(1));

-- Location: LCCOMB_X53_Y15_N18
\inst|program_counter|s_memory[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[2]~4_combout\ = \inst|program_counter|s_memory\(2) $ (((\inst|program_counter|s_memory\(0) & (\inst|program_counter|s_memory\(1) & \inst|controller|out_en\(34)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(0),
	datab => \inst|program_counter|s_memory\(1),
	datac => \inst|program_counter|s_memory\(2),
	datad => \inst|controller|out_en\(34),
	combout => \inst|program_counter|s_memory[2]~4_combout\);

-- Location: FF_X53_Y15_N19
\inst|program_counter|s_memory[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(2));

-- Location: LCCOMB_X53_Y15_N12
\inst|program_counter|s_memory[8]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[8]~0_combout\ = (\inst|controller|out_en\(34) & (\inst|program_counter|s_memory\(2) & (\inst|program_counter|s_memory\(0) & \inst|program_counter|s_memory\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|out_en\(34),
	datab => \inst|program_counter|s_memory\(2),
	datac => \inst|program_counter|s_memory\(0),
	datad => \inst|program_counter|s_memory\(1),
	combout => \inst|program_counter|s_memory[8]~0_combout\);

-- Location: LCCOMB_X53_Y15_N28
\inst|program_counter|s_memory[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[3]~1_combout\ = \inst|program_counter|s_memory\(3) $ (\inst|program_counter|s_memory[8]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|program_counter|s_memory\(3),
	datad => \inst|program_counter|s_memory[8]~0_combout\,
	combout => \inst|program_counter|s_memory[3]~1_combout\);

-- Location: FF_X53_Y15_N29
\inst|program_counter|s_memory[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(3));

-- Location: LCCOMB_X53_Y15_N0
\inst|program_counter|s_memory[4]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[4]~5_combout\ = \inst|program_counter|s_memory\(4) $ (((\inst|program_counter|s_memory\(3) & \inst|program_counter|s_memory[8]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|program_counter|s_memory\(3),
	datac => \inst|program_counter|s_memory\(4),
	datad => \inst|program_counter|s_memory[8]~0_combout\,
	combout => \inst|program_counter|s_memory[4]~5_combout\);

-- Location: FF_X53_Y15_N1
\inst|program_counter|s_memory[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[4]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(4));

-- Location: LCCOMB_X53_Y15_N14
\inst|program_counter|s_memory[5]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[5]~6_combout\ = \inst|program_counter|s_memory\(5) $ (((\inst|program_counter|s_memory[8]~0_combout\ & (\inst|program_counter|s_memory\(3) & \inst|program_counter|s_memory\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory[8]~0_combout\,
	datab => \inst|program_counter|s_memory\(3),
	datac => \inst|program_counter|s_memory\(5),
	datad => \inst|program_counter|s_memory\(4),
	combout => \inst|program_counter|s_memory[5]~6_combout\);

-- Location: FF_X53_Y15_N15
\inst|program_counter|s_memory[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(5));

-- Location: LCCOMB_X53_Y15_N2
\inst|program_counter|s_memory[8]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[8]~7_combout\ = (\inst|program_counter|s_memory\(0) & (\inst|program_counter|s_memory\(2) & (\inst|program_counter|s_memory\(5) & \inst|program_counter|s_memory\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(0),
	datab => \inst|program_counter|s_memory\(2),
	datac => \inst|program_counter|s_memory\(5),
	datad => \inst|program_counter|s_memory\(1),
	combout => \inst|program_counter|s_memory[8]~7_combout\);

-- Location: LCCOMB_X53_Y16_N16
\inst|program_counter|s_memory[8]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[8]~8_combout\ = (\inst|program_counter|s_memory\(3) & (\inst|program_counter|s_memory\(4) & (\inst|controller|out_en\(34) & \inst|program_counter|s_memory[8]~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(3),
	datab => \inst|program_counter|s_memory\(4),
	datac => \inst|controller|out_en\(34),
	datad => \inst|program_counter|s_memory[8]~7_combout\,
	combout => \inst|program_counter|s_memory[8]~8_combout\);

-- Location: LCCOMB_X53_Y17_N30
\inst|program_counter|s_memory[6]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[6]~9_combout\ = \inst|program_counter|s_memory\(6) $ (\inst|program_counter|s_memory[8]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|program_counter|s_memory\(6),
	datad => \inst|program_counter|s_memory[8]~8_combout\,
	combout => \inst|program_counter|s_memory[6]~9_combout\);

-- Location: FF_X53_Y17_N31
\inst|program_counter|s_memory[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[6]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(6));

-- Location: LCCOMB_X53_Y17_N26
\inst|program_counter|s_memory[7]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[7]~10_combout\ = \inst|program_counter|s_memory\(7) $ (((\inst|program_counter|s_memory[8]~8_combout\ & \inst|program_counter|s_memory\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory[8]~8_combout\,
	datac => \inst|program_counter|s_memory\(7),
	datad => \inst|program_counter|s_memory\(6),
	combout => \inst|program_counter|s_memory[7]~10_combout\);

-- Location: FF_X53_Y17_N27
\inst|program_counter|s_memory[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[7]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(7));

-- Location: LCCOMB_X53_Y17_N10
\inst|program_counter|s_memory[8]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[8]~11_combout\ = \inst|program_counter|s_memory\(8) $ (((\inst|program_counter|s_memory\(7) & (\inst|program_counter|s_memory\(6) & \inst|program_counter|s_memory[8]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(7),
	datab => \inst|program_counter|s_memory\(6),
	datac => \inst|program_counter|s_memory\(8),
	datad => \inst|program_counter|s_memory[8]~8_combout\,
	combout => \inst|program_counter|s_memory[8]~11_combout\);

-- Location: FF_X53_Y17_N11
\inst|program_counter|s_memory[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[8]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(8));

-- Location: LCCOMB_X53_Y16_N10
\inst|program_counter|s_memory[15]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[15]~12_combout\ = (\inst|program_counter|s_memory\(6) & (\inst|program_counter|s_memory\(7) & (\inst|program_counter|s_memory\(8) & \inst|program_counter|s_memory[8]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(6),
	datab => \inst|program_counter|s_memory\(7),
	datac => \inst|program_counter|s_memory\(8),
	datad => \inst|program_counter|s_memory[8]~8_combout\,
	combout => \inst|program_counter|s_memory[15]~12_combout\);

-- Location: LCCOMB_X54_Y16_N28
\inst|program_counter|s_memory[9]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[9]~13_combout\ = \inst|program_counter|s_memory\(9) $ (\inst|program_counter|s_memory[15]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|program_counter|s_memory\(9),
	datad => \inst|program_counter|s_memory[15]~12_combout\,
	combout => \inst|program_counter|s_memory[9]~13_combout\);

-- Location: FF_X54_Y16_N29
\inst|program_counter|s_memory[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[9]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(9));

-- Location: FF_X55_Y17_N23
\inst|controller|out_mask[13]~2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_sys_clock~inputclkctrl_outclk\,
	asdata => \inst|controller|out_en\(35),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|controller|out_mask[13]~2_q\);

-- Location: LCCOMB_X55_Y17_N0
\inst|controller|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|Selector3~0_combout\ = ((\inst|controller|Mux47~0_combout\ & \inst|controller|out_en\(35))) # (!\inst|controller|s_state.fetch_0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|Mux47~0_combout\,
	datac => \inst|controller|out_en\(35),
	datad => \inst|controller|s_state.fetch_0~q\,
	combout => \inst|controller|Selector3~0_combout\);

-- Location: FF_X55_Y17_N1
\inst|controller|out_en[37]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_sys_clock~inputclkctrl_outclk\,
	d => \inst|controller|Selector3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|controller|out_en\(37));

-- Location: LCCOMB_X53_Y15_N10
\inst|ram|s_memory_rtl_0_bypass[21]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[21]~0_combout\ = !\inst|main_mux|Mux31~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|main_mux|Mux31~2_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[21]~0_combout\);

-- Location: FF_X53_Y15_N11
\inst|ram|s_memory_rtl_0_bypass[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[21]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(21));

-- Location: LCCOMB_X54_Y15_N22
\inst|ram|s_memory_rtl_0_bypass[22]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[22]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[22]~feeder_combout\);

-- Location: FF_X54_Y15_N23
\inst|ram|s_memory_rtl_0_bypass[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[22]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(22));

-- Location: LCCOMB_X53_Y15_N16
\inst|ram|s_memory_rtl_0_bypass[23]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[23]~feeder_combout\ = \inst|main_mux|Mux30~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|main_mux|Mux30~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[23]~feeder_combout\);

-- Location: FF_X53_Y15_N17
\inst|ram|s_memory_rtl_0_bypass[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[23]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(23));

-- Location: LCCOMB_X52_Y15_N22
\inst|ram|s_memory_rtl_0_bypass[25]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[25]~feeder_combout\ = \inst|main_mux|Mux29~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|main_mux|Mux29~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[25]~feeder_combout\);

-- Location: FF_X52_Y15_N23
\inst|ram|s_memory_rtl_0_bypass[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[25]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(25));

-- Location: FF_X52_Y15_N5
\inst|memory_address_register|s_memory[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|main_mux|Mux28~0_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_address_register|s_memory\(3));

-- Location: LCCOMB_X50_Y17_N28
\inst|ram|s_memory_rtl_0_bypass[30]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[30]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[30]~feeder_combout\);

-- Location: FF_X50_Y17_N29
\inst|ram|s_memory_rtl_0_bypass[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[30]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(30));

-- Location: LCCOMB_X50_Y17_N30
\inst|ram|s_memory_rtl_0_bypass[29]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[29]~feeder_combout\ = \inst|main_mux|Mux27~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|main_mux|Mux27~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[29]~feeder_combout\);

-- Location: FF_X50_Y17_N31
\inst|ram|s_memory_rtl_0_bypass[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[29]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(29));

-- Location: LCCOMB_X52_Y17_N10
\inst|ram|s_memory_rtl_0_bypass[32]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[32]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[32]~feeder_combout\);

-- Location: FF_X52_Y17_N11
\inst|ram|s_memory_rtl_0_bypass[32]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[32]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(32));

-- Location: LCCOMB_X53_Y17_N12
\inst|ram|s_memory_rtl_0_bypass[31]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[31]~feeder_combout\ = \inst|main_mux|Mux26~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|main_mux|Mux26~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[31]~feeder_combout\);

-- Location: FF_X53_Y17_N13
\inst|ram|s_memory_rtl_0_bypass[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[31]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(31));

-- Location: LCCOMB_X52_Y17_N6
\inst|ram|s_memory_rtl_0_bypass[34]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[34]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[34]~feeder_combout\);

-- Location: FF_X52_Y17_N7
\inst|ram|s_memory_rtl_0_bypass[34]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[34]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(34));

-- Location: LCCOMB_X52_Y17_N8
\inst|ram|s_memory_rtl_0_bypass[33]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[33]~feeder_combout\ = \inst|main_mux|Mux25~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|main_mux|Mux25~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[33]~feeder_combout\);

-- Location: FF_X52_Y17_N9
\inst|ram|s_memory_rtl_0_bypass[33]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[33]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(33));

-- Location: LCCOMB_X53_Y17_N2
\inst|ram|s_memory_rtl_0_bypass[36]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[36]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[36]~feeder_combout\);

-- Location: FF_X53_Y17_N3
\inst|ram|s_memory_rtl_0_bypass[36]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[36]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(36));

-- Location: LCCOMB_X52_Y17_N28
\inst|ram|s_memory_rtl_0_bypass[38]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[38]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[38]~feeder_combout\);

-- Location: FF_X52_Y17_N29
\inst|ram|s_memory_rtl_0_bypass[38]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[38]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(38));

-- Location: LCCOMB_X52_Y17_N14
\inst|ram|s_memory_rtl_0_bypass[37]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[37]~feeder_combout\ = \inst|main_mux|Mux23~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|main_mux|Mux23~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[37]~feeder_combout\);

-- Location: FF_X52_Y17_N15
\inst|ram|s_memory_rtl_0_bypass[37]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[37]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(37));

-- Location: M9K_X51_Y15_N0
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0401",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "quanta.mif",
	init_file_layout => "port_a",
	logical_ram_name => "processor:inst|ram:ram|altsyncram:s_memory_rtl_0|altsyncram_pmk1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 9,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 10,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 9,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 1023,
	port_b_logical_ram_depth => 1024,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \inst|ram|s_memory~54_combout\,
	portbre => VCC,
	portbaddrstall => \inst|controller|ALT_INV_out_en\(37),
	clk0 => \sys_clock~inputclkctrl_outclk\,
	portadatain => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X52_Y17_N2
\inst|ram|s_memory~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~59_combout\ = (\inst|ram|s_memory_rtl_0_bypass\(38) & ((\inst|ram|s_memory~49_combout\ & (\inst|ram|s_memory_rtl_0_bypass\(37))) # (!\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a8\))))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(38) & (((\inst|ram|s_memory_rtl_0_bypass\(37)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0_bypass\(38),
	datab => \inst|ram|s_memory~49_combout\,
	datac => \inst|ram|s_memory_rtl_0_bypass\(37),
	datad => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a8\,
	combout => \inst|ram|s_memory~59_combout\);

-- Location: LCCOMB_X55_Y17_N28
\inst|controller|s_state~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|s_state~8_combout\ = (\inst|controller|s_state.execute_1~q\ & (!\inst|instruction_register|s_memory\(24) & \inst|controller|Mux47~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|s_state.execute_1~q\,
	datac => \inst|instruction_register|s_memory\(24),
	datad => \inst|controller|Mux47~0_combout\,
	combout => \inst|controller|s_state~8_combout\);

-- Location: FF_X55_Y17_N29
\inst|controller|s_state.execute_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_sys_clock~inputclkctrl_outclk\,
	d => \inst|controller|s_state~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|controller|s_state.execute_2~q\);

-- Location: LCCOMB_X55_Y17_N2
\inst|controller|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|Selector1~0_combout\ = (\inst|controller|s_state.execute_1~q\ & (\inst|controller|Mux47~0_combout\)) # (!\inst|controller|s_state.execute_1~q\ & (((!\inst|controller|s_state.execute_2~q\ & \inst|controller|out_en\(34)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|Mux47~0_combout\,
	datab => \inst|controller|s_state.execute_2~q\,
	datac => \inst|controller|out_en\(34),
	datad => \inst|controller|s_state.execute_1~q\,
	combout => \inst|controller|Selector1~0_combout\);

-- Location: FF_X55_Y17_N3
\inst|controller|out_en[39]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_sys_clock~inputclkctrl_outclk\,
	d => \inst|controller|Selector1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|controller|out_en\(39));

-- Location: LCCOMB_X55_Y17_N10
\inst|ram|out_data[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|out_data[3]~0_combout\ = (!\inst|controller|out_fun\(0) & \inst|controller|out_en\(39))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|controller|out_fun\(0),
	datad => \inst|controller|out_en\(39),
	combout => \inst|ram|out_data[3]~0_combout\);

-- Location: FF_X52_Y17_N3
\inst|ram|out_data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~59_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(8));

-- Location: FF_X53_Y17_N17
\inst|memory_destination_register|s_memory[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(8),
	sload => VCC,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(8));

-- Location: LCCOMB_X55_Y17_N8
\inst|controller|Selector41~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|Selector41~0_combout\ = ((\inst|controller|Mux47~0_combout\ & (\inst|controller|s_state.execute_2~q\ & !\inst|instruction_register|s_memory\(24)))) # (!\inst|controller|s_state.fetch_0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|Mux47~0_combout\,
	datab => \inst|controller|s_state.execute_2~q\,
	datac => \inst|instruction_register|s_memory\(24),
	datad => \inst|controller|s_state.fetch_0~q\,
	combout => \inst|controller|Selector41~0_combout\);

-- Location: FF_X55_Y17_N9
\inst|controller|out_sel[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_sys_clock~inputclkctrl_outclk\,
	d => \inst|controller|Selector41~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|controller|out_sel\(10));

-- Location: LCCOMB_X55_Y17_N16
\inst|controller|Selector42~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|Selector42~0_combout\ = ((\inst|controller|Mux47~0_combout\ & (\inst|instruction_register|s_memory\(24) & \inst|controller|s_state.execute_1~q\))) # (!\inst|controller|s_state.fetch_0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|Mux47~0_combout\,
	datab => \inst|controller|s_state.fetch_0~q\,
	datac => \inst|instruction_register|s_memory\(24),
	datad => \inst|controller|s_state.execute_1~q\,
	combout => \inst|controller|Selector42~0_combout\);

-- Location: FF_X55_Y17_N17
\inst|controller|out_sel[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_sys_clock~inputclkctrl_outclk\,
	d => \inst|controller|Selector42~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|controller|out_sel\(9));

-- Location: LCCOMB_X55_Y17_N20
\inst|main_mux|Mux31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux31~0_combout\ = (\inst|controller|out_mask[13]~2_q\ & ((\inst|controller|out_mask[13]~1_q\ & (!\inst|controller|out_sel\(10) & !\inst|controller|out_sel\(9))) # (!\inst|controller|out_mask[13]~1_q\ & (\inst|controller|out_sel\(10))))) # 
-- (!\inst|controller|out_mask[13]~2_q\ & (((\inst|controller|out_sel\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|out_mask[13]~2_q\,
	datab => \inst|controller|out_mask[13]~1_q\,
	datac => \inst|controller|out_sel\(10),
	datad => \inst|controller|out_sel\(9),
	combout => \inst|main_mux|Mux31~0_combout\);

-- Location: LCCOMB_X53_Y17_N16
\inst|main_mux|Mux23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux23~0_combout\ = (\inst|main_mux|Mux31~0_combout\ & ((\inst|main_mux|Mux31~1_combout\ & (\inst|program_counter|s_memory\(8))) # (!\inst|main_mux|Mux31~1_combout\ & ((\inst|memory_destination_register|s_memory\(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(8),
	datab => \inst|main_mux|Mux31~1_combout\,
	datac => \inst|memory_destination_register|s_memory\(8),
	datad => \inst|main_mux|Mux31~0_combout\,
	combout => \inst|main_mux|Mux23~0_combout\);

-- Location: LCCOMB_X50_Y15_N28
\inst|memory_address_register|s_memory[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|memory_address_register|s_memory[8]~feeder_combout\ = \inst|main_mux|Mux23~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|main_mux|Mux23~0_combout\,
	combout => \inst|memory_address_register|s_memory[8]~feeder_combout\);

-- Location: FF_X50_Y15_N29
\inst|memory_address_register|s_memory[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|memory_address_register|s_memory[8]~feeder_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_address_register|s_memory\(8));

-- Location: LCCOMB_X52_Y17_N4
\inst|ram|s_memory_rtl_0_bypass[35]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[35]~feeder_combout\ = \inst|main_mux|Mux24~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|main_mux|Mux24~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[35]~feeder_combout\);

-- Location: FF_X52_Y17_N5
\inst|ram|s_memory_rtl_0_bypass[35]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[35]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(35));

-- Location: LCCOMB_X52_Y17_N24
\inst|ram|s_memory~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~58_combout\ = (\inst|ram|s_memory_rtl_0_bypass\(36) & ((\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0_bypass\(35)))) # (!\inst|ram|s_memory~49_combout\ & (\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a7\)))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(36) & (((\inst|ram|s_memory_rtl_0_bypass\(35)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0_bypass\(36),
	datab => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a7\,
	datac => \inst|ram|s_memory_rtl_0_bypass\(35),
	datad => \inst|ram|s_memory~49_combout\,
	combout => \inst|ram|s_memory~58_combout\);

-- Location: FF_X52_Y17_N25
\inst|ram|out_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~58_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(7));

-- Location: FF_X53_Y17_N5
\inst|memory_destination_register|s_memory[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(7),
	sload => VCC,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(7));

-- Location: LCCOMB_X53_Y17_N4
\inst|main_mux|Mux24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux24~0_combout\ = (\inst|main_mux|Mux31~0_combout\ & ((\inst|main_mux|Mux31~1_combout\ & (\inst|program_counter|s_memory\(7))) # (!\inst|main_mux|Mux31~1_combout\ & ((\inst|memory_destination_register|s_memory\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(7),
	datab => \inst|main_mux|Mux31~1_combout\,
	datac => \inst|memory_destination_register|s_memory\(7),
	datad => \inst|main_mux|Mux31~0_combout\,
	combout => \inst|main_mux|Mux24~0_combout\);

-- Location: LCCOMB_X52_Y15_N30
\inst|memory_address_register|s_memory[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|memory_address_register|s_memory[7]~feeder_combout\ = \inst|main_mux|Mux24~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|main_mux|Mux24~0_combout\,
	combout => \inst|memory_address_register|s_memory[7]~feeder_combout\);

-- Location: FF_X52_Y15_N31
\inst|memory_address_register|s_memory[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|memory_address_register|s_memory[7]~feeder_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_address_register|s_memory\(7));

-- Location: LCCOMB_X52_Y17_N26
\inst|ram|s_memory~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~57_combout\ = (\inst|ram|s_memory_rtl_0_bypass\(34) & ((\inst|ram|s_memory~49_combout\ & (\inst|ram|s_memory_rtl_0_bypass\(33))) # (!\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a6\))))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(34) & (((\inst|ram|s_memory_rtl_0_bypass\(33)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0_bypass\(34),
	datab => \inst|ram|s_memory~49_combout\,
	datac => \inst|ram|s_memory_rtl_0_bypass\(33),
	datad => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a6\,
	combout => \inst|ram|s_memory~57_combout\);

-- Location: FF_X52_Y17_N27
\inst|ram|out_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~57_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(6));

-- Location: FF_X53_Y17_N21
\inst|memory_destination_register|s_memory[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(6),
	sload => VCC,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(6));

-- Location: LCCOMB_X53_Y17_N20
\inst|main_mux|Mux25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux25~0_combout\ = (\inst|main_mux|Mux31~0_combout\ & ((\inst|main_mux|Mux31~1_combout\ & (\inst|program_counter|s_memory\(6))) # (!\inst|main_mux|Mux31~1_combout\ & ((\inst|memory_destination_register|s_memory\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(6),
	datab => \inst|main_mux|Mux31~1_combout\,
	datac => \inst|memory_destination_register|s_memory\(6),
	datad => \inst|main_mux|Mux31~0_combout\,
	combout => \inst|main_mux|Mux25~0_combout\);

-- Location: LCCOMB_X52_Y15_N16
\inst|memory_address_register|s_memory[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|memory_address_register|s_memory[6]~feeder_combout\ = \inst|main_mux|Mux25~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|main_mux|Mux25~0_combout\,
	combout => \inst|memory_address_register|s_memory[6]~feeder_combout\);

-- Location: FF_X52_Y15_N17
\inst|memory_address_register|s_memory[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|memory_address_register|s_memory[6]~feeder_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_address_register|s_memory\(6));

-- Location: LCCOMB_X52_Y17_N20
\inst|ram|s_memory~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~56_combout\ = (\inst|ram|s_memory_rtl_0_bypass\(32) & ((\inst|ram|s_memory~49_combout\ & (\inst|ram|s_memory_rtl_0_bypass\(31))) # (!\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a5\))))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(32) & (\inst|ram|s_memory_rtl_0_bypass\(31)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0_bypass\(32),
	datab => \inst|ram|s_memory_rtl_0_bypass\(31),
	datac => \inst|ram|s_memory~49_combout\,
	datad => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a5\,
	combout => \inst|ram|s_memory~56_combout\);

-- Location: FF_X52_Y17_N21
\inst|ram|out_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~56_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(5));

-- Location: LCCOMB_X53_Y17_N24
\inst|memory_destination_register|s_memory[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|memory_destination_register|s_memory[5]~feeder_combout\ = \inst|ram|out_data\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(5),
	combout => \inst|memory_destination_register|s_memory[5]~feeder_combout\);

-- Location: FF_X53_Y17_N25
\inst|memory_destination_register|s_memory[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|memory_destination_register|s_memory[5]~feeder_combout\,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(5));

-- Location: LCCOMB_X54_Y17_N30
\inst|main_mux|Mux26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux26~0_combout\ = (\inst|main_mux|Mux31~0_combout\ & ((\inst|main_mux|Mux31~1_combout\ & (\inst|program_counter|s_memory\(5))) # (!\inst|main_mux|Mux31~1_combout\ & ((\inst|memory_destination_register|s_memory\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(5),
	datab => \inst|memory_destination_register|s_memory\(5),
	datac => \inst|main_mux|Mux31~1_combout\,
	datad => \inst|main_mux|Mux31~0_combout\,
	combout => \inst|main_mux|Mux26~0_combout\);

-- Location: LCCOMB_X50_Y15_N26
\inst|memory_address_register|s_memory[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|memory_address_register|s_memory[5]~feeder_combout\ = \inst|main_mux|Mux26~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|main_mux|Mux26~0_combout\,
	combout => \inst|memory_address_register|s_memory[5]~feeder_combout\);

-- Location: FF_X50_Y15_N27
\inst|memory_address_register|s_memory[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|memory_address_register|s_memory[5]~feeder_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_address_register|s_memory\(5));

-- Location: LCCOMB_X50_Y17_N16
\inst|ram|s_memory~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~55_combout\ = (\inst|ram|s_memory~49_combout\ & (((\inst|ram|s_memory_rtl_0_bypass\(29))))) # (!\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0_bypass\(30) & ((\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a4\))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(30) & (\inst|ram|s_memory_rtl_0_bypass\(29)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory~49_combout\,
	datab => \inst|ram|s_memory_rtl_0_bypass\(30),
	datac => \inst|ram|s_memory_rtl_0_bypass\(29),
	datad => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a4\,
	combout => \inst|ram|s_memory~55_combout\);

-- Location: FF_X50_Y17_N17
\inst|ram|out_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~55_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(4));

-- Location: FF_X54_Y17_N21
\inst|memory_destination_register|s_memory[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(4),
	sload => VCC,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(4));

-- Location: LCCOMB_X54_Y17_N20
\inst|main_mux|Mux27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux27~0_combout\ = (\inst|main_mux|Mux31~0_combout\ & ((\inst|main_mux|Mux31~1_combout\ & (\inst|program_counter|s_memory\(4))) # (!\inst|main_mux|Mux31~1_combout\ & ((\inst|memory_destination_register|s_memory\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(4),
	datab => \inst|main_mux|Mux31~1_combout\,
	datac => \inst|memory_destination_register|s_memory\(4),
	datad => \inst|main_mux|Mux31~0_combout\,
	combout => \inst|main_mux|Mux27~0_combout\);

-- Location: LCCOMB_X50_Y15_N0
\inst|memory_address_register|s_memory[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|memory_address_register|s_memory[4]~feeder_combout\ = \inst|main_mux|Mux27~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|main_mux|Mux27~0_combout\,
	combout => \inst|memory_address_register|s_memory[4]~feeder_combout\);

-- Location: FF_X50_Y15_N1
\inst|memory_address_register|s_memory[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|memory_address_register|s_memory[4]~feeder_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_address_register|s_memory\(4));

-- Location: LCCOMB_X54_Y15_N10
\inst|ram|s_memory_rtl_0_bypass[26]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[26]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[26]~feeder_combout\);

-- Location: FF_X54_Y15_N11
\inst|ram|s_memory_rtl_0_bypass[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[26]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(26));

-- Location: LCCOMB_X54_Y15_N18
\inst|ram|s_memory~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~51_combout\ = (\inst|ram|s_memory~49_combout\ & (\inst|ram|s_memory_rtl_0_bypass\(25))) # (!\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0_bypass\(26) & ((\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a2\))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(26) & (\inst|ram|s_memory_rtl_0_bypass\(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0_bypass\(25),
	datab => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a2\,
	datac => \inst|ram|s_memory~49_combout\,
	datad => \inst|ram|s_memory_rtl_0_bypass\(26),
	combout => \inst|ram|s_memory~51_combout\);

-- Location: FF_X54_Y15_N19
\inst|ram|out_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~51_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(2));

-- Location: LCCOMB_X55_Y15_N18
\inst|memory_destination_register|s_memory[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|memory_destination_register|s_memory[2]~feeder_combout\ = \inst|ram|out_data\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(2),
	combout => \inst|memory_destination_register|s_memory[2]~feeder_combout\);

-- Location: FF_X55_Y15_N19
\inst|memory_destination_register|s_memory[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|memory_destination_register|s_memory[2]~feeder_combout\,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(2));

-- Location: LCCOMB_X52_Y15_N18
\inst|main_mux|Mux29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux29~0_combout\ = (\inst|main_mux|Mux31~0_combout\ & ((\inst|main_mux|Mux31~1_combout\ & ((\inst|program_counter|s_memory\(2)))) # (!\inst|main_mux|Mux31~1_combout\ & (\inst|memory_destination_register|s_memory\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|memory_destination_register|s_memory\(2),
	datab => \inst|main_mux|Mux31~1_combout\,
	datac => \inst|program_counter|s_memory\(2),
	datad => \inst|main_mux|Mux31~0_combout\,
	combout => \inst|main_mux|Mux29~0_combout\);

-- Location: FF_X52_Y15_N19
\inst|memory_address_register|s_memory[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|main_mux|Mux29~0_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_address_register|s_memory\(2));

-- Location: LCCOMB_X54_Y15_N12
\inst|ram|s_memory_rtl_0_bypass[24]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[24]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[24]~feeder_combout\);

-- Location: FF_X54_Y15_N13
\inst|ram|s_memory_rtl_0_bypass[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[24]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(24));

-- Location: LCCOMB_X54_Y15_N4
\inst|ram|s_memory~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~52_combout\ = (\inst|ram|s_memory~49_combout\ & (\inst|ram|s_memory_rtl_0_bypass\(23))) # (!\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0_bypass\(24) & ((\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a1\))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(24) & (\inst|ram|s_memory_rtl_0_bypass\(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0_bypass\(23),
	datab => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a1\,
	datac => \inst|ram|s_memory~49_combout\,
	datad => \inst|ram|s_memory_rtl_0_bypass\(24),
	combout => \inst|ram|s_memory~52_combout\);

-- Location: FF_X54_Y15_N5
\inst|ram|out_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~52_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(1));

-- Location: FF_X55_Y15_N13
\inst|memory_destination_register|s_memory[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(1),
	sload => VCC,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(1));

-- Location: LCCOMB_X53_Y15_N8
\inst|main_mux|Mux30~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux30~0_combout\ = (\inst|main_mux|Mux31~0_combout\ & ((\inst|main_mux|Mux31~1_combout\ & ((\inst|program_counter|s_memory\(1)))) # (!\inst|main_mux|Mux31~1_combout\ & (\inst|memory_destination_register|s_memory\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|memory_destination_register|s_memory\(1),
	datab => \inst|program_counter|s_memory\(1),
	datac => \inst|main_mux|Mux31~0_combout\,
	datad => \inst|main_mux|Mux31~1_combout\,
	combout => \inst|main_mux|Mux30~0_combout\);

-- Location: FF_X53_Y15_N9
\inst|memory_address_register|s_memory[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|main_mux|Mux30~0_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_address_register|s_memory\(1));

-- Location: LCCOMB_X54_Y15_N14
\inst|ram|s_memory~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~53_combout\ = (\inst|ram|s_memory~49_combout\ & (!\inst|ram|s_memory_rtl_0_bypass\(21))) # (!\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0_bypass\(22) & 
-- ((\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0~portbdataout\))) # (!\inst|ram|s_memory_rtl_0_bypass\(22) & (!\inst|ram|s_memory_rtl_0_bypass\(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory~49_combout\,
	datab => \inst|ram|s_memory_rtl_0_bypass\(21),
	datac => \inst|ram|s_memory_rtl_0_bypass\(22),
	datad => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	combout => \inst|ram|s_memory~53_combout\);

-- Location: FF_X54_Y15_N15
\inst|ram|out_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~53_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(0));

-- Location: LCCOMB_X55_Y15_N10
\inst|memory_destination_register|s_memory[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|memory_destination_register|s_memory[0]~feeder_combout\ = \inst|ram|out_data\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(0),
	combout => \inst|memory_destination_register|s_memory[0]~feeder_combout\);

-- Location: FF_X55_Y15_N11
\inst|memory_destination_register|s_memory[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|memory_destination_register|s_memory[0]~feeder_combout\,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(0));

-- Location: LCCOMB_X53_Y15_N22
\inst|main_mux|Mux31~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux31~2_combout\ = (\inst|main_mux|Mux31~0_combout\ & ((\inst|main_mux|Mux31~1_combout\ & (\inst|program_counter|s_memory\(0))) # (!\inst|main_mux|Mux31~1_combout\ & ((\inst|memory_destination_register|s_memory\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(0),
	datab => \inst|memory_destination_register|s_memory\(0),
	datac => \inst|main_mux|Mux31~0_combout\,
	datad => \inst|main_mux|Mux31~1_combout\,
	combout => \inst|main_mux|Mux31~2_combout\);

-- Location: FF_X53_Y15_N23
\inst|memory_address_register|s_memory[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|main_mux|Mux31~2_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_address_register|s_memory\(0));

-- Location: LCCOMB_X52_Y16_N26
\inst|memory_destination_register|s_memory[24]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|memory_destination_register|s_memory[24]~feeder_combout\ = \inst|ram|out_data\(24)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(24),
	combout => \inst|memory_destination_register|s_memory[24]~feeder_combout\);

-- Location: FF_X52_Y16_N27
\inst|memory_destination_register|s_memory[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|memory_destination_register|s_memory[24]~feeder_combout\,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(24));

-- Location: LCCOMB_X54_Y16_N0
\inst|program_counter|s_memory[10]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[10]~42_combout\ = \inst|program_counter|s_memory\(10) $ (((\inst|program_counter|s_memory\(9) & \inst|program_counter|s_memory[15]~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|program_counter|s_memory\(9),
	datac => \inst|program_counter|s_memory\(10),
	datad => \inst|program_counter|s_memory[15]~12_combout\,
	combout => \inst|program_counter|s_memory[10]~42_combout\);

-- Location: FF_X54_Y16_N1
\inst|program_counter|s_memory[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[10]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(10));

-- Location: LCCOMB_X54_Y16_N14
\inst|program_counter|s_memory[11]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[11]~41_combout\ = \inst|program_counter|s_memory\(11) $ (((\inst|program_counter|s_memory[15]~12_combout\ & (\inst|program_counter|s_memory\(9) & \inst|program_counter|s_memory\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory[15]~12_combout\,
	datab => \inst|program_counter|s_memory\(9),
	datac => \inst|program_counter|s_memory\(11),
	datad => \inst|program_counter|s_memory\(10),
	combout => \inst|program_counter|s_memory[11]~41_combout\);

-- Location: FF_X54_Y16_N15
\inst|program_counter|s_memory[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[11]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(11));

-- Location: LCCOMB_X53_Y16_N6
\inst|program_counter|s_memory[15]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[15]~14_combout\ = (\inst|program_counter|s_memory\(11) & (\inst|program_counter|s_memory\(9) & (\inst|program_counter|s_memory\(10) & \inst|program_counter|s_memory[15]~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(11),
	datab => \inst|program_counter|s_memory\(9),
	datac => \inst|program_counter|s_memory\(10),
	datad => \inst|program_counter|s_memory[15]~12_combout\,
	combout => \inst|program_counter|s_memory[15]~14_combout\);

-- Location: LCCOMB_X54_Y16_N20
\inst|program_counter|s_memory[12]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[12]~40_combout\ = \inst|program_counter|s_memory[15]~14_combout\ $ (\inst|program_counter|s_memory\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|program_counter|s_memory[15]~14_combout\,
	datac => \inst|program_counter|s_memory\(12),
	combout => \inst|program_counter|s_memory[12]~40_combout\);

-- Location: FF_X54_Y16_N21
\inst|program_counter|s_memory[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[12]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(12));

-- Location: LCCOMB_X54_Y16_N6
\inst|program_counter|s_memory[13]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[13]~39_combout\ = \inst|program_counter|s_memory\(13) $ (((\inst|program_counter|s_memory[15]~14_combout\ & \inst|program_counter|s_memory\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|program_counter|s_memory[15]~14_combout\,
	datac => \inst|program_counter|s_memory\(13),
	datad => \inst|program_counter|s_memory\(12),
	combout => \inst|program_counter|s_memory[13]~39_combout\);

-- Location: FF_X54_Y16_N7
\inst|program_counter|s_memory[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[13]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(13));

-- Location: LCCOMB_X54_Y16_N8
\inst|program_counter|s_memory[14]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[14]~38_combout\ = \inst|program_counter|s_memory\(14) $ (((\inst|program_counter|s_memory\(13) & (\inst|program_counter|s_memory[15]~14_combout\ & \inst|program_counter|s_memory\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(13),
	datab => \inst|program_counter|s_memory[15]~14_combout\,
	datac => \inst|program_counter|s_memory\(14),
	datad => \inst|program_counter|s_memory\(12),
	combout => \inst|program_counter|s_memory[14]~38_combout\);

-- Location: FF_X54_Y16_N9
\inst|program_counter|s_memory[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[14]~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(14));

-- Location: LCCOMB_X53_Y16_N24
\inst|program_counter|s_memory[15]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[15]~15_combout\ = (\inst|program_counter|s_memory\(13) & (\inst|program_counter|s_memory\(14) & (\inst|program_counter|s_memory\(12) & \inst|program_counter|s_memory[15]~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(13),
	datab => \inst|program_counter|s_memory\(14),
	datac => \inst|program_counter|s_memory\(12),
	datad => \inst|program_counter|s_memory[15]~14_combout\,
	combout => \inst|program_counter|s_memory[15]~15_combout\);

-- Location: LCCOMB_X54_Y16_N10
\inst|program_counter|s_memory[15]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[15]~37_combout\ = \inst|program_counter|s_memory\(15) $ (\inst|program_counter|s_memory[15]~15_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|program_counter|s_memory\(15),
	datad => \inst|program_counter|s_memory[15]~15_combout\,
	combout => \inst|program_counter|s_memory[15]~37_combout\);

-- Location: FF_X54_Y16_N11
\inst|program_counter|s_memory[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[15]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(15));

-- Location: LCCOMB_X54_Y16_N4
\inst|program_counter|s_memory[16]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[16]~36_combout\ = \inst|program_counter|s_memory\(16) $ (((\inst|program_counter|s_memory\(15) & \inst|program_counter|s_memory[15]~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(15),
	datac => \inst|program_counter|s_memory\(16),
	datad => \inst|program_counter|s_memory[15]~15_combout\,
	combout => \inst|program_counter|s_memory[16]~36_combout\);

-- Location: FF_X54_Y16_N5
\inst|program_counter|s_memory[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[16]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(16));

-- Location: LCCOMB_X54_Y16_N26
\inst|program_counter|s_memory[17]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[17]~35_combout\ = \inst|program_counter|s_memory\(17) $ (((\inst|program_counter|s_memory\(15) & (\inst|program_counter|s_memory\(16) & \inst|program_counter|s_memory[15]~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(15),
	datab => \inst|program_counter|s_memory\(16),
	datac => \inst|program_counter|s_memory\(17),
	datad => \inst|program_counter|s_memory[15]~15_combout\,
	combout => \inst|program_counter|s_memory[17]~35_combout\);

-- Location: FF_X54_Y16_N27
\inst|program_counter|s_memory[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[17]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(17));

-- Location: LCCOMB_X53_Y16_N18
\inst|program_counter|s_memory[22]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[22]~16_combout\ = (\inst|program_counter|s_memory\(16) & (\inst|program_counter|s_memory\(17) & (\inst|program_counter|s_memory\(15) & \inst|program_counter|s_memory[15]~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(16),
	datab => \inst|program_counter|s_memory\(17),
	datac => \inst|program_counter|s_memory\(15),
	datad => \inst|program_counter|s_memory[15]~15_combout\,
	combout => \inst|program_counter|s_memory[22]~16_combout\);

-- Location: LCCOMB_X54_Y16_N12
\inst|program_counter|s_memory[18]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[18]~34_combout\ = \inst|program_counter|s_memory\(18) $ (\inst|program_counter|s_memory[22]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|program_counter|s_memory\(18),
	datad => \inst|program_counter|s_memory[22]~16_combout\,
	combout => \inst|program_counter|s_memory[18]~34_combout\);

-- Location: FF_X54_Y16_N13
\inst|program_counter|s_memory[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[18]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(18));

-- Location: LCCOMB_X54_Y16_N22
\inst|program_counter|s_memory[19]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[19]~33_combout\ = \inst|program_counter|s_memory\(19) $ (((\inst|program_counter|s_memory\(18) & \inst|program_counter|s_memory[22]~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(18),
	datac => \inst|program_counter|s_memory\(19),
	datad => \inst|program_counter|s_memory[22]~16_combout\,
	combout => \inst|program_counter|s_memory[19]~33_combout\);

-- Location: FF_X54_Y16_N23
\inst|program_counter|s_memory[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[19]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(19));

-- Location: LCCOMB_X54_Y16_N16
\inst|program_counter|s_memory[20]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[20]~32_combout\ = \inst|program_counter|s_memory\(20) $ (((\inst|program_counter|s_memory\(18) & (\inst|program_counter|s_memory\(19) & \inst|program_counter|s_memory[22]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(18),
	datab => \inst|program_counter|s_memory\(19),
	datac => \inst|program_counter|s_memory\(20),
	datad => \inst|program_counter|s_memory[22]~16_combout\,
	combout => \inst|program_counter|s_memory[20]~32_combout\);

-- Location: FF_X54_Y16_N17
\inst|program_counter|s_memory[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[20]~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(20));

-- Location: LCCOMB_X53_Y16_N28
\inst|program_counter|s_memory[22]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[22]~17_combout\ = (\inst|program_counter|s_memory\(20) & (\inst|program_counter|s_memory\(19) & (\inst|program_counter|s_memory\(18) & \inst|program_counter|s_memory[22]~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(20),
	datab => \inst|program_counter|s_memory\(19),
	datac => \inst|program_counter|s_memory\(18),
	datad => \inst|program_counter|s_memory[22]~16_combout\,
	combout => \inst|program_counter|s_memory[22]~17_combout\);

-- Location: LCCOMB_X54_Y16_N18
\inst|program_counter|s_memory[21]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[21]~31_combout\ = \inst|program_counter|s_memory\(21) $ (\inst|program_counter|s_memory[22]~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|program_counter|s_memory\(21),
	datad => \inst|program_counter|s_memory[22]~17_combout\,
	combout => \inst|program_counter|s_memory[21]~31_combout\);

-- Location: FF_X54_Y16_N19
\inst|program_counter|s_memory[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[21]~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(21));

-- Location: LCCOMB_X53_Y16_N0
\inst|program_counter|s_memory[22]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[22]~30_combout\ = \inst|program_counter|s_memory\(22) $ (((\inst|program_counter|s_memory\(21) & \inst|program_counter|s_memory[22]~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|program_counter|s_memory\(21),
	datac => \inst|program_counter|s_memory\(22),
	datad => \inst|program_counter|s_memory[22]~17_combout\,
	combout => \inst|program_counter|s_memory[22]~30_combout\);

-- Location: FF_X53_Y16_N1
\inst|program_counter|s_memory[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[22]~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(22));

-- Location: LCCOMB_X53_Y16_N14
\inst|program_counter|s_memory[23]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[23]~29_combout\ = \inst|program_counter|s_memory\(23) $ (((\inst|program_counter|s_memory\(22) & (\inst|program_counter|s_memory\(21) & \inst|program_counter|s_memory[22]~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(22),
	datab => \inst|program_counter|s_memory\(21),
	datac => \inst|program_counter|s_memory\(23),
	datad => \inst|program_counter|s_memory[22]~17_combout\,
	combout => \inst|program_counter|s_memory[23]~29_combout\);

-- Location: FF_X53_Y16_N15
\inst|program_counter|s_memory[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[23]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(23));

-- Location: LCCOMB_X53_Y16_N22
\inst|program_counter|s_memory[29]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[29]~18_combout\ = (\inst|program_counter|s_memory\(22) & (\inst|program_counter|s_memory\(21) & (\inst|program_counter|s_memory\(23) & \inst|program_counter|s_memory[22]~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(22),
	datab => \inst|program_counter|s_memory\(21),
	datac => \inst|program_counter|s_memory\(23),
	datad => \inst|program_counter|s_memory[22]~17_combout\,
	combout => \inst|program_counter|s_memory[29]~18_combout\);

-- Location: LCCOMB_X52_Y16_N16
\inst|program_counter|s_memory[24]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[24]~28_combout\ = \inst|program_counter|s_memory\(24) $ (\inst|program_counter|s_memory[29]~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|program_counter|s_memory\(24),
	datad => \inst|program_counter|s_memory[29]~18_combout\,
	combout => \inst|program_counter|s_memory[24]~28_combout\);

-- Location: FF_X52_Y16_N17
\inst|program_counter|s_memory[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[24]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(24));

-- Location: LCCOMB_X55_Y17_N14
\inst|main_mux|Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux10~0_combout\ = (\inst|controller|out_sel\(10) & ((!\inst|controller|out_mask[13]~1_q\) # (!\inst|controller|out_mask[13]~2_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|out_mask[13]~2_q\,
	datab => \inst|controller|out_mask[13]~1_q\,
	datac => \inst|controller|out_sel\(10),
	combout => \inst|main_mux|Mux10~0_combout\);

-- Location: LCCOMB_X52_Y16_N24
\inst|main_mux|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux7~0_combout\ = (\inst|main_mux|Mux10~0_combout\ & ((\inst|controller|out_sel\(9) & ((\inst|program_counter|s_memory\(24)))) # (!\inst|controller|out_sel\(9) & (\inst|memory_destination_register|s_memory\(24)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|memory_destination_register|s_memory\(24),
	datab => \inst|program_counter|s_memory\(24),
	datac => \inst|controller|out_sel\(9),
	datad => \inst|main_mux|Mux10~0_combout\,
	combout => \inst|main_mux|Mux7~0_combout\);

-- Location: LCCOMB_X52_Y16_N12
\inst|ram|s_memory_rtl_0_bypass[71]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[71]~1_combout\ = !\inst|main_mux|Mux6~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|main_mux|Mux6~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[71]~1_combout\);

-- Location: FF_X52_Y16_N13
\inst|ram|s_memory_rtl_0_bypass[71]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[71]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(71));

-- Location: LCCOMB_X50_Y16_N8
\inst|ram|s_memory_rtl_0_bypass[72]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[72]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[72]~feeder_combout\);

-- Location: FF_X50_Y16_N9
\inst|ram|s_memory_rtl_0_bypass[72]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[72]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(72));

-- Location: LCCOMB_X52_Y16_N6
\inst|program_counter|s_memory[25]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[25]~25_combout\ = \inst|program_counter|s_memory\(25) $ (((\inst|program_counter|s_memory\(24) & \inst|program_counter|s_memory[29]~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|program_counter|s_memory\(24),
	datac => \inst|program_counter|s_memory\(25),
	datad => \inst|program_counter|s_memory[29]~18_combout\,
	combout => \inst|program_counter|s_memory[25]~25_combout\);

-- Location: FF_X52_Y16_N7
\inst|program_counter|s_memory[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[25]~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(25));

-- Location: LCCOMB_X52_Y16_N2
\inst|program_counter|s_memory[26]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[26]~26_combout\ = \inst|program_counter|s_memory\(26) $ (((\inst|program_counter|s_memory\(25) & (\inst|program_counter|s_memory\(24) & \inst|program_counter|s_memory[29]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(25),
	datab => \inst|program_counter|s_memory\(24),
	datac => \inst|program_counter|s_memory\(26),
	datad => \inst|program_counter|s_memory[29]~18_combout\,
	combout => \inst|program_counter|s_memory[26]~26_combout\);

-- Location: FF_X52_Y16_N3
\inst|program_counter|s_memory[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[26]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(26));

-- Location: FF_X52_Y16_N21
\inst|memory_destination_register|s_memory[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(26),
	sload => VCC,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(26));

-- Location: LCCOMB_X52_Y16_N20
\inst|main_mux|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux5~0_combout\ = (\inst|main_mux|Mux10~0_combout\ & ((\inst|controller|out_sel\(9) & (\inst|program_counter|s_memory\(26))) # (!\inst|controller|out_sel\(9) & ((\inst|memory_destination_register|s_memory\(26))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|out_sel\(9),
	datab => \inst|program_counter|s_memory\(26),
	datac => \inst|memory_destination_register|s_memory\(26),
	datad => \inst|main_mux|Mux10~0_combout\,
	combout => \inst|main_mux|Mux5~0_combout\);

-- Location: LCCOMB_X50_Y16_N26
\inst|ram|s_memory_rtl_0_bypass[76]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[76]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[76]~feeder_combout\);

-- Location: FF_X50_Y16_N27
\inst|ram|s_memory_rtl_0_bypass[76]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[76]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(76));

-- Location: FF_X52_Y16_N5
\inst|ram|s_memory_rtl_0_bypass[77]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|main_mux|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(77));

-- Location: LCCOMB_X53_Y16_N20
\inst|program_counter|s_memory[29]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[29]~19_combout\ = (\inst|program_counter|s_memory\(26) & (\inst|program_counter|s_memory\(25) & (\inst|program_counter|s_memory[29]~18_combout\ & \inst|program_counter|s_memory\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(26),
	datab => \inst|program_counter|s_memory\(25),
	datac => \inst|program_counter|s_memory[29]~18_combout\,
	datad => \inst|program_counter|s_memory\(24),
	combout => \inst|program_counter|s_memory[29]~19_combout\);

-- Location: LCCOMB_X53_Y16_N8
\inst|program_counter|s_memory[27]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[27]~27_combout\ = \inst|program_counter|s_memory\(27) $ (\inst|program_counter|s_memory[29]~19_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|program_counter|s_memory\(27),
	datad => \inst|program_counter|s_memory[29]~19_combout\,
	combout => \inst|program_counter|s_memory[27]~27_combout\);

-- Location: FF_X53_Y16_N9
\inst|program_counter|s_memory[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[27]~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(27));

-- Location: LCCOMB_X53_Y16_N12
\inst|program_counter|s_memory[28]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[28]~20_combout\ = \inst|program_counter|s_memory\(28) $ (((\inst|program_counter|s_memory\(27) & \inst|program_counter|s_memory[29]~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|program_counter|s_memory\(27),
	datac => \inst|program_counter|s_memory\(28),
	datad => \inst|program_counter|s_memory[29]~19_combout\,
	combout => \inst|program_counter|s_memory[28]~20_combout\);

-- Location: FF_X53_Y16_N13
\inst|program_counter|s_memory[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[28]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(28));

-- Location: LCCOMB_X53_Y16_N30
\inst|program_counter|s_memory[29]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[29]~21_combout\ = \inst|program_counter|s_memory\(29) $ (((\inst|program_counter|s_memory\(28) & (\inst|program_counter|s_memory\(27) & \inst|program_counter|s_memory[29]~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(28),
	datab => \inst|program_counter|s_memory\(27),
	datac => \inst|program_counter|s_memory\(29),
	datad => \inst|program_counter|s_memory[29]~19_combout\,
	combout => \inst|program_counter|s_memory[29]~21_combout\);

-- Location: FF_X53_Y16_N31
\inst|program_counter|s_memory[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[29]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(29));

-- Location: LCCOMB_X53_Y16_N2
\inst|program_counter|s_memory[30]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[30]~22_combout\ = (\inst|program_counter|s_memory\(28) & (\inst|program_counter|s_memory\(27) & (\inst|program_counter|s_memory\(29) & \inst|program_counter|s_memory[29]~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(28),
	datab => \inst|program_counter|s_memory\(27),
	datac => \inst|program_counter|s_memory\(29),
	datad => \inst|program_counter|s_memory[29]~19_combout\,
	combout => \inst|program_counter|s_memory[30]~22_combout\);

-- Location: LCCOMB_X53_Y16_N4
\inst|program_counter|s_memory[30]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[30]~23_combout\ = \inst|program_counter|s_memory\(30) $ (\inst|program_counter|s_memory[30]~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|program_counter|s_memory\(30),
	datad => \inst|program_counter|s_memory[30]~22_combout\,
	combout => \inst|program_counter|s_memory[30]~23_combout\);

-- Location: FF_X53_Y16_N5
\inst|program_counter|s_memory[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[30]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(30));

-- Location: LCCOMB_X53_Y16_N26
\inst|program_counter|s_memory[31]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|program_counter|s_memory[31]~24_combout\ = \inst|program_counter|s_memory\(31) $ (((\inst|program_counter|s_memory\(30) & \inst|program_counter|s_memory[30]~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|program_counter|s_memory\(30),
	datac => \inst|program_counter|s_memory\(31),
	datad => \inst|program_counter|s_memory[30]~22_combout\,
	combout => \inst|program_counter|s_memory[31]~24_combout\);

-- Location: FF_X53_Y16_N27
\inst|program_counter|s_memory[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|program_counter|s_memory[31]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|program_counter|s_memory\(31));

-- Location: FF_X52_Y16_N9
\inst|memory_destination_register|s_memory[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(31),
	sload => VCC,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(31));

-- Location: LCCOMB_X52_Y16_N22
\inst|main_mux|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux0~0_combout\ = (\inst|main_mux|Mux10~0_combout\ & ((\inst|controller|out_sel\(9) & (\inst|program_counter|s_memory\(31))) # (!\inst|controller|out_sel\(9) & ((\inst|memory_destination_register|s_memory\(31))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|out_sel\(9),
	datab => \inst|program_counter|s_memory\(31),
	datac => \inst|memory_destination_register|s_memory\(31),
	datad => \inst|main_mux|Mux10~0_combout\,
	combout => \inst|main_mux|Mux0~0_combout\);

-- Location: M9K_X51_Y16_N0
\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "quanta.mif",
	init_file_layout => "port_a",
	logical_ram_name => "processor:inst|ram:ram|altsyncram:s_memory_rtl_0|altsyncram_pmk1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 9,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 10,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 9,
	port_b_first_address => 0,
	port_b_first_bit_number => 9,
	port_b_last_address => 1023,
	port_b_logical_ram_depth => 1024,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \inst|ram|s_memory~54_combout\,
	portbre => VCC,
	portbaddrstall => \inst|controller|ALT_INV_out_en\(37),
	clk0 => \sys_clock~inputclkctrl_outclk\,
	portadatain => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\,
	portaaddr => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\,
	portbaddr => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X52_Y17_N18
\inst|ram|s_memory_rtl_0_bypass[82]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[82]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[82]~feeder_combout\);

-- Location: FF_X52_Y17_N19
\inst|ram|s_memory_rtl_0_bypass[82]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[82]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(82));

-- Location: FF_X52_Y16_N1
\inst|ram|s_memory_rtl_0_bypass[81]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|main_mux|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(81));

-- Location: LCCOMB_X52_Y17_N0
\inst|ram|s_memory~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~63_combout\ = (\inst|ram|s_memory_rtl_0_bypass\(82) & ((\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0_bypass\(81)))) # (!\inst|ram|s_memory~49_combout\ & (\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a30\)))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(82) & (((\inst|ram|s_memory_rtl_0_bypass\(81)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a30\,
	datab => \inst|ram|s_memory_rtl_0_bypass\(82),
	datac => \inst|ram|s_memory~49_combout\,
	datad => \inst|ram|s_memory_rtl_0_bypass\(81),
	combout => \inst|ram|s_memory~63_combout\);

-- Location: FF_X52_Y17_N1
\inst|ram|out_data[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~63_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(30));

-- Location: FF_X53_Y17_N29
\inst|memory_destination_register|s_memory[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(30),
	sload => VCC,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(30));

-- Location: LCCOMB_X52_Y16_N0
\inst|main_mux|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux1~0_combout\ = (\inst|main_mux|Mux10~0_combout\ & ((\inst|controller|out_sel\(9) & (\inst|program_counter|s_memory\(30))) # (!\inst|controller|out_sel\(9) & ((\inst|memory_destination_register|s_memory\(30))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(30),
	datab => \inst|memory_destination_register|s_memory\(30),
	datac => \inst|controller|out_sel\(9),
	datad => \inst|main_mux|Mux10~0_combout\,
	combout => \inst|main_mux|Mux1~0_combout\);

-- Location: FF_X52_Y16_N19
\inst|ram|s_memory_rtl_0_bypass[79]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|main_mux|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(79));

-- Location: LCCOMB_X53_Y17_N0
\inst|ram|s_memory_rtl_0_bypass[80]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[80]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[80]~feeder_combout\);

-- Location: FF_X53_Y17_N1
\inst|ram|s_memory_rtl_0_bypass[80]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[80]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(80));

-- Location: LCCOMB_X52_Y17_N30
\inst|ram|s_memory~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~62_combout\ = (\inst|ram|s_memory_rtl_0_bypass\(80) & ((\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0_bypass\(79)))) # (!\inst|ram|s_memory~49_combout\ & (\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a29\)))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(80) & (((\inst|ram|s_memory_rtl_0_bypass\(79)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a29\,
	datab => \inst|ram|s_memory_rtl_0_bypass\(79),
	datac => \inst|ram|s_memory_rtl_0_bypass\(80),
	datad => \inst|ram|s_memory~49_combout\,
	combout => \inst|ram|s_memory~62_combout\);

-- Location: FF_X52_Y17_N31
\inst|ram|out_data[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~62_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(29));

-- Location: LCCOMB_X53_Y17_N22
\inst|memory_destination_register|s_memory[29]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|memory_destination_register|s_memory[29]~feeder_combout\ = \inst|ram|out_data\(29)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(29),
	combout => \inst|memory_destination_register|s_memory[29]~feeder_combout\);

-- Location: FF_X53_Y17_N23
\inst|memory_destination_register|s_memory[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|memory_destination_register|s_memory[29]~feeder_combout\,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(29));

-- Location: LCCOMB_X52_Y16_N18
\inst|main_mux|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux2~0_combout\ = (\inst|main_mux|Mux10~0_combout\ & ((\inst|controller|out_sel\(9) & (\inst|program_counter|s_memory\(29))) # (!\inst|controller|out_sel\(9) & ((\inst|memory_destination_register|s_memory\(29))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(29),
	datab => \inst|main_mux|Mux10~0_combout\,
	datac => \inst|controller|out_sel\(9),
	datad => \inst|memory_destination_register|s_memory\(29),
	combout => \inst|main_mux|Mux2~0_combout\);

-- Location: LCCOMB_X50_Y16_N12
\inst|ram|s_memory_rtl_0_bypass[78]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[78]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[78]~feeder_combout\);

-- Location: FF_X50_Y16_N13
\inst|ram|s_memory_rtl_0_bypass[78]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[78]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(78));

-- Location: LCCOMB_X50_Y16_N16
\inst|ram|s_memory~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~61_combout\ = (\inst|ram|s_memory~49_combout\ & (\inst|ram|s_memory_rtl_0_bypass\(77))) # (!\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0_bypass\(78) & ((\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a28\))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(78) & (\inst|ram|s_memory_rtl_0_bypass\(77)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory~49_combout\,
	datab => \inst|ram|s_memory_rtl_0_bypass\(77),
	datac => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a28\,
	datad => \inst|ram|s_memory_rtl_0_bypass\(78),
	combout => \inst|ram|s_memory~61_combout\);

-- Location: FF_X50_Y16_N17
\inst|ram|out_data[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~61_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(28));

-- Location: LCCOMB_X52_Y16_N10
\inst|memory_destination_register|s_memory[28]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|memory_destination_register|s_memory[28]~feeder_combout\ = \inst|ram|out_data\(28)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(28),
	combout => \inst|memory_destination_register|s_memory[28]~feeder_combout\);

-- Location: FF_X52_Y16_N11
\inst|memory_destination_register|s_memory[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|memory_destination_register|s_memory[28]~feeder_combout\,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(28));

-- Location: LCCOMB_X52_Y16_N4
\inst|main_mux|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux3~0_combout\ = (\inst|main_mux|Mux10~0_combout\ & ((\inst|controller|out_sel\(9) & ((\inst|program_counter|s_memory\(28)))) # (!\inst|controller|out_sel\(9) & (\inst|memory_destination_register|s_memory\(28)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|memory_destination_register|s_memory\(28),
	datab => \inst|program_counter|s_memory\(28),
	datac => \inst|controller|out_sel\(9),
	datad => \inst|main_mux|Mux10~0_combout\,
	combout => \inst|main_mux|Mux3~0_combout\);

-- Location: FF_X52_Y16_N15
\inst|ram|s_memory_rtl_0_bypass[75]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|main_mux|Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(75));

-- Location: LCCOMB_X50_Y16_N0
\inst|ram|s_memory~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~67_combout\ = (\inst|ram|s_memory_rtl_0_bypass\(76) & ((\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0_bypass\(75)))) # (!\inst|ram|s_memory~49_combout\ & (\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a27\)))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(76) & (((\inst|ram|s_memory_rtl_0_bypass\(75)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0_bypass\(76),
	datab => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a27\,
	datac => \inst|ram|s_memory_rtl_0_bypass\(75),
	datad => \inst|ram|s_memory~49_combout\,
	combout => \inst|ram|s_memory~67_combout\);

-- Location: FF_X50_Y16_N1
\inst|ram|out_data[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~67_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(27));

-- Location: FF_X52_Y16_N31
\inst|memory_destination_register|s_memory[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(27),
	sload => VCC,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(27));

-- Location: LCCOMB_X52_Y16_N14
\inst|main_mux|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux4~0_combout\ = (\inst|main_mux|Mux10~0_combout\ & ((\inst|controller|out_sel\(9) & ((\inst|program_counter|s_memory\(27)))) # (!\inst|controller|out_sel\(9) & (\inst|memory_destination_register|s_memory\(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|memory_destination_register|s_memory\(27),
	datab => \inst|program_counter|s_memory\(27),
	datac => \inst|controller|out_sel\(9),
	datad => \inst|main_mux|Mux10~0_combout\,
	combout => \inst|main_mux|Mux4~0_combout\);

-- Location: LCCOMB_X50_Y16_N20
\inst|ram|s_memory~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~65_combout\ = (\inst|ram|s_memory~49_combout\ & (!\inst|ram|s_memory_rtl_0_bypass\(71))) # (!\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0_bypass\(72) & ((\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a25\))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(72) & (!\inst|ram|s_memory_rtl_0_bypass\(71)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory~49_combout\,
	datab => \inst|ram|s_memory_rtl_0_bypass\(71),
	datac => \inst|ram|s_memory_rtl_0_bypass\(72),
	datad => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a25\,
	combout => \inst|ram|s_memory~65_combout\);

-- Location: FF_X50_Y16_N21
\inst|ram|out_data[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~65_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(25));

-- Location: FF_X52_Y16_N29
\inst|memory_destination_register|s_memory[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(25),
	sload => VCC,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(25));

-- Location: LCCOMB_X52_Y16_N28
\inst|main_mux|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux6~0_combout\ = (\inst|main_mux|Mux10~0_combout\ & ((\inst|controller|out_sel\(9) & ((\inst|program_counter|s_memory\(25)))) # (!\inst|controller|out_sel\(9) & (\inst|memory_destination_register|s_memory\(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|out_sel\(9),
	datab => \inst|main_mux|Mux10~0_combout\,
	datac => \inst|memory_destination_register|s_memory\(25),
	datad => \inst|program_counter|s_memory\(25),
	combout => \inst|main_mux|Mux6~0_combout\);

-- Location: LCCOMB_X50_Y16_N24
\inst|ram|s_memory_rtl_0_bypass[70]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[70]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[70]~feeder_combout\);

-- Location: FF_X50_Y16_N25
\inst|ram|s_memory_rtl_0_bypass[70]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[70]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(70));

-- Location: FF_X52_Y16_N25
\inst|ram|s_memory_rtl_0_bypass[69]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|main_mux|Mux7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(69));

-- Location: LCCOMB_X50_Y16_N10
\inst|ram|s_memory~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~68_combout\ = (\inst|ram|s_memory_rtl_0_bypass\(70) & ((\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0_bypass\(69)))) # (!\inst|ram|s_memory~49_combout\ & (\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a24\)))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(70) & (((\inst|ram|s_memory_rtl_0_bypass\(69)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a24\,
	datab => \inst|ram|s_memory_rtl_0_bypass\(70),
	datac => \inst|ram|s_memory_rtl_0_bypass\(69),
	datad => \inst|ram|s_memory~49_combout\,
	combout => \inst|ram|s_memory~68_combout\);

-- Location: FF_X50_Y16_N11
\inst|ram|out_data[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~68_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(24));

-- Location: LCCOMB_X54_Y17_N26
\inst|instruction_register|s_memory[24]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|instruction_register|s_memory[24]~feeder_combout\ = \inst|ram|out_data\(24)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(24),
	combout => \inst|instruction_register|s_memory[24]~feeder_combout\);

-- Location: FF_X54_Y17_N27
\inst|instruction_register|s_memory[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|instruction_register|s_memory[24]~feeder_combout\,
	ena => \inst|controller|out_en\(35),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|instruction_register|s_memory\(24));

-- Location: LCCOMB_X55_Y17_N4
\inst|controller|out_fun~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|out_fun~0_combout\ = (\inst|controller|s_state.execute_1~q\ & (\inst|instruction_register|s_memory\(24) & \inst|controller|Mux47~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|s_state.execute_1~q\,
	datac => \inst|instruction_register|s_memory\(24),
	datad => \inst|controller|Mux47~0_combout\,
	combout => \inst|controller|out_fun~0_combout\);

-- Location: FF_X55_Y17_N5
\inst|controller|out_fun[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_sys_clock~inputclkctrl_outclk\,
	d => \inst|controller|out_fun~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|controller|out_fun\(0));

-- Location: LCCOMB_X55_Y17_N26
\inst|ram|s_memory~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~54_combout\ = (\inst|controller|out_fun\(0) & \inst|controller|out_en\(39))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|controller|out_fun\(0),
	datad => \inst|controller|out_en\(39),
	combout => \inst|ram|s_memory~54_combout\);

-- Location: FF_X52_Y16_N23
\inst|ram|s_memory_rtl_0_bypass[83]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|main_mux|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(83));

-- Location: LCCOMB_X50_Y16_N18
\inst|ram|s_memory_rtl_0_bypass[84]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[84]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[84]~feeder_combout\);

-- Location: FF_X50_Y16_N19
\inst|ram|s_memory_rtl_0_bypass[84]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[84]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(84));

-- Location: LCCOMB_X50_Y16_N2
\inst|ram|s_memory~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~64_combout\ = (\inst|ram|s_memory~49_combout\ & (((\inst|ram|s_memory_rtl_0_bypass\(83))))) # (!\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0_bypass\(84) & (\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a31\)) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(84) & ((\inst|ram|s_memory_rtl_0_bypass\(83))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory~49_combout\,
	datab => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a31\,
	datac => \inst|ram|s_memory_rtl_0_bypass\(83),
	datad => \inst|ram|s_memory_rtl_0_bypass\(84),
	combout => \inst|ram|s_memory~64_combout\);

-- Location: FF_X50_Y16_N3
\inst|ram|out_data[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~64_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(31));

-- Location: LCCOMB_X54_Y17_N22
\inst|instruction_register|s_memory[31]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|instruction_register|s_memory[31]~feeder_combout\ = \inst|ram|out_data\(31)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(31),
	combout => \inst|instruction_register|s_memory[31]~feeder_combout\);

-- Location: FF_X54_Y17_N23
\inst|instruction_register|s_memory[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|instruction_register|s_memory[31]~feeder_combout\,
	ena => \inst|controller|out_en\(35),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|instruction_register|s_memory\(31));

-- Location: LCCOMB_X54_Y17_N16
\inst|instruction_register|s_memory[30]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|instruction_register|s_memory[30]~feeder_combout\ = \inst|ram|out_data\(30)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(30),
	combout => \inst|instruction_register|s_memory[30]~feeder_combout\);

-- Location: FF_X54_Y17_N17
\inst|instruction_register|s_memory[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|instruction_register|s_memory[30]~feeder_combout\,
	ena => \inst|controller|out_en\(35),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|instruction_register|s_memory\(30));

-- Location: FF_X54_Y17_N25
\inst|instruction_register|s_memory[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(28),
	sload => VCC,
	ena => \inst|controller|out_en\(35),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|instruction_register|s_memory\(28));

-- Location: LCCOMB_X54_Y17_N18
\inst|instruction_register|s_memory[29]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|instruction_register|s_memory[29]~feeder_combout\ = \inst|ram|out_data\(29)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(29),
	combout => \inst|instruction_register|s_memory[29]~feeder_combout\);

-- Location: FF_X54_Y17_N19
\inst|instruction_register|s_memory[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|instruction_register|s_memory[29]~feeder_combout\,
	ena => \inst|controller|out_en\(35),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|instruction_register|s_memory\(29));

-- Location: LCCOMB_X54_Y17_N24
\inst|controller|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|Mux0~0_combout\ = (!\inst|instruction_register|s_memory\(31) & (!\inst|instruction_register|s_memory\(30) & (!\inst|instruction_register|s_memory\(28) & !\inst|instruction_register|s_memory\(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|instruction_register|s_memory\(31),
	datab => \inst|instruction_register|s_memory\(30),
	datac => \inst|instruction_register|s_memory\(28),
	datad => \inst|instruction_register|s_memory\(29),
	combout => \inst|controller|Mux0~0_combout\);

-- Location: FF_X54_Y17_N13
\inst|instruction_register|s_memory[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(27),
	sload => VCC,
	ena => \inst|controller|out_en\(35),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|instruction_register|s_memory\(27));

-- Location: LCCOMB_X54_Y17_N28
\inst|instruction_register|s_memory[25]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|instruction_register|s_memory[25]~feeder_combout\ = \inst|ram|out_data\(25)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(25),
	combout => \inst|instruction_register|s_memory[25]~feeder_combout\);

-- Location: FF_X54_Y17_N29
\inst|instruction_register|s_memory[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|instruction_register|s_memory[25]~feeder_combout\,
	ena => \inst|controller|out_en\(35),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|instruction_register|s_memory\(25));

-- Location: LCCOMB_X54_Y17_N14
\inst|controller|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|Mux0~1_combout\ = (!\inst|instruction_register|s_memory\(27) & (!\inst|instruction_register|s_memory\(26) & ((\inst|instruction_register|s_memory\(25)) # (\inst|instruction_register|s_memory\(24)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|instruction_register|s_memory\(27),
	datab => \inst|instruction_register|s_memory\(25),
	datac => \inst|instruction_register|s_memory\(26),
	datad => \inst|instruction_register|s_memory\(24),
	combout => \inst|controller|Mux0~1_combout\);

-- Location: LCCOMB_X55_Y17_N24
\inst|controller|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|Mux0~2_combout\ = (\inst|controller|Mux0~0_combout\ & \inst|controller|Mux0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|controller|Mux0~0_combout\,
	datad => \inst|controller|Mux0~1_combout\,
	combout => \inst|controller|Mux0~2_combout\);

-- Location: FF_X55_Y17_N25
\inst|controller|out_mask[13]~1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_sys_clock~inputclkctrl_outclk\,
	d => \inst|controller|Mux0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|controller|out_mask[13]~1_q\);

-- Location: LCCOMB_X55_Y17_N12
\inst|main_mux|Mux31~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux31~1_combout\ = (\inst|controller|out_sel\(9) & ((!\inst|controller|out_mask[13]~1_q\) # (!\inst|controller|out_mask[13]~2_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|out_mask[13]~2_q\,
	datab => \inst|controller|out_mask[13]~1_q\,
	datad => \inst|controller|out_sel\(9),
	combout => \inst|main_mux|Mux31~1_combout\);

-- Location: LCCOMB_X52_Y17_N12
\inst|ram|s_memory_rtl_0_bypass[40]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[40]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[40]~feeder_combout\);

-- Location: FF_X52_Y17_N13
\inst|ram|s_memory_rtl_0_bypass[40]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[40]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(40));

-- Location: LCCOMB_X52_Y17_N22
\inst|ram|s_memory_rtl_0_bypass[39]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[39]~feeder_combout\ = \inst|main_mux|Mux22~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|main_mux|Mux22~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[39]~feeder_combout\);

-- Location: FF_X52_Y17_N23
\inst|ram|s_memory_rtl_0_bypass[39]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[39]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(39));

-- Location: LCCOMB_X52_Y17_N16
\inst|ram|s_memory~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~60_combout\ = (\inst|ram|s_memory_rtl_0_bypass\(40) & ((\inst|ram|s_memory~49_combout\ & (\inst|ram|s_memory_rtl_0_bypass\(39))) # (!\inst|ram|s_memory~49_combout\ & 
-- ((\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9~portbdataout\))))) # (!\inst|ram|s_memory_rtl_0_bypass\(40) & (((\inst|ram|s_memory_rtl_0_bypass\(39)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0_bypass\(40),
	datab => \inst|ram|s_memory~49_combout\,
	datac => \inst|ram|s_memory_rtl_0_bypass\(39),
	datad => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	combout => \inst|ram|s_memory~60_combout\);

-- Location: FF_X52_Y17_N17
\inst|ram|out_data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~60_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(9));

-- Location: FF_X53_Y17_N7
\inst|memory_destination_register|s_memory[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(9),
	sload => VCC,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(9));

-- Location: LCCOMB_X53_Y17_N6
\inst|main_mux|Mux22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux22~0_combout\ = (\inst|main_mux|Mux31~0_combout\ & ((\inst|main_mux|Mux31~1_combout\ & (\inst|program_counter|s_memory\(9))) # (!\inst|main_mux|Mux31~1_combout\ & ((\inst|memory_destination_register|s_memory\(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|program_counter|s_memory\(9),
	datab => \inst|main_mux|Mux31~1_combout\,
	datac => \inst|memory_destination_register|s_memory\(9),
	datad => \inst|main_mux|Mux31~0_combout\,
	combout => \inst|main_mux|Mux22~0_combout\);

-- Location: LCCOMB_X50_Y15_N6
\inst|memory_address_register|s_memory[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|memory_address_register|s_memory[9]~feeder_combout\ = \inst|main_mux|Mux22~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|main_mux|Mux22~0_combout\,
	combout => \inst|memory_address_register|s_memory[9]~feeder_combout\);

-- Location: FF_X50_Y15_N7
\inst|memory_address_register|s_memory[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|memory_address_register|s_memory[9]~feeder_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_address_register|s_memory\(9));

-- Location: LCCOMB_X50_Y15_N10
\inst|ram|s_memory_rtl_0_bypass[19]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[19]~feeder_combout\ = \inst|memory_address_register|s_memory\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|memory_address_register|s_memory\(9),
	combout => \inst|ram|s_memory_rtl_0_bypass[19]~feeder_combout\);

-- Location: FF_X50_Y15_N11
\inst|ram|s_memory_rtl_0_bypass[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[19]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(19));

-- Location: LCCOMB_X50_Y15_N14
\inst|ram|s_memory_rtl_0_bypass[18]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[18]~feeder_combout\ = \inst|main_mux|Mux23~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|main_mux|Mux23~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[18]~feeder_combout\);

-- Location: FF_X50_Y15_N15
\inst|ram|s_memory_rtl_0_bypass[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[18]~feeder_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(18));

-- Location: FF_X50_Y15_N21
\inst|ram|s_memory_rtl_0_bypass[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|memory_address_register|s_memory\(8),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(17));

-- Location: LCCOMB_X50_Y15_N16
\inst|ram|s_memory_rtl_0_bypass[20]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[20]~feeder_combout\ = \inst|main_mux|Mux22~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|main_mux|Mux22~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[20]~feeder_combout\);

-- Location: FF_X50_Y15_N17
\inst|ram|s_memory_rtl_0_bypass[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[20]~feeder_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(20));

-- Location: LCCOMB_X50_Y15_N20
\inst|ram|s_memory~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~48_combout\ = (\inst|ram|s_memory_rtl_0_bypass\(19) & (\inst|ram|s_memory_rtl_0_bypass\(20) & (\inst|ram|s_memory_rtl_0_bypass\(18) $ (!\inst|ram|s_memory_rtl_0_bypass\(17))))) # (!\inst|ram|s_memory_rtl_0_bypass\(19) & 
-- (!\inst|ram|s_memory_rtl_0_bypass\(20) & (\inst|ram|s_memory_rtl_0_bypass\(18) $ (!\inst|ram|s_memory_rtl_0_bypass\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0_bypass\(19),
	datab => \inst|ram|s_memory_rtl_0_bypass\(18),
	datac => \inst|ram|s_memory_rtl_0_bypass\(17),
	datad => \inst|ram|s_memory_rtl_0_bypass\(20),
	combout => \inst|ram|s_memory~48_combout\);

-- Location: FF_X52_Y15_N9
\inst|ram|s_memory_rtl_0_bypass[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|s_memory~54_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(0));

-- Location: FF_X52_Y15_N13
\inst|ram|s_memory_rtl_0_bypass[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|memory_address_register|s_memory\(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(7));

-- Location: LCCOMB_X52_Y15_N14
\inst|ram|s_memory_rtl_0_bypass[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[5]~feeder_combout\ = \inst|memory_address_register|s_memory\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|memory_address_register|s_memory\(2),
	combout => \inst|ram|s_memory_rtl_0_bypass[5]~feeder_combout\);

-- Location: FF_X52_Y15_N15
\inst|ram|s_memory_rtl_0_bypass[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(5));

-- Location: FF_X52_Y15_N27
\inst|ram|s_memory_rtl_0_bypass[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|main_mux|Mux28~0_combout\,
	sload => VCC,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(8));

-- Location: LCCOMB_X52_Y15_N0
\inst|ram|s_memory_rtl_0_bypass[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[6]~feeder_combout\ = \inst|main_mux|Mux29~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|main_mux|Mux29~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[6]~feeder_combout\);

-- Location: FF_X52_Y15_N1
\inst|ram|s_memory_rtl_0_bypass[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[6]~feeder_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(6));

-- Location: LCCOMB_X52_Y15_N26
\inst|ram|s_memory~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~44_combout\ = (\inst|ram|s_memory_rtl_0_bypass\(7) & (\inst|ram|s_memory_rtl_0_bypass\(8) & (\inst|ram|s_memory_rtl_0_bypass\(5) $ (!\inst|ram|s_memory_rtl_0_bypass\(6))))) # (!\inst|ram|s_memory_rtl_0_bypass\(7) & 
-- (!\inst|ram|s_memory_rtl_0_bypass\(8) & (\inst|ram|s_memory_rtl_0_bypass\(5) $ (!\inst|ram|s_memory_rtl_0_bypass\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0_bypass\(7),
	datab => \inst|ram|s_memory_rtl_0_bypass\(5),
	datac => \inst|ram|s_memory_rtl_0_bypass\(8),
	datad => \inst|ram|s_memory_rtl_0_bypass\(6),
	combout => \inst|ram|s_memory~44_combout\);

-- Location: LCCOMB_X52_Y15_N10
\inst|ram|s_memory_rtl_0_bypass[16]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[16]~feeder_combout\ = \inst|main_mux|Mux24~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|main_mux|Mux24~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[16]~feeder_combout\);

-- Location: FF_X52_Y15_N11
\inst|ram|s_memory_rtl_0_bypass[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[16]~feeder_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(16));

-- Location: LCCOMB_X52_Y15_N24
\inst|ram|s_memory_rtl_0_bypass[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[15]~feeder_combout\ = \inst|memory_address_register|s_memory\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|memory_address_register|s_memory\(7),
	combout => \inst|ram|s_memory_rtl_0_bypass[15]~feeder_combout\);

-- Location: FF_X52_Y15_N25
\inst|ram|s_memory_rtl_0_bypass[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[15]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(15));

-- Location: FF_X52_Y15_N29
\inst|ram|s_memory_rtl_0_bypass[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|main_mux|Mux25~0_combout\,
	sload => VCC,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(14));

-- Location: FF_X52_Y15_N3
\inst|ram|s_memory_rtl_0_bypass[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|memory_address_register|s_memory\(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(13));

-- Location: LCCOMB_X52_Y15_N28
\inst|ram|s_memory~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~46_combout\ = (\inst|ram|s_memory_rtl_0_bypass\(16) & (\inst|ram|s_memory_rtl_0_bypass\(15) & (\inst|ram|s_memory_rtl_0_bypass\(14) $ (!\inst|ram|s_memory_rtl_0_bypass\(13))))) # (!\inst|ram|s_memory_rtl_0_bypass\(16) & 
-- (!\inst|ram|s_memory_rtl_0_bypass\(15) & (\inst|ram|s_memory_rtl_0_bypass\(14) $ (!\inst|ram|s_memory_rtl_0_bypass\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0_bypass\(16),
	datab => \inst|ram|s_memory_rtl_0_bypass\(15),
	datac => \inst|ram|s_memory_rtl_0_bypass\(14),
	datad => \inst|ram|s_memory_rtl_0_bypass\(13),
	combout => \inst|ram|s_memory~46_combout\);

-- Location: FF_X50_Y15_N23
\inst|ram|s_memory_rtl_0_bypass[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|memory_address_register|s_memory\(5),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(11));

-- Location: LCCOMB_X50_Y15_N18
\inst|ram|s_memory_rtl_0_bypass[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[10]~feeder_combout\ = \inst|main_mux|Mux27~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|main_mux|Mux27~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[10]~feeder_combout\);

-- Location: FF_X50_Y15_N19
\inst|ram|s_memory_rtl_0_bypass[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[10]~feeder_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(10));

-- Location: FF_X50_Y15_N25
\inst|ram|s_memory_rtl_0_bypass[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|main_mux|Mux26~0_combout\,
	sload => VCC,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(12));

-- Location: LCCOMB_X50_Y15_N12
\inst|ram|s_memory_rtl_0_bypass[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[9]~feeder_combout\ = \inst|memory_address_register|s_memory\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|memory_address_register|s_memory\(4),
	combout => \inst|ram|s_memory_rtl_0_bypass[9]~feeder_combout\);

-- Location: FF_X50_Y15_N13
\inst|ram|s_memory_rtl_0_bypass[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[9]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(9));

-- Location: LCCOMB_X50_Y15_N24
\inst|ram|s_memory~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~45_combout\ = (\inst|ram|s_memory_rtl_0_bypass\(11) & (\inst|ram|s_memory_rtl_0_bypass\(12) & (\inst|ram|s_memory_rtl_0_bypass\(10) $ (!\inst|ram|s_memory_rtl_0_bypass\(9))))) # (!\inst|ram|s_memory_rtl_0_bypass\(11) & 
-- (!\inst|ram|s_memory_rtl_0_bypass\(12) & (\inst|ram|s_memory_rtl_0_bypass\(10) $ (!\inst|ram|s_memory_rtl_0_bypass\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0_bypass\(11),
	datab => \inst|ram|s_memory_rtl_0_bypass\(10),
	datac => \inst|ram|s_memory_rtl_0_bypass\(12),
	datad => \inst|ram|s_memory_rtl_0_bypass\(9),
	combout => \inst|ram|s_memory~45_combout\);

-- Location: LCCOMB_X53_Y15_N30
\inst|ram|s_memory_rtl_0_bypass[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[2]~feeder_combout\ = \inst|main_mux|Mux31~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|main_mux|Mux31~2_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[2]~feeder_combout\);

-- Location: FF_X53_Y15_N31
\inst|ram|s_memory_rtl_0_bypass[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[2]~feeder_combout\,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(2));

-- Location: LCCOMB_X53_Y15_N24
\inst|ram|s_memory_rtl_0_bypass[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[1]~feeder_combout\ = \inst|memory_address_register|s_memory\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|memory_address_register|s_memory\(0),
	combout => \inst|ram|s_memory_rtl_0_bypass[1]~feeder_combout\);

-- Location: FF_X53_Y15_N25
\inst|ram|s_memory_rtl_0_bypass[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(1));

-- Location: FF_X53_Y15_N5
\inst|ram|s_memory_rtl_0_bypass[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|main_mux|Mux30~0_combout\,
	sload => VCC,
	ena => \inst|controller|out_en\(37),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(4));

-- Location: LCCOMB_X53_Y15_N6
\inst|ram|s_memory_rtl_0_bypass[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[3]~feeder_combout\ = \inst|memory_address_register|s_memory\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|memory_address_register|s_memory\(1),
	combout => \inst|ram|s_memory_rtl_0_bypass[3]~feeder_combout\);

-- Location: FF_X53_Y15_N7
\inst|ram|s_memory_rtl_0_bypass[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(3));

-- Location: LCCOMB_X53_Y15_N4
\inst|ram|s_memory~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~43_combout\ = (\inst|ram|s_memory_rtl_0_bypass\(2) & (\inst|ram|s_memory_rtl_0_bypass\(1) & (\inst|ram|s_memory_rtl_0_bypass\(4) $ (!\inst|ram|s_memory_rtl_0_bypass\(3))))) # (!\inst|ram|s_memory_rtl_0_bypass\(2) & 
-- (!\inst|ram|s_memory_rtl_0_bypass\(1) & (\inst|ram|s_memory_rtl_0_bypass\(4) $ (!\inst|ram|s_memory_rtl_0_bypass\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0_bypass\(2),
	datab => \inst|ram|s_memory_rtl_0_bypass\(1),
	datac => \inst|ram|s_memory_rtl_0_bypass\(4),
	datad => \inst|ram|s_memory_rtl_0_bypass\(3),
	combout => \inst|ram|s_memory~43_combout\);

-- Location: LCCOMB_X52_Y15_N6
\inst|ram|s_memory~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~47_combout\ = (\inst|ram|s_memory~44_combout\ & (\inst|ram|s_memory~46_combout\ & (\inst|ram|s_memory~45_combout\ & \inst|ram|s_memory~43_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory~44_combout\,
	datab => \inst|ram|s_memory~46_combout\,
	datac => \inst|ram|s_memory~45_combout\,
	datad => \inst|ram|s_memory~43_combout\,
	combout => \inst|ram|s_memory~47_combout\);

-- Location: LCCOMB_X52_Y15_N8
\inst|ram|s_memory~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~49_combout\ = (\inst|ram|s_memory~48_combout\ & (\inst|ram|s_memory_rtl_0_bypass\(0) & \inst|ram|s_memory~47_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|ram|s_memory~48_combout\,
	datac => \inst|ram|s_memory_rtl_0_bypass\(0),
	datad => \inst|ram|s_memory~47_combout\,
	combout => \inst|ram|s_memory~49_combout\);

-- Location: LCCOMB_X50_Y16_N28
\inst|ram|s_memory_rtl_0_bypass[74]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[74]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[74]~feeder_combout\);

-- Location: FF_X50_Y16_N29
\inst|ram|s_memory_rtl_0_bypass[74]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[74]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(74));

-- Location: LCCOMB_X50_Y16_N30
\inst|ram|s_memory_rtl_0_bypass[73]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[73]~feeder_combout\ = \inst|main_mux|Mux5~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|main_mux|Mux5~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[73]~feeder_combout\);

-- Location: FF_X50_Y16_N31
\inst|ram|s_memory_rtl_0_bypass[73]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[73]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(73));

-- Location: LCCOMB_X50_Y16_N14
\inst|ram|s_memory~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~66_combout\ = (\inst|ram|s_memory~49_combout\ & (((\inst|ram|s_memory_rtl_0_bypass\(73))))) # (!\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0_bypass\(74) & ((\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a26\))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(74) & (\inst|ram|s_memory_rtl_0_bypass\(73)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory~49_combout\,
	datab => \inst|ram|s_memory_rtl_0_bypass\(74),
	datac => \inst|ram|s_memory_rtl_0_bypass\(73),
	datad => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a26\,
	combout => \inst|ram|s_memory~66_combout\);

-- Location: FF_X50_Y16_N15
\inst|ram|out_data[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~66_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(26));

-- Location: FF_X54_Y17_N15
\inst|instruction_register|s_memory[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(26),
	sload => VCC,
	ena => \inst|controller|out_en\(35),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|instruction_register|s_memory\(26));

-- Location: LCCOMB_X54_Y17_N12
\inst|controller|Mux47~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|Mux47~0_combout\ = (!\inst|instruction_register|s_memory\(26) & (\inst|instruction_register|s_memory\(25) & (!\inst|instruction_register|s_memory\(27) & \inst|controller|Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|instruction_register|s_memory\(26),
	datab => \inst|instruction_register|s_memory\(25),
	datac => \inst|instruction_register|s_memory\(27),
	datad => \inst|controller|Mux0~0_combout\,
	combout => \inst|controller|Mux47~0_combout\);

-- Location: LCCOMB_X55_Y17_N22
\inst|controller|Selector43~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|Selector43~0_combout\ = (\inst|controller|s_state.execute_1~q\ & ((\inst|instruction_register|s_memory\(24)) # (!\inst|controller|Mux47~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|s_state.execute_1~q\,
	datab => \inst|instruction_register|s_memory\(24),
	datad => \inst|controller|Mux47~0_combout\,
	combout => \inst|controller|Selector43~0_combout\);

-- Location: LCCOMB_X55_Y17_N18
\inst|controller|Selector43~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|Selector43~1_combout\ = (!\inst|controller|s_state.execute_2~q\ & (!\inst|controller|Selector43~0_combout\ & ((\inst|controller|Mux47~0_combout\) # (!\inst|controller|out_en\(35)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|Mux47~0_combout\,
	datab => \inst|controller|s_state.execute_2~q\,
	datac => \inst|controller|out_en\(35),
	datad => \inst|controller|Selector43~0_combout\,
	combout => \inst|controller|Selector43~1_combout\);

-- Location: FF_X55_Y17_N19
\inst|controller|s_state.fetch_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_sys_clock~inputclkctrl_outclk\,
	d => \inst|controller|Selector43~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|controller|s_state.fetch_0~q\);

-- Location: LCCOMB_X54_Y16_N30
\inst|controller|out_en[34]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|out_en[34]~0_combout\ = !\inst|controller|s_state.fetch_0~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|controller|s_state.fetch_0~q\,
	combout => \inst|controller|out_en[34]~0_combout\);

-- Location: FF_X53_Y16_N17
\inst|controller|out_en[34]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_sys_clock~inputclkctrl_outclk\,
	asdata => \inst|controller|out_en[34]~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|controller|out_en\(34));

-- Location: FF_X55_Y17_N13
\inst|controller|out_en[35]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_sys_clock~inputclkctrl_outclk\,
	asdata => \inst|controller|out_en\(34),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|controller|out_en\(35));

-- Location: LCCOMB_X55_Y17_N6
\inst|controller|Selector3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|Selector3~1_combout\ = (\inst|controller|out_en\(35) & \inst|controller|Mux47~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|out_en\(35),
	datad => \inst|controller|Mux47~0_combout\,
	combout => \inst|controller|Selector3~1_combout\);

-- Location: FF_X55_Y17_N7
\inst|controller|s_state.execute_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_sys_clock~inputclkctrl_outclk\,
	d => \inst|controller|Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|controller|s_state.execute_1~q\);

-- Location: LCCOMB_X55_Y17_N30
\inst|controller|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|controller|Selector2~0_combout\ = (\inst|controller|s_state~8_combout\) # ((!\inst|controller|s_state.execute_1~q\ & (\inst|controller|out_en\(34) & !\inst|controller|s_state.execute_2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|controller|s_state.execute_1~q\,
	datab => \inst|controller|out_en\(34),
	datac => \inst|controller|s_state.execute_2~q\,
	datad => \inst|controller|s_state~8_combout\,
	combout => \inst|controller|Selector2~0_combout\);

-- Location: FF_X55_Y17_N31
\inst|controller|out_en[38]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_sys_clock~inputclkctrl_outclk\,
	d => \inst|controller|Selector2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|controller|out_en\(38));

-- Location: FF_X55_Y15_N25
\inst|memory_destination_register|s_memory[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|memory_destination_register|s_memory[3]~feeder_combout\,
	ena => \inst|controller|out_en\(38),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|memory_destination_register|s_memory\(3));

-- Location: LCCOMB_X52_Y15_N4
\inst|main_mux|Mux28~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|main_mux|Mux28~0_combout\ = (\inst|main_mux|Mux31~0_combout\ & ((\inst|main_mux|Mux31~1_combout\ & ((\inst|program_counter|s_memory\(3)))) # (!\inst|main_mux|Mux31~1_combout\ & (\inst|memory_destination_register|s_memory\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|memory_destination_register|s_memory\(3),
	datab => \inst|program_counter|s_memory\(3),
	datac => \inst|main_mux|Mux31~1_combout\,
	datad => \inst|main_mux|Mux31~0_combout\,
	combout => \inst|main_mux|Mux28~0_combout\);

-- Location: LCCOMB_X52_Y15_N20
\inst|ram|s_memory_rtl_0_bypass[27]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[27]~feeder_combout\ = \inst|main_mux|Mux28~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|main_mux|Mux28~0_combout\,
	combout => \inst|ram|s_memory_rtl_0_bypass[27]~feeder_combout\);

-- Location: FF_X52_Y15_N21
\inst|ram|s_memory_rtl_0_bypass[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[27]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(27));

-- Location: LCCOMB_X54_Y15_N28
\inst|ram|s_memory_rtl_0_bypass[28]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory_rtl_0_bypass[28]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|ram|s_memory_rtl_0_bypass[28]~feeder_combout\);

-- Location: FF_X54_Y15_N29
\inst|ram|s_memory_rtl_0_bypass[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory_rtl_0_bypass[28]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|s_memory_rtl_0_bypass\(28));

-- Location: LCCOMB_X54_Y15_N8
\inst|ram|s_memory~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|ram|s_memory~50_combout\ = (\inst|ram|s_memory~49_combout\ & (\inst|ram|s_memory_rtl_0_bypass\(27))) # (!\inst|ram|s_memory~49_combout\ & ((\inst|ram|s_memory_rtl_0_bypass\(28) & ((\inst|ram|s_memory_rtl_0|auto_generated|ram_block1a3\))) # 
-- (!\inst|ram|s_memory_rtl_0_bypass\(28) & (\inst|ram|s_memory_rtl_0_bypass\(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ram|s_memory_rtl_0_bypass\(27),
	datab => \inst|ram|s_memory_rtl_0|auto_generated|ram_block1a3\,
	datac => \inst|ram|s_memory~49_combout\,
	datad => \inst|ram|s_memory_rtl_0_bypass\(28),
	combout => \inst|ram|s_memory~50_combout\);

-- Location: FF_X54_Y15_N9
\inst|ram|out_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|ram|s_memory~50_combout\,
	ena => \inst|ram|out_data[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|ram|out_data\(3));

-- Location: LCCOMB_X55_Y15_N16
\inst|instruction_register|s_memory[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|instruction_register|s_memory[3]~feeder_combout\ = \inst|ram|out_data\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(3),
	combout => \inst|instruction_register|s_memory[3]~feeder_combout\);

-- Location: FF_X55_Y15_N17
\inst|instruction_register|s_memory[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|instruction_register|s_memory[3]~feeder_combout\,
	ena => \inst|controller|out_en\(35),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|instruction_register|s_memory\(3));

-- Location: LCCOMB_X55_Y15_N6
\inst|instruction_register|s_memory[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|instruction_register|s_memory[2]~feeder_combout\ = \inst|ram|out_data\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(2),
	combout => \inst|instruction_register|s_memory[2]~feeder_combout\);

-- Location: FF_X55_Y15_N7
\inst|instruction_register|s_memory[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|instruction_register|s_memory[2]~feeder_combout\,
	ena => \inst|controller|out_en\(35),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|instruction_register|s_memory\(2));

-- Location: FF_X55_Y15_N21
\inst|instruction_register|s_memory[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	asdata => \inst|ram|out_data\(1),
	sload => VCC,
	ena => \inst|controller|out_en\(35),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|instruction_register|s_memory\(1));

-- Location: LCCOMB_X55_Y15_N26
\inst|instruction_register|s_memory[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|instruction_register|s_memory[0]~feeder_combout\ = \inst|ram|out_data\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|ram|out_data\(0),
	combout => \inst|instruction_register|s_memory[0]~feeder_combout\);

-- Location: FF_X55_Y15_N27
\inst|instruction_register|s_memory[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clock~inputclkctrl_outclk\,
	d => \inst|instruction_register|s_memory[0]~feeder_combout\,
	ena => \inst|controller|out_en\(35),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|instruction_register|s_memory\(0));

ww_out_clock <= \out_clock~output_o\;

ww_data(3) <= \data[3]~output_o\;

ww_data(2) <= \data[2]~output_o\;

ww_data(1) <= \data[1]~output_o\;

ww_data(0) <= \data[0]~output_o\;
END structure;


