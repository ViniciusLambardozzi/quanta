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

-- DATE "03/14/2018 11:41:30"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	quanta2 IS
    PORT (
	out_hex_0 : OUT std_logic_vector(6 DOWNTO 0);
	sys_clock : IN std_logic
	);
END quanta2;

-- Design Ports Information
-- out_hex_0[6]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_hex_0[5]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_hex_0[4]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_hex_0[3]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_hex_0[2]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_hex_0[1]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_hex_0[0]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sys_clock	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF quanta2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_out_hex_0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_sys_clock : std_logic;
SIGNAL \sys_clock~input_o\ : std_logic;
SIGNAL \out_hex_0[6]~output_o\ : std_logic;
SIGNAL \out_hex_0[5]~output_o\ : std_logic;
SIGNAL \out_hex_0[4]~output_o\ : std_logic;
SIGNAL \out_hex_0[3]~output_o\ : std_logic;
SIGNAL \out_hex_0[2]~output_o\ : std_logic;
SIGNAL \out_hex_0[1]~output_o\ : std_logic;
SIGNAL \out_hex_0[0]~output_o\ : std_logic;

BEGIN

out_hex_0 <= ww_out_hex_0;
ww_sys_clock <= sys_clock;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X74_Y0_N16
\out_hex_0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_hex_0[6]~output_o\);

-- Location: IOOBUF_X67_Y0_N9
\out_hex_0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_hex_0[5]~output_o\);

-- Location: IOOBUF_X62_Y0_N23
\out_hex_0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_hex_0[4]~output_o\);

-- Location: IOOBUF_X62_Y0_N16
\out_hex_0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_hex_0[3]~output_o\);

-- Location: IOOBUF_X67_Y0_N2
\out_hex_0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_hex_0[2]~output_o\);

-- Location: IOOBUF_X69_Y0_N9
\out_hex_0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_hex_0[1]~output_o\);

-- Location: IOOBUF_X54_Y0_N23
\out_hex_0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \out_hex_0[0]~output_o\);

-- Location: IOIBUF_X115_Y40_N8
\sys_clock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sys_clock,
	o => \sys_clock~input_o\);

ww_out_hex_0(6) <= \out_hex_0[6]~output_o\;

ww_out_hex_0(5) <= \out_hex_0[5]~output_o\;

ww_out_hex_0(4) <= \out_hex_0[4]~output_o\;

ww_out_hex_0(3) <= \out_hex_0[3]~output_o\;

ww_out_hex_0(2) <= \out_hex_0[2]~output_o\;

ww_out_hex_0(1) <= \out_hex_0[1]~output_o\;

ww_out_hex_0(0) <= \out_hex_0[0]~output_o\;
END structure;


