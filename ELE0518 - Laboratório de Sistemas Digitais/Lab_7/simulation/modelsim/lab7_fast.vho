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
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "05/12/2019 12:26:03"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	lab7 IS
    PORT (
	h : IN std_logic;
	clk : IN std_logic;
	rst : IN std_logic;
	count : BUFFER std_logic_vector(1 DOWNTO 0);
	a : OUT std_logic_vector(4 DOWNTO 0)
	);
END lab7;

-- Design Ports Information
-- count[0]	=>  Location: PIN_L9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- count[1]	=>  Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- a[0]	=>  Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- a[1]	=>  Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- a[2]	=>  Location: PIN_L10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- a[3]	=>  Location: PIN_L4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- a[4]	=>  Location: PIN_L6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- h	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- rst	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF lab7 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_h : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_count : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_a : std_logic_vector(4 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rst~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \actual_s.s5~regout\ : std_logic;
SIGNAL \actual_s.s4~regout\ : std_logic;
SIGNAL \actual_s.s3~regout\ : std_logic;
SIGNAL \actual_s.s2~regout\ : std_logic;
SIGNAL \next_s.s5~regout\ : std_logic;
SIGNAL \next_s.s4~regout\ : std_logic;
SIGNAL \next_s.s3~regout\ : std_logic;
SIGNAL \next_s.s2~regout\ : std_logic;
SIGNAL \next_s.s5~1_combout\ : std_logic;
SIGNAL \next_s.s4~1_combout\ : std_logic;
SIGNAL \next_s.s3~1_combout\ : std_logic;
SIGNAL \next_s.s2~1_combout\ : std_logic;
SIGNAL \actual_s.s4~feeder_combout\ : std_logic;
SIGNAL \actual_s.s3~feeder_combout\ : std_logic;
SIGNAL \actual_s.s2~feeder_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \h~combout\ : std_logic;
SIGNAL \count[1]~1_combout\ : std_logic;
SIGNAL \rst~combout\ : std_logic;
SIGNAL \rst~clkctrl_outclk\ : std_logic;
SIGNAL \count[1]~reg0_regout\ : std_logic;
SIGNAL \count[0]~0_combout\ : std_logic;
SIGNAL \count[0]~reg0_regout\ : std_logic;
SIGNAL \state_register~0_combout\ : std_logic;
SIGNAL \next_s.s6~regout\ : std_logic;
SIGNAL \actual_s.s6~regout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \a~6_combout\ : std_logic;
SIGNAL \a[0]~reg0_regout\ : std_logic;
SIGNAL \a~7_combout\ : std_logic;
SIGNAL \a[1]~reg0_regout\ : std_logic;
SIGNAL \a~8_combout\ : std_logic;
SIGNAL \a[2]~reg0_regout\ : std_logic;
SIGNAL \a~9_combout\ : std_logic;
SIGNAL \a[3]~reg0_regout\ : std_logic;
SIGNAL \next_s~10_combout\ : std_logic;
SIGNAL \next_s.s0~regout\ : std_logic;
SIGNAL \actual_s.s0~feeder_combout\ : std_logic;
SIGNAL \actual_s.s0~regout\ : std_logic;
SIGNAL \next_s.s1~1_combout\ : std_logic;
SIGNAL \next_s.s1~regout\ : std_logic;
SIGNAL \actual_s.s1~feeder_combout\ : std_logic;
SIGNAL \actual_s.s1~regout\ : std_logic;
SIGNAL \a~10_combout\ : std_logic;
SIGNAL \a[4]~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_rst~combout\ : std_logic;

BEGIN

ww_h <= h;
ww_clk <= clk;
ww_rst <= rst;
count <= ww_count;
a <= ww_a;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

\rst~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \rst~combout\);
\ALT_INV_rst~combout\ <= NOT \rst~combout\;

-- Location: LCFF_X1_Y24_N27
\actual_s.s5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \next_s.s5~regout\,
	aclr => \rst~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \actual_s.s5~regout\);

-- Location: LCFF_X1_Y24_N21
\actual_s.s4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \actual_s.s4~feeder_combout\,
	aclr => \rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \actual_s.s4~regout\);

-- Location: LCFF_X1_Y24_N17
\actual_s.s3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \actual_s.s3~feeder_combout\,
	aclr => \rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \actual_s.s3~regout\);

-- Location: LCFF_X2_Y24_N17
\actual_s.s2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \actual_s.s2~feeder_combout\,
	aclr => \rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \actual_s.s2~regout\);

-- Location: LCFF_X1_Y24_N5
\next_s.s5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \next_s.s5~1_combout\,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \next_s.s5~regout\);

-- Location: LCFF_X1_Y24_N19
\next_s.s4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \next_s.s4~1_combout\,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \next_s.s4~regout\);

-- Location: LCFF_X2_Y24_N25
\next_s.s3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \next_s.s3~1_combout\,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \next_s.s3~regout\);

-- Location: LCFF_X2_Y24_N19
\next_s.s2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \next_s.s2~1_combout\,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \next_s.s2~regout\);

-- Location: LCCOMB_X1_Y24_N4
\next_s.s5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \next_s.s5~1_combout\ = (\actual_s.s4~regout\ & (\h~combout\ & ((!\count[1]~reg0_regout\) # (!\count[0]~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actual_s.s4~regout\,
	datab => \h~combout\,
	datac => \count[0]~reg0_regout\,
	datad => \count[1]~reg0_regout\,
	combout => \next_s.s5~1_combout\);

-- Location: LCCOMB_X1_Y24_N18
\next_s.s4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \next_s.s4~1_combout\ = (\actual_s.s3~regout\ & (\h~combout\ & ((!\count[1]~reg0_regout\) # (!\count[0]~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actual_s.s3~regout\,
	datab => \h~combout\,
	datac => \count[0]~reg0_regout\,
	datad => \count[1]~reg0_regout\,
	combout => \next_s.s4~1_combout\);

-- Location: LCCOMB_X2_Y24_N24
\next_s.s3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \next_s.s3~1_combout\ = (\h~combout\ & (\actual_s.s2~regout\ & ((!\count[1]~reg0_regout\) # (!\count[0]~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~reg0_regout\,
	datab => \h~combout\,
	datac => \actual_s.s2~regout\,
	datad => \count[1]~reg0_regout\,
	combout => \next_s.s3~1_combout\);

-- Location: LCCOMB_X2_Y24_N18
\next_s.s2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \next_s.s2~1_combout\ = (\h~combout\ & (\actual_s.s1~regout\ & ((!\count[1]~reg0_regout\) # (!\count[0]~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~reg0_regout\,
	datab => \h~combout\,
	datac => \actual_s.s1~regout\,
	datad => \count[1]~reg0_regout\,
	combout => \next_s.s2~1_combout\);

-- Location: LCCOMB_X1_Y24_N20
\actual_s.s4~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \actual_s.s4~feeder_combout\ = \next_s.s4~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_s.s4~regout\,
	combout => \actual_s.s4~feeder_combout\);

-- Location: LCCOMB_X1_Y24_N16
\actual_s.s3~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \actual_s.s3~feeder_combout\ = \next_s.s3~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_s.s3~regout\,
	combout => \actual_s.s3~feeder_combout\);

-- Location: LCCOMB_X2_Y24_N16
\actual_s.s2~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \actual_s.s2~feeder_combout\ = \next_s.s2~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_s.s2~regout\,
	combout => \actual_s.s2~feeder_combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G3
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\h~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_h,
	combout => \h~combout\);

-- Location: LCCOMB_X1_Y24_N24
\count[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \count[1]~1_combout\ = (\h~combout\ & ((\count[0]~reg0_regout\) # (\count[1]~reg0_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \count[0]~reg0_regout\,
	datac => \count[1]~reg0_regout\,
	datad => \h~combout\,
	combout => \count[1]~1_combout\);

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rst~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_rst,
	combout => \rst~combout\);

-- Location: CLKCTRL_G1
\rst~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst~clkctrl_outclk\);

-- Location: LCFF_X1_Y24_N25
\count[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count[1]~1_combout\,
	aclr => \rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \count[1]~reg0_regout\);

-- Location: LCCOMB_X1_Y24_N2
\count[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \count[0]~0_combout\ = (\h~combout\ & ((\count[1]~reg0_regout\) # (!\count[0]~reg0_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \h~combout\,
	datac => \count[0]~reg0_regout\,
	datad => \count[1]~reg0_regout\,
	combout => \count[0]~0_combout\);

-- Location: LCFF_X1_Y24_N3
\count[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \count[0]~0_combout\,
	aclr => \rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \count[0]~reg0_regout\);

-- Location: LCCOMB_X1_Y24_N12
\state_register~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \state_register~0_combout\ = (\h~combout\ & (\count[0]~reg0_regout\ & \count[1]~reg0_regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \h~combout\,
	datac => \count[0]~reg0_regout\,
	datad => \count[1]~reg0_regout\,
	combout => \state_register~0_combout\);

-- Location: LCFF_X1_Y24_N13
\next_s.s6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \state_register~0_combout\,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \next_s.s6~regout\);

-- Location: LCFF_X1_Y24_N9
\actual_s.s6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \next_s.s6~regout\,
	aclr => \rst~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \actual_s.s6~regout\);

-- Location: LCCOMB_X1_Y24_N26
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\count[1]~reg0_regout\ & \count[0]~reg0_regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[1]~reg0_regout\,
	datad => \count[0]~reg0_regout\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X1_Y24_N14
\a~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \a~6_combout\ = (\actual_s.s5~regout\) # ((\Equal0~0_combout\) # ((!\h~combout\ & \actual_s.s6~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actual_s.s5~regout\,
	datab => \h~combout\,
	datac => \actual_s.s6~regout\,
	datad => \Equal0~0_combout\,
	combout => \a~6_combout\);

-- Location: LCFF_X1_Y24_N15
\a[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \a~6_combout\,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \a[0]~reg0_regout\);

-- Location: LCCOMB_X1_Y24_N28
\a~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \a~7_combout\ = (\actual_s.s4~regout\) # ((\Equal0~0_combout\) # ((!\h~combout\ & \actual_s.s6~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actual_s.s4~regout\,
	datab => \h~combout\,
	datac => \actual_s.s6~regout\,
	datad => \Equal0~0_combout\,
	combout => \a~7_combout\);

-- Location: LCFF_X1_Y24_N29
\a[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \a~7_combout\,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \a[1]~reg0_regout\);

-- Location: LCCOMB_X1_Y24_N22
\a~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \a~8_combout\ = (\actual_s.s3~regout\) # ((\Equal0~0_combout\) # ((!\h~combout\ & \actual_s.s6~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actual_s.s3~regout\,
	datab => \h~combout\,
	datac => \actual_s.s6~regout\,
	datad => \Equal0~0_combout\,
	combout => \a~8_combout\);

-- Location: LCFF_X1_Y24_N23
\a[2]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \a~8_combout\,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \a[2]~reg0_regout\);

-- Location: LCCOMB_X1_Y24_N10
\a~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \a~9_combout\ = (\actual_s.s2~regout\) # ((\Equal0~0_combout\) # ((!\h~combout\ & \actual_s.s6~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actual_s.s2~regout\,
	datab => \h~combout\,
	datac => \actual_s.s6~regout\,
	datad => \Equal0~0_combout\,
	combout => \a~9_combout\);

-- Location: LCFF_X1_Y24_N11
\a[3]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \a~9_combout\,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \a[3]~reg0_regout\);

-- Location: LCCOMB_X1_Y24_N6
\next_s~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \next_s~10_combout\ = (\h~combout\ & ((\Equal0~0_combout\) # ((!\actual_s.s5~regout\ & !\actual_s.s6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actual_s.s5~regout\,
	datab => \h~combout\,
	datac => \actual_s.s6~regout\,
	datad => \Equal0~0_combout\,
	combout => \next_s~10_combout\);

-- Location: LCFF_X1_Y24_N7
\next_s.s0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \next_s~10_combout\,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \next_s.s0~regout\);

-- Location: LCCOMB_X1_Y24_N30
\actual_s.s0~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \actual_s.s0~feeder_combout\ = \next_s.s0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_s.s0~regout\,
	combout => \actual_s.s0~feeder_combout\);

-- Location: LCFF_X1_Y24_N31
\actual_s.s0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \actual_s.s0~feeder_combout\,
	aclr => \rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \actual_s.s0~regout\);

-- Location: LCCOMB_X2_Y24_N0
\next_s.s1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \next_s.s1~1_combout\ = (\h~combout\ & (!\actual_s.s0~regout\ & ((!\count[1]~reg0_regout\) # (!\count[0]~reg0_regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~reg0_regout\,
	datab => \h~combout\,
	datac => \actual_s.s0~regout\,
	datad => \count[1]~reg0_regout\,
	combout => \next_s.s1~1_combout\);

-- Location: LCFF_X2_Y24_N1
\next_s.s1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \next_s.s1~1_combout\,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \next_s.s1~regout\);

-- Location: LCCOMB_X2_Y24_N14
\actual_s.s1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \actual_s.s1~feeder_combout\ = \next_s.s1~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_s.s1~regout\,
	combout => \actual_s.s1~feeder_combout\);

-- Location: LCFF_X2_Y24_N15
\actual_s.s1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \actual_s.s1~feeder_combout\,
	aclr => \rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \actual_s.s1~regout\);

-- Location: LCCOMB_X1_Y24_N0
\a~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \a~10_combout\ = (\actual_s.s1~regout\) # ((\Equal0~0_combout\) # ((!\h~combout\ & \actual_s.s6~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \h~combout\,
	datab => \actual_s.s6~regout\,
	datac => \actual_s.s1~regout\,
	datad => \Equal0~0_combout\,
	combout => \a~10_combout\);

-- Location: LCFF_X1_Y24_N1
\a[4]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \a~10_combout\,
	ena => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \a[4]~reg0_regout\);

-- Location: PIN_L9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\count[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \count[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_count(0));

-- Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\count[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \count[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_count(1));

-- Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\a[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \a[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_a(0));

-- Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\a[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \a[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_a(1));

-- Location: PIN_L10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\a[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \a[2]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_a(2));

-- Location: PIN_L4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\a[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \a[3]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_a(3));

-- Location: PIN_L6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\a[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \a[4]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_a(4));
END structure;


