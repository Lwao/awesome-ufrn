-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "05/01/2019 15:03:45"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	reg_mult IS
    PORT (
	Q3 : OUT std_logic;
	LD_CTRL : IN std_logic;
	SR_CTRL : IN std_logic;
	SL_CTRL : IN std_logic;
	I3 : IN std_logic;
	I2 : IN std_logic;
	I1 : IN std_logic;
	I0 : IN std_logic;
	SL_IN : IN std_logic;
	SR_IN : IN std_logic;
	CLOCK : IN std_logic;
	\VCC\ : IN std_logic;
	Q2 : OUT std_logic;
	Q1 : OUT std_logic;
	Q0 : OUT std_logic
	);
END reg_mult;

-- Design Ports Information
-- Q3	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q2	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q1	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q0	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SR_IN	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SR_CTRL	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SL_CTRL	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LD_CTRL	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I3	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VCC	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I2	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I1	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I0	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SL_IN	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF reg_mult IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Q3 : std_logic;
SIGNAL ww_LD_CTRL : std_logic;
SIGNAL ww_SR_CTRL : std_logic;
SIGNAL ww_SL_CTRL : std_logic;
SIGNAL ww_I3 : std_logic;
SIGNAL ww_I2 : std_logic;
SIGNAL ww_I1 : std_logic;
SIGNAL ww_I0 : std_logic;
SIGNAL ww_SL_IN : std_logic;
SIGNAL ww_SR_IN : std_logic;
SIGNAL ww_CLOCK : std_logic;
SIGNAL \ww_VCC\ : std_logic;
SIGNAL ww_Q2 : std_logic;
SIGNAL ww_Q1 : std_logic;
SIGNAL ww_Q0 : std_logic;
SIGNAL \VCC~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SL_CTRL~input_o\ : std_logic;
SIGNAL \I1~input_o\ : std_logic;
SIGNAL \Q3~output_o\ : std_logic;
SIGNAL \Q2~output_o\ : std_logic;
SIGNAL \Q1~output_o\ : std_logic;
SIGNAL \Q0~output_o\ : std_logic;
SIGNAL \CLOCK~input_o\ : std_logic;
SIGNAL \CLOCK~inputclkctrl_outclk\ : std_logic;
SIGNAL \LD_CTRL~input_o\ : std_logic;
SIGNAL \SR_CTRL~input_o\ : std_logic;
SIGNAL \inst4|inst5~0_combout\ : std_logic;
SIGNAL \SR_IN~input_o\ : std_logic;
SIGNAL \I3~input_o\ : std_logic;
SIGNAL \inst|inst|inst7~0_combout\ : std_logic;
SIGNAL \inst|inst|inst7~1_combout\ : std_logic;
SIGNAL \VCC~input_o\ : std_logic;
SIGNAL \VCC~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst|inst3~q\ : std_logic;
SIGNAL \I2~input_o\ : std_logic;
SIGNAL \I0~input_o\ : std_logic;
SIGNAL \SL_IN~input_o\ : std_logic;
SIGNAL \inst|inst4|inst7~0_combout\ : std_logic;
SIGNAL \inst|inst4|inst7~1_combout\ : std_logic;
SIGNAL \inst|inst8~q\ : std_logic;
SIGNAL \inst4|inst4~combout\ : std_logic;
SIGNAL \inst|inst2|inst7~0_combout\ : std_logic;
SIGNAL \inst|inst2|inst7~1_combout\ : std_logic;
SIGNAL \inst|inst7~q\ : std_logic;
SIGNAL \inst|inst1|inst7~0_combout\ : std_logic;
SIGNAL \inst|inst1|inst7~1_combout\ : std_logic;
SIGNAL \inst|inst6~q\ : std_logic;

BEGIN

Q3 <= ww_Q3;
ww_LD_CTRL <= LD_CTRL;
ww_SR_CTRL <= SR_CTRL;
ww_SL_CTRL <= SL_CTRL;
ww_I3 <= I3;
ww_I2 <= I2;
ww_I1 <= I1;
ww_I0 <= I0;
ww_SL_IN <= SL_IN;
ww_SR_IN <= SR_IN;
ww_CLOCK <= CLOCK;
\ww_VCC\ <= \VCC\;
Q2 <= ww_Q2;
Q1 <= ww_Q1;
Q0 <= ww_Q0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\VCC~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \VCC~input_o\);

\CLOCK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK~input_o\);

-- Location: IOIBUF_X33_Y24_N1
\SL_CTRL~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SL_CTRL,
	o => \SL_CTRL~input_o\);

-- Location: IOIBUF_X33_Y28_N8
\I1~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I1,
	o => \I1~input_o\);

-- Location: IOOBUF_X33_Y24_N9
\Q3~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst3~q\,
	devoe => ww_devoe,
	o => \Q3~output_o\);

-- Location: IOOBUF_X33_Y15_N9
\Q2~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst6~q\,
	devoe => ww_devoe,
	o => \Q2~output_o\);

-- Location: IOOBUF_X33_Y25_N2
\Q1~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst7~q\,
	devoe => ww_devoe,
	o => \Q1~output_o\);

-- Location: IOOBUF_X31_Y31_N2
\Q0~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst8~q\,
	devoe => ww_devoe,
	o => \Q0~output_o\);

-- Location: IOIBUF_X16_Y0_N15
\CLOCK~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK,
	o => \CLOCK~input_o\);

-- Location: CLKCTRL_G17
\CLOCK~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK~inputclkctrl_outclk\);

-- Location: IOIBUF_X33_Y15_N1
\LD_CTRL~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_LD_CTRL,
	o => \LD_CTRL~input_o\);

-- Location: IOIBUF_X33_Y27_N1
\SR_CTRL~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SR_CTRL,
	o => \SR_CTRL~input_o\);

-- Location: LCCOMB_X32_Y24_N28
\inst4|inst5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst4|inst5~0_combout\ = (!\LD_CTRL~input_o\ & ((\SL_CTRL~input_o\) # (\SR_CTRL~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SL_CTRL~input_o\,
	datac => \LD_CTRL~input_o\,
	datad => \SR_CTRL~input_o\,
	combout => \inst4|inst5~0_combout\);

-- Location: IOIBUF_X33_Y25_N8
\SR_IN~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SR_IN,
	o => \SR_IN~input_o\);

-- Location: IOIBUF_X33_Y28_N1
\I3~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I3,
	o => \I3~input_o\);

-- Location: LCCOMB_X32_Y24_N12
\inst|inst|inst7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst|inst7~0_combout\ = (\inst4|inst4~combout\ & ((\inst4|inst5~0_combout\) # ((\I3~input_o\)))) # (!\inst4|inst4~combout\ & (!\inst4|inst5~0_combout\ & ((\inst|inst3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst4~combout\,
	datab => \inst4|inst5~0_combout\,
	datac => \I3~input_o\,
	datad => \inst|inst3~q\,
	combout => \inst|inst|inst7~0_combout\);

-- Location: LCCOMB_X32_Y24_N24
\inst|inst|inst7~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst|inst7~1_combout\ = (\inst4|inst5~0_combout\ & ((\inst|inst|inst7~0_combout\ & (\inst|inst6~q\)) # (!\inst|inst|inst7~0_combout\ & ((\SR_IN~input_o\))))) # (!\inst4|inst5~0_combout\ & (((\inst|inst|inst7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst6~q\,
	datab => \inst4|inst5~0_combout\,
	datac => \SR_IN~input_o\,
	datad => \inst|inst|inst7~0_combout\,
	combout => \inst|inst|inst7~1_combout\);

-- Location: IOIBUF_X16_Y0_N22
\VCC~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_VCC\,
	o => \VCC~input_o\);

-- Location: CLKCTRL_G19
\VCC~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \VCC~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \VCC~inputclkctrl_outclk\);

-- Location: FF_X32_Y24_N25
\inst|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \inst|inst|inst7~1_combout\,
	clrn => \VCC~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst3~q\);

-- Location: IOIBUF_X33_Y27_N8
\I2~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I2,
	o => \I2~input_o\);

-- Location: IOIBUF_X33_Y22_N8
\I0~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I0,
	o => \I0~input_o\);

-- Location: IOIBUF_X33_Y22_N1
\SL_IN~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SL_IN,
	o => \SL_IN~input_o\);

-- Location: LCCOMB_X32_Y24_N6
\inst|inst4|inst7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst4|inst7~0_combout\ = (\inst4|inst4~combout\ & (((\inst4|inst5~0_combout\)))) # (!\inst4|inst4~combout\ & ((\inst4|inst5~0_combout\ & (\inst|inst7~q\)) # (!\inst4|inst5~0_combout\ & ((\inst|inst8~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst4~combout\,
	datab => \inst|inst7~q\,
	datac => \inst4|inst5~0_combout\,
	datad => \inst|inst8~q\,
	combout => \inst|inst4|inst7~0_combout\);

-- Location: LCCOMB_X32_Y24_N18
\inst|inst4|inst7~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst4|inst7~1_combout\ = (\inst4|inst4~combout\ & ((\inst|inst4|inst7~0_combout\ & ((\SL_IN~input_o\))) # (!\inst|inst4|inst7~0_combout\ & (\I0~input_o\)))) # (!\inst4|inst4~combout\ & (((\inst|inst4|inst7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst4~combout\,
	datab => \I0~input_o\,
	datac => \SL_IN~input_o\,
	datad => \inst|inst4|inst7~0_combout\,
	combout => \inst|inst4|inst7~1_combout\);

-- Location: FF_X32_Y24_N19
\inst|inst8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \inst|inst4|inst7~1_combout\,
	clrn => \VCC~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst8~q\);

-- Location: LCCOMB_X32_Y24_N22
\inst4|inst4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst4|inst4~combout\ = (\LD_CTRL~input_o\) # ((\SL_CTRL~input_o\ & !\SR_CTRL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SL_CTRL~input_o\,
	datac => \LD_CTRL~input_o\,
	datad => \SR_CTRL~input_o\,
	combout => \inst4|inst4~combout\);

-- Location: LCCOMB_X32_Y24_N20
\inst|inst2|inst7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst2|inst7~0_combout\ = (\inst4|inst5~0_combout\ & (((\inst4|inst4~combout\)))) # (!\inst4|inst5~0_combout\ & ((\inst4|inst4~combout\ & (\I1~input_o\)) # (!\inst4|inst4~combout\ & ((\inst|inst7~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I1~input_o\,
	datab => \inst4|inst5~0_combout\,
	datac => \inst4|inst4~combout\,
	datad => \inst|inst7~q\,
	combout => \inst|inst2|inst7~0_combout\);

-- Location: LCCOMB_X32_Y24_N16
\inst|inst2|inst7~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst2|inst7~1_combout\ = (\inst4|inst5~0_combout\ & ((\inst|inst2|inst7~0_combout\ & ((\inst|inst8~q\))) # (!\inst|inst2|inst7~0_combout\ & (\inst|inst6~q\)))) # (!\inst4|inst5~0_combout\ & (((\inst|inst2|inst7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst6~q\,
	datab => \inst4|inst5~0_combout\,
	datac => \inst|inst8~q\,
	datad => \inst|inst2|inst7~0_combout\,
	combout => \inst|inst2|inst7~1_combout\);

-- Location: FF_X32_Y24_N17
\inst|inst7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \inst|inst2|inst7~1_combout\,
	clrn => \VCC~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst7~q\);

-- Location: LCCOMB_X32_Y24_N2
\inst|inst1|inst7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst1|inst7~0_combout\ = (\inst4|inst4~combout\ & (\inst4|inst5~0_combout\)) # (!\inst4|inst4~combout\ & ((\inst4|inst5~0_combout\ & (\inst|inst3~q\)) # (!\inst4|inst5~0_combout\ & ((\inst|inst6~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst4~combout\,
	datab => \inst4|inst5~0_combout\,
	datac => \inst|inst3~q\,
	datad => \inst|inst6~q\,
	combout => \inst|inst1|inst7~0_combout\);

-- Location: LCCOMB_X32_Y24_N10
\inst|inst1|inst7~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|inst1|inst7~1_combout\ = (\inst4|inst4~combout\ & ((\inst|inst1|inst7~0_combout\ & ((\inst|inst7~q\))) # (!\inst|inst1|inst7~0_combout\ & (\I2~input_o\)))) # (!\inst4|inst4~combout\ & (((\inst|inst1|inst7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst4~combout\,
	datab => \I2~input_o\,
	datac => \inst|inst7~q\,
	datad => \inst|inst1|inst7~0_combout\,
	combout => \inst|inst1|inst7~1_combout\);

-- Location: FF_X32_Y24_N11
\inst|inst6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \inst|inst1|inst7~1_combout\,
	clrn => \VCC~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst6~q\);

ww_Q3 <= \Q3~output_o\;

ww_Q2 <= \Q2~output_o\;

ww_Q1 <= \Q1~output_o\;

ww_Q0 <= \Q0~output_o\;
END structure;


