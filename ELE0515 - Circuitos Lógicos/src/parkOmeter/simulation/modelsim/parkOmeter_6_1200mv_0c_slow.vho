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

-- DATE "06/20/2019 21:33:35"

-- 
-- Device: Altera EP4CGX22CF19C6 Package FBGA324
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

ENTITY 	parkOmeter IS
    PORT (
	b : IN std_logic;
	c : IN std_logic;
	f : IN std_logic;
	rst : IN std_logic;
	d : IN std_logic;
	A : IN std_logic_vector(2 DOWNTO 0);
	clk : IN std_logic;
	ts : BUFFER std_logic_vector(5 DOWNTO 0);
	go : BUFFER std_logic_vector(5 DOWNTO 0);
	ch : BUFFER std_logic_vector(5 DOWNTO 0);
	td : BUFFER std_logic_vector(5 DOWNTO 0);
	tgo : BUFFER std_logic_vector(7 DOWNTO 0);
	tch : BUFFER std_logic_vector(7 DOWNTO 0);
	tt : BUFFER std_logic_vector(3 DOWNTO 0)
	);
END parkOmeter;

-- Design Ports Information
-- ts[0]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ts[1]	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ts[2]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ts[3]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ts[4]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ts[5]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- go[0]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- go[1]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- go[2]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- go[3]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- go[4]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- go[5]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ch[0]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ch[1]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ch[2]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ch[3]	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ch[4]	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ch[5]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- td[0]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- td[1]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- td[2]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- td[3]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- td[4]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- td[5]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tgo[0]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tgo[1]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tgo[2]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tgo[3]	=>  Location: PIN_N17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tgo[4]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tgo[5]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tgo[6]	=>  Location: PIN_N18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tgo[7]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tch[0]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tch[1]	=>  Location: PIN_M17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tch[2]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tch[3]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tch[4]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tch[5]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tch[6]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tch[7]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tt[0]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tt[1]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tt[2]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tt[3]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- f	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF parkOmeter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_b : std_logic;
SIGNAL ww_c : std_logic;
SIGNAL ww_f : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_d : std_logic;
SIGNAL ww_A : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_ts : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_go : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_ch : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_td : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_tgo : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_tch : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_tt : std_logic_vector(3 DOWNTO 0);
SIGNAL \rst~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \count[3]~39_combout\ : std_logic;
SIGNAL \count[6]~45_combout\ : std_logic;
SIGNAL \count[15]~63_combout\ : std_logic;
SIGNAL \count[27]~88\ : std_logic;
SIGNAL \count[28]~89_combout\ : std_logic;
SIGNAL \count[28]~90\ : std_logic;
SIGNAL \count[29]~91_combout\ : std_logic;
SIGNAL \count[29]~92\ : std_logic;
SIGNAL \count[30]~93_combout\ : std_logic;
SIGNAL \count[30]~94\ : std_logic;
SIGNAL \count[31]~95_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Equal1~9_combout\ : std_logic;
SIGNAL \Selector19~1_combout\ : std_logic;
SIGNAL \Selector18~2_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Selector25~0_combout\ : std_logic;
SIGNAL \ts[0]~output_o\ : std_logic;
SIGNAL \ts[1]~output_o\ : std_logic;
SIGNAL \ts[2]~output_o\ : std_logic;
SIGNAL \ts[3]~output_o\ : std_logic;
SIGNAL \ts[4]~output_o\ : std_logic;
SIGNAL \ts[5]~output_o\ : std_logic;
SIGNAL \go[0]~output_o\ : std_logic;
SIGNAL \go[1]~output_o\ : std_logic;
SIGNAL \go[2]~output_o\ : std_logic;
SIGNAL \go[3]~output_o\ : std_logic;
SIGNAL \go[4]~output_o\ : std_logic;
SIGNAL \go[5]~output_o\ : std_logic;
SIGNAL \ch[0]~output_o\ : std_logic;
SIGNAL \ch[1]~output_o\ : std_logic;
SIGNAL \ch[2]~output_o\ : std_logic;
SIGNAL \ch[3]~output_o\ : std_logic;
SIGNAL \ch[4]~output_o\ : std_logic;
SIGNAL \ch[5]~output_o\ : std_logic;
SIGNAL \td[0]~output_o\ : std_logic;
SIGNAL \td[1]~output_o\ : std_logic;
SIGNAL \td[2]~output_o\ : std_logic;
SIGNAL \td[3]~output_o\ : std_logic;
SIGNAL \td[4]~output_o\ : std_logic;
SIGNAL \td[5]~output_o\ : std_logic;
SIGNAL \tgo[0]~output_o\ : std_logic;
SIGNAL \tgo[1]~output_o\ : std_logic;
SIGNAL \tgo[2]~output_o\ : std_logic;
SIGNAL \tgo[3]~output_o\ : std_logic;
SIGNAL \tgo[4]~output_o\ : std_logic;
SIGNAL \tgo[5]~output_o\ : std_logic;
SIGNAL \tgo[6]~output_o\ : std_logic;
SIGNAL \tgo[7]~output_o\ : std_logic;
SIGNAL \tch[0]~output_o\ : std_logic;
SIGNAL \tch[1]~output_o\ : std_logic;
SIGNAL \tch[2]~output_o\ : std_logic;
SIGNAL \tch[3]~output_o\ : std_logic;
SIGNAL \tch[4]~output_o\ : std_logic;
SIGNAL \tch[5]~output_o\ : std_logic;
SIGNAL \tch[6]~output_o\ : std_logic;
SIGNAL \tch[7]~output_o\ : std_logic;
SIGNAL \tt[0]~output_o\ : std_logic;
SIGNAL \tt[1]~output_o\ : std_logic;
SIGNAL \tt[2]~output_o\ : std_logic;
SIGNAL \tt[3]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \ts[0]~6_combout\ : std_logic;
SIGNAL \c~input_o\ : std_logic;
SIGNAL \d~input_o\ : std_logic;
SIGNAL \Selector26~0_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \next_s.end_park~q\ : std_logic;
SIGNAL \rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \actual_s.end_park~q\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \ts[0]~7\ : std_logic;
SIGNAL \ts[1]~9\ : std_logic;
SIGNAL \ts[2]~10_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \ts[2]~reg0_q\ : std_logic;
SIGNAL \ts[2]~11\ : std_logic;
SIGNAL \ts[3]~13\ : std_logic;
SIGNAL \ts[4]~14_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \ts[4]~reg0_q\ : std_logic;
SIGNAL \ts[4]~15\ : std_logic;
SIGNAL \ts[5]~16_combout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \ts[5]~reg0_q\ : std_logic;
SIGNAL \tt[1]~0_combout\ : std_logic;
SIGNAL \tt[1]~1_combout\ : std_logic;
SIGNAL \Selector21~0_combout\ : std_logic;
SIGNAL \count[0]~32_combout\ : std_logic;
SIGNAL \count[0]~36_combout\ : std_logic;
SIGNAL \count[0]~33\ : std_logic;
SIGNAL \count[1]~34_combout\ : std_logic;
SIGNAL \count[1]~35\ : std_logic;
SIGNAL \count[2]~37_combout\ : std_logic;
SIGNAL \count[2]~38\ : std_logic;
SIGNAL \count[3]~40\ : std_logic;
SIGNAL \count[4]~41_combout\ : std_logic;
SIGNAL \count[4]~42\ : std_logic;
SIGNAL \count[5]~44\ : std_logic;
SIGNAL \count[6]~46\ : std_logic;
SIGNAL \count[7]~47_combout\ : std_logic;
SIGNAL \count[7]~48\ : std_logic;
SIGNAL \count[8]~49_combout\ : std_logic;
SIGNAL \count[8]~50\ : std_logic;
SIGNAL \count[9]~51_combout\ : std_logic;
SIGNAL \count[9]~52\ : std_logic;
SIGNAL \count[10]~53_combout\ : std_logic;
SIGNAL \count[10]~54\ : std_logic;
SIGNAL \count[11]~56\ : std_logic;
SIGNAL \count[12]~57_combout\ : std_logic;
SIGNAL \count[12]~58\ : std_logic;
SIGNAL \count[13]~60\ : std_logic;
SIGNAL \count[14]~61_combout\ : std_logic;
SIGNAL \count[14]~62\ : std_logic;
SIGNAL \count[15]~64\ : std_logic;
SIGNAL \count[16]~65_combout\ : std_logic;
SIGNAL \count[16]~66\ : std_logic;
SIGNAL \count[17]~67_combout\ : std_logic;
SIGNAL \count[17]~68\ : std_logic;
SIGNAL \count[18]~69_combout\ : std_logic;
SIGNAL \count[18]~70\ : std_logic;
SIGNAL \count[19]~72\ : std_logic;
SIGNAL \count[20]~73_combout\ : std_logic;
SIGNAL \count[20]~74\ : std_logic;
SIGNAL \count[21]~76\ : std_logic;
SIGNAL \count[22]~78\ : std_logic;
SIGNAL \count[23]~79_combout\ : std_logic;
SIGNAL \count[23]~80\ : std_logic;
SIGNAL \count[24]~81_combout\ : std_logic;
SIGNAL \count[24]~82\ : std_logic;
SIGNAL \count[25]~83_combout\ : std_logic;
SIGNAL \count[25]~84\ : std_logic;
SIGNAL \count[26]~85_combout\ : std_logic;
SIGNAL \count[26]~86\ : std_logic;
SIGNAL \count[27]~87_combout\ : std_logic;
SIGNAL \Equal1~8_combout\ : std_logic;
SIGNAL \count[11]~55_combout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \count[13]~59_combout\ : std_logic;
SIGNAL \Equal1~3_combout\ : std_logic;
SIGNAL \count[5]~43_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \Equal1~4_combout\ : std_logic;
SIGNAL \count[21]~75_combout\ : std_logic;
SIGNAL \count[22]~77_combout\ : std_logic;
SIGNAL \Equal1~6_combout\ : std_logic;
SIGNAL \count[19]~71_combout\ : std_logic;
SIGNAL \Equal1~5_combout\ : std_logic;
SIGNAL \Equal1~7_combout\ : std_logic;
SIGNAL \Equal1~10_combout\ : std_logic;
SIGNAL \Selector21~1_combout\ : std_logic;
SIGNAL \Selector21~2_combout\ : std_logic;
SIGNAL \tt[0]~reg0_q\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \Selector20~4_combout\ : std_logic;
SIGNAL \Selector20~5_combout\ : std_logic;
SIGNAL \tt[1]~2_combout\ : std_logic;
SIGNAL \tt[1]~3_combout\ : std_logic;
SIGNAL \tt[1]~reg0_q\ : std_logic;
SIGNAL \Selector19~0_combout\ : std_logic;
SIGNAL \Selector19~2_combout\ : std_logic;
SIGNAL \Selector18~0_combout\ : std_logic;
SIGNAL \Selector18~1_combout\ : std_logic;
SIGNAL \Selector18~3_combout\ : std_logic;
SIGNAL \tt[3]~reg0_q\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \Selector25~1_combout\ : std_logic;
SIGNAL \next_s.time_count~q\ : std_logic;
SIGNAL \actual_s.time_count~feeder_combout\ : std_logic;
SIGNAL \actual_s.time_count~q\ : std_logic;
SIGNAL \f~input_o\ : std_logic;
SIGNAL \next_s.sel_type~0_combout\ : std_logic;
SIGNAL \next_s.sel_type~1_combout\ : std_logic;
SIGNAL \next_s.sel_type~q\ : std_logic;
SIGNAL \actual_s.sel_type~q\ : std_logic;
SIGNAL \Selector24~0_combout\ : std_logic;
SIGNAL \next_s.add~q\ : std_logic;
SIGNAL \actual_s.add~q\ : std_logic;
SIGNAL \b~input_o\ : std_logic;
SIGNAL \next_s.wait_b~0_combout\ : std_logic;
SIGNAL \next_s.wait_b~1_combout\ : std_logic;
SIGNAL \next_s.wait_b~q\ : std_logic;
SIGNAL \actual_s.wait_b~feeder_combout\ : std_logic;
SIGNAL \actual_s.wait_b~q\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \ts[0]~reg0_q\ : std_logic;
SIGNAL \ts[1]~8_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \ts[1]~reg0_q\ : std_logic;
SIGNAL \ts[3]~12_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \ts[3]~reg0_q\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \go[0]~reg0_q\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \go[1]~reg0_q\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \go[2]~reg0_q\ : std_logic;
SIGNAL \Selector8~1_combout\ : std_logic;
SIGNAL \go[3]~reg0_q\ : std_logic;
SIGNAL \Selector7~3_combout\ : std_logic;
SIGNAL \go[4]~reg0_q\ : std_logic;
SIGNAL \Selector17~0_combout\ : std_logic;
SIGNAL \ch[0]~reg0_q\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \ch[1]~reg0_q\ : std_logic;
SIGNAL \Selector7~2_combout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \ch[2]~reg0_q\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \ch[3]~reg0_q\ : std_logic;
SIGNAL \Selector12~1_combout\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \ch[4]~reg0_q\ : std_logic;
SIGNAL \Selector12~2_combout\ : std_logic;
SIGNAL \ch[5]~reg0_q\ : std_logic;
SIGNAL \td[0]~5_combout\ : std_logic;
SIGNAL \td[0]~reg0_q\ : std_logic;
SIGNAL \td[1]~6_combout\ : std_logic;
SIGNAL \td[1]~reg0_q\ : std_logic;
SIGNAL \td[1]~7\ : std_logic;
SIGNAL \td[2]~8_combout\ : std_logic;
SIGNAL \td[2]~reg0_q\ : std_logic;
SIGNAL \td[2]~9\ : std_logic;
SIGNAL \td[3]~10_combout\ : std_logic;
SIGNAL \td[3]~reg0_q\ : std_logic;
SIGNAL \td[3]~11\ : std_logic;
SIGNAL \td[4]~12_combout\ : std_logic;
SIGNAL \td[4]~reg0_q\ : std_logic;
SIGNAL \td[4]~13\ : std_logic;
SIGNAL \td[5]~14_combout\ : std_logic;
SIGNAL \td[5]~reg0_q\ : std_logic;
SIGNAL \tgo[0]~8_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \Equal3~1_combout\ : std_logic;
SIGNAL \tgo[0]~reg0_q\ : std_logic;
SIGNAL \tgo[0]~9\ : std_logic;
SIGNAL \tgo[1]~10_combout\ : std_logic;
SIGNAL \tgo[1]~reg0_q\ : std_logic;
SIGNAL \tgo[1]~11\ : std_logic;
SIGNAL \tgo[2]~12_combout\ : std_logic;
SIGNAL \tgo[2]~reg0_q\ : std_logic;
SIGNAL \tgo[2]~13\ : std_logic;
SIGNAL \tgo[3]~14_combout\ : std_logic;
SIGNAL \tgo[3]~reg0_q\ : std_logic;
SIGNAL \tgo[3]~15\ : std_logic;
SIGNAL \tgo[4]~16_combout\ : std_logic;
SIGNAL \tgo[4]~reg0_q\ : std_logic;
SIGNAL \tgo[4]~17\ : std_logic;
SIGNAL \tgo[5]~18_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \tgo[5]~reg0_q\ : std_logic;
SIGNAL \tgo[5]~19\ : std_logic;
SIGNAL \tgo[6]~20_combout\ : std_logic;
SIGNAL \tgo[6]~reg0_q\ : std_logic;
SIGNAL \tgo[6]~21\ : std_logic;
SIGNAL \tgo[7]~22_combout\ : std_logic;
SIGNAL \tgo[7]~reg0_q\ : std_logic;
SIGNAL \tch[0]~8_combout\ : std_logic;
SIGNAL \tch[0]~reg0_q\ : std_logic;
SIGNAL \tch[0]~9\ : std_logic;
SIGNAL \tch[1]~10_combout\ : std_logic;
SIGNAL \tch[1]~reg0_q\ : std_logic;
SIGNAL \tch[1]~11\ : std_logic;
SIGNAL \tch[2]~12_combout\ : std_logic;
SIGNAL \tch[2]~reg0_q\ : std_logic;
SIGNAL \tch[2]~13\ : std_logic;
SIGNAL \tch[3]~14_combout\ : std_logic;
SIGNAL \tch[3]~reg0_q\ : std_logic;
SIGNAL \tch[3]~15\ : std_logic;
SIGNAL \tch[4]~16_combout\ : std_logic;
SIGNAL \tch[4]~reg0_q\ : std_logic;
SIGNAL \tch[4]~17\ : std_logic;
SIGNAL \tch[5]~18_combout\ : std_logic;
SIGNAL \tch[5]~reg0_q\ : std_logic;
SIGNAL \tch[5]~19\ : std_logic;
SIGNAL \tch[6]~20_combout\ : std_logic;
SIGNAL \tch[6]~reg0_q\ : std_logic;
SIGNAL \tch[6]~21\ : std_logic;
SIGNAL \tch[7]~22_combout\ : std_logic;
SIGNAL \tch[7]~reg0_q\ : std_logic;
SIGNAL \Selector19~3_combout\ : std_logic;
SIGNAL \tt[2]~reg0_q\ : std_logic;
SIGNAL count : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \ALT_INV_actual_s.add~q\ : std_logic;

BEGIN

ww_b <= b;
ww_c <= c;
ww_f <= f;
ww_rst <= rst;
ww_d <= d;
ww_A <= A;
ww_clk <= clk;
ts <= ww_ts;
go <= ww_go;
ch <= ww_ch;
td <= ww_td;
tgo <= ww_tgo;
tch <= ww_tch;
tt <= ww_tt;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rst~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_rst~inputclkctrl_outclk\ <= NOT \rst~inputclkctrl_outclk\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\ALT_INV_actual_s.add~q\ <= NOT \actual_s.add~q\;

-- Location: FF_X31_Y29_N7
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[3]~39_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: FF_X31_Y29_N13
\count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[6]~45_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(6));

-- Location: FF_X31_Y29_N31
\count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[15]~63_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(15));

-- Location: FF_X31_Y28_N25
\count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[28]~89_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(28));

-- Location: FF_X31_Y28_N27
\count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[29]~91_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(29));

-- Location: FF_X31_Y28_N29
\count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[30]~93_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(30));

-- Location: FF_X31_Y28_N31
\count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[31]~95_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(31));

-- Location: LCCOMB_X31_Y29_N6
\count[3]~39\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[3]~39_combout\ = (count(3) & (!\count[2]~38\)) # (!count(3) & ((\count[2]~38\) # (GND)))
-- \count[3]~40\ = CARRY((!\count[2]~38\) # (!count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(3),
	datad => VCC,
	cin => \count[2]~38\,
	combout => \count[3]~39_combout\,
	cout => \count[3]~40\);

-- Location: LCCOMB_X31_Y29_N12
\count[6]~45\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[6]~45_combout\ = (count(6) & (\count[5]~44\ $ (GND))) # (!count(6) & (!\count[5]~44\ & VCC))
-- \count[6]~46\ = CARRY((count(6) & !\count[5]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(6),
	datad => VCC,
	cin => \count[5]~44\,
	combout => \count[6]~45_combout\,
	cout => \count[6]~46\);

-- Location: LCCOMB_X31_Y29_N30
\count[15]~63\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[15]~63_combout\ = (count(15) & (!\count[14]~62\)) # (!count(15) & ((\count[14]~62\) # (GND)))
-- \count[15]~64\ = CARRY((!\count[14]~62\) # (!count(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(15),
	datad => VCC,
	cin => \count[14]~62\,
	combout => \count[15]~63_combout\,
	cout => \count[15]~64\);

-- Location: LCCOMB_X31_Y28_N22
\count[27]~87\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[27]~87_combout\ = (count(27) & (!\count[26]~86\)) # (!count(27) & ((\count[26]~86\) # (GND)))
-- \count[27]~88\ = CARRY((!\count[26]~86\) # (!count(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(27),
	datad => VCC,
	cin => \count[26]~86\,
	combout => \count[27]~87_combout\,
	cout => \count[27]~88\);

-- Location: LCCOMB_X31_Y28_N24
\count[28]~89\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[28]~89_combout\ = (count(28) & (\count[27]~88\ $ (GND))) # (!count(28) & (!\count[27]~88\ & VCC))
-- \count[28]~90\ = CARRY((count(28) & !\count[27]~88\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(28),
	datad => VCC,
	cin => \count[27]~88\,
	combout => \count[28]~89_combout\,
	cout => \count[28]~90\);

-- Location: LCCOMB_X31_Y28_N26
\count[29]~91\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[29]~91_combout\ = (count(29) & (!\count[28]~90\)) # (!count(29) & ((\count[28]~90\) # (GND)))
-- \count[29]~92\ = CARRY((!\count[28]~90\) # (!count(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(29),
	datad => VCC,
	cin => \count[28]~90\,
	combout => \count[29]~91_combout\,
	cout => \count[29]~92\);

-- Location: LCCOMB_X31_Y28_N28
\count[30]~93\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[30]~93_combout\ = (count(30) & (\count[29]~92\ $ (GND))) # (!count(30) & (!\count[29]~92\ & VCC))
-- \count[30]~94\ = CARRY((count(30) & !\count[29]~92\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(30),
	datad => VCC,
	cin => \count[29]~92\,
	combout => \count[30]~93_combout\,
	cout => \count[30]~94\);

-- Location: LCCOMB_X31_Y28_N30
\count[31]~95\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[31]~95_combout\ = count(31) $ (\count[30]~94\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(31),
	cin => \count[30]~94\,
	combout => \count[31]~95_combout\);

-- Location: LCCOMB_X29_Y29_N8
\Mux3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = \tt[0]~reg0_q\ $ (((\A[1]~input_o\ & (!\A[2]~input_o\ & !\A[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[1]~input_o\,
	datab => \A[2]~input_o\,
	datac => \A[0]~input_o\,
	datad => \tt[0]~reg0_q\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X30_Y29_N26
\Equal1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (!count(2) & (!count(0) & (count(1) & !count(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(2),
	datab => count(0),
	datac => count(1),
	datad => count(3),
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X30_Y28_N30
\Equal1~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal1~9_combout\ = (!count(28) & (!count(30) & (!count(31) & !count(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(28),
	datab => count(30),
	datac => count(31),
	datad => count(29),
	combout => \Equal1~9_combout\);

-- Location: LCCOMB_X30_Y29_N22
\Selector19~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector19~1_combout\ = (\actual_s.time_count~q\ & (\tt[2]~reg0_q\ $ (((!\tt[0]~reg0_q\ & !\tt[1]~reg0_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tt[2]~reg0_q\,
	datab => \actual_s.time_count~q\,
	datac => \tt[0]~reg0_q\,
	datad => \tt[1]~reg0_q\,
	combout => \Selector19~1_combout\);

-- Location: LCCOMB_X29_Y29_N0
\Selector18~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector18~2_combout\ = \tt[3]~reg0_q\ $ (((!\tt[2]~reg0_q\ & (!\tt[0]~reg0_q\ & !\tt[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tt[2]~reg0_q\,
	datab => \tt[0]~reg0_q\,
	datac => \tt[1]~reg0_q\,
	datad => \tt[3]~reg0_q\,
	combout => \Selector18~2_combout\);

-- Location: LCCOMB_X34_Y29_N2
\Equal0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\A[1]~input_o\ & (\A[0]~input_o\ & !\A[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[1]~input_o\,
	datac => \A[0]~input_o\,
	datad => \A[2]~input_o\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X29_Y29_N24
\Selector25~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector25~0_combout\ = (\f~input_o\ & \actual_s.sel_type~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f~input_o\,
	datad => \actual_s.sel_type~q\,
	combout => \Selector25~0_combout\);

-- Location: IOOBUF_X34_Y41_N9
\ts[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ts[0]~reg0_q\,
	devoe => ww_devoe,
	o => \ts[0]~output_o\);

-- Location: IOOBUF_X38_Y41_N2
\ts[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ts[1]~reg0_q\,
	devoe => ww_devoe,
	o => \ts[1]~output_o\);

-- Location: IOOBUF_X36_Y41_N2
\ts[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ts[2]~reg0_q\,
	devoe => ww_devoe,
	o => \ts[2]~output_o\);

-- Location: IOOBUF_X34_Y41_N2
\ts[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ts[3]~reg0_q\,
	devoe => ww_devoe,
	o => \ts[3]~output_o\);

-- Location: IOOBUF_X52_Y28_N9
\ts[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ts[4]~reg0_q\,
	devoe => ww_devoe,
	o => \ts[4]~output_o\);

-- Location: IOOBUF_X38_Y41_N9
\ts[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ts[5]~reg0_q\,
	devoe => ww_devoe,
	o => \ts[5]~output_o\);

-- Location: IOOBUF_X52_Y30_N2
\go[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \go[0]~reg0_q\,
	devoe => ww_devoe,
	o => \go[0]~output_o\);

-- Location: IOOBUF_X41_Y41_N9
\go[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \go[1]~reg0_q\,
	devoe => ww_devoe,
	o => \go[1]~output_o\);

-- Location: IOOBUF_X43_Y41_N2
\go[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \go[2]~reg0_q\,
	devoe => ww_devoe,
	o => \go[2]~output_o\);

-- Location: IOOBUF_X43_Y41_N9
\go[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \go[3]~reg0_q\,
	devoe => ww_devoe,
	o => \go[3]~output_o\);

-- Location: IOOBUF_X46_Y41_N16
\go[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \go[4]~reg0_q\,
	devoe => ww_devoe,
	o => \go[4]~output_o\);

-- Location: IOOBUF_X48_Y0_N9
\go[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \go[5]~output_o\);

-- Location: IOOBUF_X52_Y30_N9
\ch[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ch[0]~reg0_q\,
	devoe => ww_devoe,
	o => \ch[0]~output_o\);

-- Location: IOOBUF_X41_Y41_N16
\ch[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ch[1]~reg0_q\,
	devoe => ww_devoe,
	o => \ch[1]~output_o\);

-- Location: IOOBUF_X52_Y27_N2
\ch[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ch[2]~reg0_q\,
	devoe => ww_devoe,
	o => \ch[2]~output_o\);

-- Location: IOOBUF_X52_Y32_N16
\ch[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ch[3]~reg0_q\,
	devoe => ww_devoe,
	o => \ch[3]~output_o\);

-- Location: IOOBUF_X41_Y41_N2
\ch[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ch[4]~reg0_q\,
	devoe => ww_devoe,
	o => \ch[4]~output_o\);

-- Location: IOOBUF_X46_Y41_N23
\ch[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ch[5]~reg0_q\,
	devoe => ww_devoe,
	o => \ch[5]~output_o\);

-- Location: IOOBUF_X46_Y41_N2
\td[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \td[0]~reg0_q\,
	devoe => ww_devoe,
	o => \td[0]~output_o\);

-- Location: IOOBUF_X52_Y31_N9
\td[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \td[1]~reg0_q\,
	devoe => ww_devoe,
	o => \td[1]~output_o\);

-- Location: IOOBUF_X52_Y31_N2
\td[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \td[2]~reg0_q\,
	devoe => ww_devoe,
	o => \td[2]~output_o\);

-- Location: IOOBUF_X48_Y41_N2
\td[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \td[3]~reg0_q\,
	devoe => ww_devoe,
	o => \td[3]~output_o\);

-- Location: IOOBUF_X52_Y32_N9
\td[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \td[4]~reg0_q\,
	devoe => ww_devoe,
	o => \td[4]~output_o\);

-- Location: IOOBUF_X46_Y41_N9
\td[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \td[5]~reg0_q\,
	devoe => ww_devoe,
	o => \td[5]~output_o\);

-- Location: IOOBUF_X52_Y23_N9
\tgo[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tgo[0]~reg0_q\,
	devoe => ww_devoe,
	o => \tgo[0]~output_o\);

-- Location: IOOBUF_X52_Y15_N2
\tgo[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tgo[1]~reg0_q\,
	devoe => ww_devoe,
	o => \tgo[1]~output_o\);

-- Location: IOOBUF_X52_Y13_N2
\tgo[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tgo[2]~reg0_q\,
	devoe => ww_devoe,
	o => \tgo[2]~output_o\);

-- Location: IOOBUF_X52_Y16_N2
\tgo[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tgo[3]~reg0_q\,
	devoe => ww_devoe,
	o => \tgo[3]~output_o\);

-- Location: IOOBUF_X52_Y27_N9
\tgo[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tgo[4]~reg0_q\,
	devoe => ww_devoe,
	o => \tgo[4]~output_o\);

-- Location: IOOBUF_X52_Y32_N23
\tgo[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tgo[5]~reg0_q\,
	devoe => ww_devoe,
	o => \tgo[5]~output_o\);

-- Location: IOOBUF_X52_Y16_N9
\tgo[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tgo[6]~reg0_q\,
	devoe => ww_devoe,
	o => \tgo[6]~output_o\);

-- Location: IOOBUF_X52_Y23_N2
\tgo[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tgo[7]~reg0_q\,
	devoe => ww_devoe,
	o => \tgo[7]~output_o\);

-- Location: IOOBUF_X52_Y19_N9
\tch[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tch[0]~reg0_q\,
	devoe => ww_devoe,
	o => \tch[0]~output_o\);

-- Location: IOOBUF_X52_Y15_N9
\tch[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tch[1]~reg0_q\,
	devoe => ww_devoe,
	o => \tch[1]~output_o\);

-- Location: IOOBUF_X52_Y32_N2
\tch[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tch[2]~reg0_q\,
	devoe => ww_devoe,
	o => \tch[2]~output_o\);

-- Location: IOOBUF_X52_Y25_N9
\tch[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tch[3]~reg0_q\,
	devoe => ww_devoe,
	o => \tch[3]~output_o\);

-- Location: IOOBUF_X52_Y18_N9
\tch[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tch[4]~reg0_q\,
	devoe => ww_devoe,
	o => \tch[4]~output_o\);

-- Location: IOOBUF_X52_Y25_N2
\tch[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tch[5]~reg0_q\,
	devoe => ww_devoe,
	o => \tch[5]~output_o\);

-- Location: IOOBUF_X52_Y18_N2
\tch[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tch[6]~reg0_q\,
	devoe => ww_devoe,
	o => \tch[6]~output_o\);

-- Location: IOOBUF_X52_Y19_N2
\tch[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tch[7]~reg0_q\,
	devoe => ww_devoe,
	o => \tch[7]~output_o\);

-- Location: IOOBUF_X23_Y41_N9
\tt[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tt[0]~reg0_q\,
	devoe => ww_devoe,
	o => \tt[0]~output_o\);

-- Location: IOOBUF_X25_Y41_N2
\tt[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tt[1]~reg0_q\,
	devoe => ww_devoe,
	o => \tt[1]~output_o\);

-- Location: IOOBUF_X31_Y41_N23
\tt[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tt[2]~reg0_q\,
	devoe => ww_devoe,
	o => \tt[2]~output_o\);

-- Location: IOOBUF_X25_Y41_N9
\tt[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tt[3]~reg0_q\,
	devoe => ww_devoe,
	o => \tt[3]~output_o\);

-- Location: IOIBUF_X27_Y0_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G17
\clk~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X31_Y41_N8
\A[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: LCCOMB_X34_Y29_N20
\ts[0]~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ts[0]~6_combout\ = (\ts[0]~reg0_q\ & (\A[0]~input_o\ $ (VCC))) # (!\ts[0]~reg0_q\ & (\A[0]~input_o\ & VCC))
-- \ts[0]~7\ = CARRY((\ts[0]~reg0_q\ & \A[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ts[0]~reg0_q\,
	datab => \A[0]~input_o\,
	datad => VCC,
	combout => \ts[0]~6_combout\,
	cout => \ts[0]~7\);

-- Location: IOIBUF_X29_Y41_N8
\c~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_c,
	o => \c~input_o\);

-- Location: IOIBUF_X41_Y41_N22
\d~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d,
	o => \d~input_o\);

-- Location: LCCOMB_X41_Y29_N8
\Selector26~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector26~0_combout\ = (\actual_s.time_count~q\ & ((\Equal2~0_combout\) # (\d~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \actual_s.time_count~q\,
	datac => \Equal2~0_combout\,
	datad => \d~input_o\,
	combout => \Selector26~0_combout\);

-- Location: IOIBUF_X27_Y0_N22
\rst~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: FF_X41_Y29_N9
\next_s.end_park\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector26~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_s.end_park~q\);

-- Location: CLKCTRL_G19
\rst~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst~inputclkctrl_outclk\);

-- Location: FF_X29_Y29_N25
\actual_s.end_park\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_s.end_park~q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \actual_s.end_park~q\);

-- Location: IOIBUF_X31_Y41_N1
\A[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: LCCOMB_X34_Y29_N22
\ts[1]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ts[1]~8_combout\ = (\ts[1]~reg0_q\ & ((\A[1]~input_o\ & (\ts[0]~7\ & VCC)) # (!\A[1]~input_o\ & (!\ts[0]~7\)))) # (!\ts[1]~reg0_q\ & ((\A[1]~input_o\ & (!\ts[0]~7\)) # (!\A[1]~input_o\ & ((\ts[0]~7\) # (GND)))))
-- \ts[1]~9\ = CARRY((\ts[1]~reg0_q\ & (!\A[1]~input_o\ & !\ts[0]~7\)) # (!\ts[1]~reg0_q\ & ((!\ts[0]~7\) # (!\A[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ts[1]~reg0_q\,
	datab => \A[1]~input_o\,
	datad => VCC,
	cin => \ts[0]~7\,
	combout => \ts[1]~8_combout\,
	cout => \ts[1]~9\);

-- Location: LCCOMB_X34_Y29_N24
\ts[2]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ts[2]~10_combout\ = ((\A[2]~input_o\ $ (\ts[2]~reg0_q\ $ (!\ts[1]~9\)))) # (GND)
-- \ts[2]~11\ = CARRY((\A[2]~input_o\ & ((\ts[2]~reg0_q\) # (!\ts[1]~9\))) # (!\A[2]~input_o\ & (\ts[2]~reg0_q\ & !\ts[1]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datab => \ts[2]~reg0_q\,
	datad => VCC,
	cin => \ts[1]~9\,
	combout => \ts[2]~10_combout\,
	cout => \ts[2]~11\);

-- Location: LCCOMB_X34_Y29_N6
\Selector3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\actual_s.wait_b~q\ & \ts[2]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \actual_s.wait_b~q\,
	datad => \ts[2]~reg0_q\,
	combout => \Selector3~0_combout\);

-- Location: FF_X34_Y29_N25
\ts[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ts[2]~10_combout\,
	asdata => \Selector3~0_combout\,
	sload => \ALT_INV_actual_s.add~q\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ts[2]~reg0_q\);

-- Location: LCCOMB_X34_Y29_N26
\ts[3]~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ts[3]~12_combout\ = (\ts[3]~reg0_q\ & (!\ts[2]~11\)) # (!\ts[3]~reg0_q\ & ((\ts[2]~11\) # (GND)))
-- \ts[3]~13\ = CARRY((!\ts[2]~11\) # (!\ts[3]~reg0_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ts[3]~reg0_q\,
	datad => VCC,
	cin => \ts[2]~11\,
	combout => \ts[3]~12_combout\,
	cout => \ts[3]~13\);

-- Location: LCCOMB_X34_Y29_N28
\ts[4]~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ts[4]~14_combout\ = (\ts[4]~reg0_q\ & (\ts[3]~13\ $ (GND))) # (!\ts[4]~reg0_q\ & (!\ts[3]~13\ & VCC))
-- \ts[4]~15\ = CARRY((\ts[4]~reg0_q\ & !\ts[3]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ts[4]~reg0_q\,
	datad => VCC,
	cin => \ts[3]~13\,
	combout => \ts[4]~14_combout\,
	cout => \ts[4]~15\);

-- Location: LCCOMB_X34_Y29_N10
\Selector1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\ts[4]~reg0_q\ & \actual_s.wait_b~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ts[4]~reg0_q\,
	datad => \actual_s.wait_b~q\,
	combout => \Selector1~0_combout\);

-- Location: FF_X34_Y29_N29
\ts[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ts[4]~14_combout\,
	asdata => \Selector1~0_combout\,
	sload => \ALT_INV_actual_s.add~q\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ts[4]~reg0_q\);

-- Location: LCCOMB_X34_Y29_N30
\ts[5]~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ts[5]~16_combout\ = \ts[5]~reg0_q\ $ (\ts[4]~15\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ts[5]~reg0_q\,
	cin => \ts[4]~15\,
	combout => \ts[5]~16_combout\);

-- Location: LCCOMB_X34_Y29_N12
\Selector0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\ts[5]~reg0_q\ & \actual_s.wait_b~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ts[5]~reg0_q\,
	datad => \actual_s.wait_b~q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X34_Y29_N31
\ts[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ts[5]~16_combout\,
	asdata => \Selector0~0_combout\,
	sload => \ALT_INV_actual_s.add~q\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ts[5]~reg0_q\);

-- Location: LCCOMB_X29_Y29_N16
\tt[1]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tt[1]~0_combout\ = (!\actual_s.sel_type~q\ & (((!\ts[4]~reg0_q\ & !\ts[5]~reg0_q\)) # (!\actual_s.add~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actual_s.sel_type~q\,
	datab => \actual_s.add~q\,
	datac => \ts[4]~reg0_q\,
	datad => \ts[5]~reg0_q\,
	combout => \tt[1]~0_combout\);

-- Location: LCCOMB_X29_Y29_N14
\tt[1]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tt[1]~1_combout\ = (!\actual_s.end_park~q\ & \tt[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \actual_s.end_park~q\,
	datad => \tt[1]~0_combout\,
	combout => \tt[1]~1_combout\);

-- Location: LCCOMB_X29_Y29_N12
\Selector21~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector21~0_combout\ = (!\ts[4]~reg0_q\ & (\actual_s.add~q\ & !\ts[5]~reg0_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ts[4]~reg0_q\,
	datab => \actual_s.add~q\,
	datad => \ts[5]~reg0_q\,
	combout => \Selector21~0_combout\);

-- Location: LCCOMB_X31_Y29_N0
\count[0]~32\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[0]~32_combout\ = (\Equal0~0_combout\ & (count(0) $ (VCC))) # (!\Equal0~0_combout\ & (count(0) & VCC))
-- \count[0]~33\ = CARRY((\Equal0~0_combout\ & count(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => count(0),
	datad => VCC,
	combout => \count[0]~32_combout\,
	cout => \count[0]~33\);

-- Location: LCCOMB_X29_Y29_N30
\count[0]~36\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[0]~36_combout\ = (!\rst~input_o\ & \actual_s.add~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	datad => \actual_s.add~q\,
	combout => \count[0]~36_combout\);

-- Location: FF_X31_Y29_N1
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[0]~32_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

-- Location: LCCOMB_X31_Y29_N2
\count[1]~34\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[1]~34_combout\ = (count(1) & (!\count[0]~33\)) # (!count(1) & ((\count[0]~33\) # (GND)))
-- \count[1]~35\ = CARRY((!\count[0]~33\) # (!count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(1),
	datad => VCC,
	cin => \count[0]~33\,
	combout => \count[1]~34_combout\,
	cout => \count[1]~35\);

-- Location: FF_X31_Y29_N3
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[1]~34_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

-- Location: LCCOMB_X31_Y29_N4
\count[2]~37\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[2]~37_combout\ = (count(2) & (\count[1]~35\ $ (GND))) # (!count(2) & (!\count[1]~35\ & VCC))
-- \count[2]~38\ = CARRY((count(2) & !\count[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(2),
	datad => VCC,
	cin => \count[1]~35\,
	combout => \count[2]~37_combout\,
	cout => \count[2]~38\);

-- Location: FF_X31_Y29_N5
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[2]~37_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

-- Location: LCCOMB_X31_Y29_N8
\count[4]~41\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[4]~41_combout\ = (count(4) & (\count[3]~40\ $ (GND))) # (!count(4) & (!\count[3]~40\ & VCC))
-- \count[4]~42\ = CARRY((count(4) & !\count[3]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(4),
	datad => VCC,
	cin => \count[3]~40\,
	combout => \count[4]~41_combout\,
	cout => \count[4]~42\);

-- Location: FF_X31_Y29_N9
\count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[4]~41_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(4));

-- Location: LCCOMB_X31_Y29_N10
\count[5]~43\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[5]~43_combout\ = (count(5) & (!\count[4]~42\)) # (!count(5) & ((\count[4]~42\) # (GND)))
-- \count[5]~44\ = CARRY((!\count[4]~42\) # (!count(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(5),
	datad => VCC,
	cin => \count[4]~42\,
	combout => \count[5]~43_combout\,
	cout => \count[5]~44\);

-- Location: LCCOMB_X31_Y29_N14
\count[7]~47\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[7]~47_combout\ = (count(7) & (!\count[6]~46\)) # (!count(7) & ((\count[6]~46\) # (GND)))
-- \count[7]~48\ = CARRY((!\count[6]~46\) # (!count(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(7),
	datad => VCC,
	cin => \count[6]~46\,
	combout => \count[7]~47_combout\,
	cout => \count[7]~48\);

-- Location: FF_X31_Y29_N15
\count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[7]~47_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(7));

-- Location: LCCOMB_X31_Y29_N16
\count[8]~49\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[8]~49_combout\ = (count(8) & (\count[7]~48\ $ (GND))) # (!count(8) & (!\count[7]~48\ & VCC))
-- \count[8]~50\ = CARRY((count(8) & !\count[7]~48\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(8),
	datad => VCC,
	cin => \count[7]~48\,
	combout => \count[8]~49_combout\,
	cout => \count[8]~50\);

-- Location: FF_X31_Y29_N17
\count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[8]~49_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(8));

-- Location: LCCOMB_X31_Y29_N18
\count[9]~51\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[9]~51_combout\ = (count(9) & (!\count[8]~50\)) # (!count(9) & ((\count[8]~50\) # (GND)))
-- \count[9]~52\ = CARRY((!\count[8]~50\) # (!count(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(9),
	datad => VCC,
	cin => \count[8]~50\,
	combout => \count[9]~51_combout\,
	cout => \count[9]~52\);

-- Location: FF_X31_Y29_N19
\count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[9]~51_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(9));

-- Location: LCCOMB_X31_Y29_N20
\count[10]~53\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[10]~53_combout\ = (count(10) & (\count[9]~52\ $ (GND))) # (!count(10) & (!\count[9]~52\ & VCC))
-- \count[10]~54\ = CARRY((count(10) & !\count[9]~52\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(10),
	datad => VCC,
	cin => \count[9]~52\,
	combout => \count[10]~53_combout\,
	cout => \count[10]~54\);

-- Location: FF_X31_Y29_N21
\count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[10]~53_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(10));

-- Location: LCCOMB_X31_Y29_N22
\count[11]~55\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[11]~55_combout\ = (count(11) & (!\count[10]~54\)) # (!count(11) & ((\count[10]~54\) # (GND)))
-- \count[11]~56\ = CARRY((!\count[10]~54\) # (!count(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(11),
	datad => VCC,
	cin => \count[10]~54\,
	combout => \count[11]~55_combout\,
	cout => \count[11]~56\);

-- Location: LCCOMB_X31_Y29_N24
\count[12]~57\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[12]~57_combout\ = (count(12) & (\count[11]~56\ $ (GND))) # (!count(12) & (!\count[11]~56\ & VCC))
-- \count[12]~58\ = CARRY((count(12) & !\count[11]~56\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(12),
	datad => VCC,
	cin => \count[11]~56\,
	combout => \count[12]~57_combout\,
	cout => \count[12]~58\);

-- Location: FF_X31_Y29_N25
\count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[12]~57_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(12));

-- Location: LCCOMB_X31_Y29_N26
\count[13]~59\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[13]~59_combout\ = (count(13) & (!\count[12]~58\)) # (!count(13) & ((\count[12]~58\) # (GND)))
-- \count[13]~60\ = CARRY((!\count[12]~58\) # (!count(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(13),
	datad => VCC,
	cin => \count[12]~58\,
	combout => \count[13]~59_combout\,
	cout => \count[13]~60\);

-- Location: LCCOMB_X31_Y29_N28
\count[14]~61\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[14]~61_combout\ = (count(14) & (\count[13]~60\ $ (GND))) # (!count(14) & (!\count[13]~60\ & VCC))
-- \count[14]~62\ = CARRY((count(14) & !\count[13]~60\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(14),
	datad => VCC,
	cin => \count[13]~60\,
	combout => \count[14]~61_combout\,
	cout => \count[14]~62\);

-- Location: FF_X31_Y29_N29
\count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[14]~61_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(14));

-- Location: LCCOMB_X31_Y28_N0
\count[16]~65\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[16]~65_combout\ = (count(16) & (\count[15]~64\ $ (GND))) # (!count(16) & (!\count[15]~64\ & VCC))
-- \count[16]~66\ = CARRY((count(16) & !\count[15]~64\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(16),
	datad => VCC,
	cin => \count[15]~64\,
	combout => \count[16]~65_combout\,
	cout => \count[16]~66\);

-- Location: FF_X31_Y28_N1
\count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[16]~65_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(16));

-- Location: LCCOMB_X31_Y28_N2
\count[17]~67\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[17]~67_combout\ = (count(17) & (!\count[16]~66\)) # (!count(17) & ((\count[16]~66\) # (GND)))
-- \count[17]~68\ = CARRY((!\count[16]~66\) # (!count(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(17),
	datad => VCC,
	cin => \count[16]~66\,
	combout => \count[17]~67_combout\,
	cout => \count[17]~68\);

-- Location: FF_X31_Y28_N3
\count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[17]~67_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(17));

-- Location: LCCOMB_X31_Y28_N4
\count[18]~69\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[18]~69_combout\ = (count(18) & (\count[17]~68\ $ (GND))) # (!count(18) & (!\count[17]~68\ & VCC))
-- \count[18]~70\ = CARRY((count(18) & !\count[17]~68\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(18),
	datad => VCC,
	cin => \count[17]~68\,
	combout => \count[18]~69_combout\,
	cout => \count[18]~70\);

-- Location: FF_X31_Y28_N5
\count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[18]~69_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(18));

-- Location: LCCOMB_X31_Y28_N6
\count[19]~71\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[19]~71_combout\ = (count(19) & (!\count[18]~70\)) # (!count(19) & ((\count[18]~70\) # (GND)))
-- \count[19]~72\ = CARRY((!\count[18]~70\) # (!count(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(19),
	datad => VCC,
	cin => \count[18]~70\,
	combout => \count[19]~71_combout\,
	cout => \count[19]~72\);

-- Location: LCCOMB_X31_Y28_N8
\count[20]~73\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[20]~73_combout\ = (count(20) & (\count[19]~72\ $ (GND))) # (!count(20) & (!\count[19]~72\ & VCC))
-- \count[20]~74\ = CARRY((count(20) & !\count[19]~72\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(20),
	datad => VCC,
	cin => \count[19]~72\,
	combout => \count[20]~73_combout\,
	cout => \count[20]~74\);

-- Location: FF_X31_Y28_N9
\count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[20]~73_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(20));

-- Location: LCCOMB_X31_Y28_N10
\count[21]~75\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[21]~75_combout\ = (count(21) & (!\count[20]~74\)) # (!count(21) & ((\count[20]~74\) # (GND)))
-- \count[21]~76\ = CARRY((!\count[20]~74\) # (!count(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(21),
	datad => VCC,
	cin => \count[20]~74\,
	combout => \count[21]~75_combout\,
	cout => \count[21]~76\);

-- Location: LCCOMB_X31_Y28_N12
\count[22]~77\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[22]~77_combout\ = (count(22) & (\count[21]~76\ $ (GND))) # (!count(22) & (!\count[21]~76\ & VCC))
-- \count[22]~78\ = CARRY((count(22) & !\count[21]~76\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(22),
	datad => VCC,
	cin => \count[21]~76\,
	combout => \count[22]~77_combout\,
	cout => \count[22]~78\);

-- Location: LCCOMB_X31_Y28_N14
\count[23]~79\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[23]~79_combout\ = (count(23) & (!\count[22]~78\)) # (!count(23) & ((\count[22]~78\) # (GND)))
-- \count[23]~80\ = CARRY((!\count[22]~78\) # (!count(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(23),
	datad => VCC,
	cin => \count[22]~78\,
	combout => \count[23]~79_combout\,
	cout => \count[23]~80\);

-- Location: FF_X31_Y28_N15
\count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[23]~79_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(23));

-- Location: LCCOMB_X31_Y28_N16
\count[24]~81\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[24]~81_combout\ = (count(24) & (\count[23]~80\ $ (GND))) # (!count(24) & (!\count[23]~80\ & VCC))
-- \count[24]~82\ = CARRY((count(24) & !\count[23]~80\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(24),
	datad => VCC,
	cin => \count[23]~80\,
	combout => \count[24]~81_combout\,
	cout => \count[24]~82\);

-- Location: FF_X31_Y28_N17
\count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[24]~81_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(24));

-- Location: LCCOMB_X31_Y28_N18
\count[25]~83\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[25]~83_combout\ = (count(25) & (!\count[24]~82\)) # (!count(25) & ((\count[24]~82\) # (GND)))
-- \count[25]~84\ = CARRY((!\count[24]~82\) # (!count(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(25),
	datad => VCC,
	cin => \count[24]~82\,
	combout => \count[25]~83_combout\,
	cout => \count[25]~84\);

-- Location: FF_X31_Y28_N19
\count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[25]~83_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(25));

-- Location: LCCOMB_X31_Y28_N20
\count[26]~85\ : cycloneiv_lcell_comb
-- Equation(s):
-- \count[26]~85_combout\ = (count(26) & (\count[25]~84\ $ (GND))) # (!count(26) & (!\count[25]~84\ & VCC))
-- \count[26]~86\ = CARRY((count(26) & !\count[25]~84\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(26),
	datad => VCC,
	cin => \count[25]~84\,
	combout => \count[26]~85_combout\,
	cout => \count[26]~86\);

-- Location: FF_X31_Y28_N21
\count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[26]~85_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(26));

-- Location: FF_X31_Y28_N23
\count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[27]~87_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(27));

-- Location: LCCOMB_X30_Y28_N0
\Equal1~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal1~8_combout\ = (!count(26) & (!count(25) & (!count(27) & !count(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(26),
	datab => count(25),
	datac => count(27),
	datad => count(24),
	combout => \Equal1~8_combout\);

-- Location: FF_X31_Y29_N23
\count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[11]~55_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(11));

-- Location: LCCOMB_X30_Y29_N20
\Equal1~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = (!count(10) & (!count(8) & (!count(9) & !count(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(10),
	datab => count(8),
	datac => count(9),
	datad => count(11),
	combout => \Equal1~2_combout\);

-- Location: FF_X31_Y29_N27
\count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[13]~59_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(13));

-- Location: LCCOMB_X30_Y29_N14
\Equal1~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal1~3_combout\ = (!count(15) & (!count(14) & (!count(12) & !count(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(15),
	datab => count(14),
	datac => count(12),
	datad => count(13),
	combout => \Equal1~3_combout\);

-- Location: FF_X31_Y29_N11
\count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[5]~43_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(5));

-- Location: LCCOMB_X32_Y29_N12
\Equal1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (!count(6) & (!count(4) & (!count(7) & !count(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(6),
	datab => count(4),
	datac => count(7),
	datad => count(5),
	combout => \Equal1~1_combout\);

-- Location: LCCOMB_X30_Y29_N4
\Equal1~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal1~4_combout\ = (\Equal1~0_combout\ & (\Equal1~2_combout\ & (\Equal1~3_combout\ & \Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~0_combout\,
	datab => \Equal1~2_combout\,
	datac => \Equal1~3_combout\,
	datad => \Equal1~1_combout\,
	combout => \Equal1~4_combout\);

-- Location: FF_X31_Y28_N11
\count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[21]~75_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(21));

-- Location: FF_X31_Y28_N13
\count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[22]~77_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(22));

-- Location: LCCOMB_X30_Y29_N8
\Equal1~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal1~6_combout\ = (!count(23) & (!count(20) & (!count(21) & !count(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(23),
	datab => count(20),
	datac => count(21),
	datad => count(22),
	combout => \Equal1~6_combout\);

-- Location: FF_X31_Y28_N7
\count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \count[19]~71_combout\,
	sclr => \Equal1~10_combout\,
	ena => \count[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(19));

-- Location: LCCOMB_X30_Y29_N2
\Equal1~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal1~5_combout\ = (!count(18) & !count(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => count(18),
	datad => count(19),
	combout => \Equal1~5_combout\);

-- Location: LCCOMB_X30_Y29_N18
\Equal1~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal1~7_combout\ = (!count(17) & (!count(16) & (\Equal1~6_combout\ & \Equal1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(17),
	datab => count(16),
	datac => \Equal1~6_combout\,
	datad => \Equal1~5_combout\,
	combout => \Equal1~7_combout\);

-- Location: LCCOMB_X30_Y29_N28
\Equal1~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal1~10_combout\ = (\Equal1~9_combout\ & (\Equal1~8_combout\ & (\Equal1~4_combout\ & \Equal1~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~9_combout\,
	datab => \Equal1~8_combout\,
	datac => \Equal1~4_combout\,
	datad => \Equal1~7_combout\,
	combout => \Equal1~10_combout\);

-- Location: LCCOMB_X29_Y29_N2
\Selector21~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector21~1_combout\ = (\Selector21~0_combout\ & ((\Equal1~10_combout\ & ((!\tt[0]~reg0_q\))) # (!\Equal1~10_combout\ & (\Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~0_combout\,
	datab => \tt[0]~reg0_q\,
	datac => \Selector21~0_combout\,
	datad => \Equal1~10_combout\,
	combout => \Selector21~1_combout\);

-- Location: LCCOMB_X29_Y29_N18
\Selector21~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector21~2_combout\ = (\Selector21~1_combout\) # ((\tt[0]~reg0_q\ & ((!\tt[1]~1_combout\))) # (!\tt[0]~reg0_q\ & (\actual_s.time_count~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actual_s.time_count~q\,
	datab => \tt[1]~1_combout\,
	datac => \tt[0]~reg0_q\,
	datad => \Selector21~1_combout\,
	combout => \Selector21~2_combout\);

-- Location: FF_X29_Y29_N19
\tt[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector21~2_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tt[0]~reg0_q\);

-- Location: IOIBUF_X52_Y28_N1
\A[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: LCCOMB_X30_Y29_N10
\Selector20~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector20~4_combout\ = (\actual_s.time_count~q\ & (!\tt[0]~reg0_q\)) # (!\actual_s.time_count~q\ & ((\tt[0]~reg0_q\) # ((\A[2]~input_o\ & !\Equal1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011001110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actual_s.time_count~q\,
	datab => \tt[0]~reg0_q\,
	datac => \A[2]~input_o\,
	datad => \Equal1~10_combout\,
	combout => \Selector20~4_combout\);

-- Location: LCCOMB_X30_Y29_N0
\Selector20~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector20~5_combout\ = (\actual_s.time_count~q\ & ((\tt[1]~reg0_q\ $ (\Selector20~4_combout\)))) # (!\actual_s.time_count~q\ & (\actual_s.add~q\ & (\tt[1]~reg0_q\ $ (\Selector20~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actual_s.time_count~q\,
	datab => \actual_s.add~q\,
	datac => \tt[1]~reg0_q\,
	datad => \Selector20~4_combout\,
	combout => \Selector20~5_combout\);

-- Location: LCCOMB_X29_Y29_N28
\tt[1]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tt[1]~2_combout\ = (\actual_s.add~q\ & ((\A[0]~input_o\) # (\A[1]~input_o\ $ (!\A[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[1]~input_o\,
	datab => \actual_s.add~q\,
	datac => \A[0]~input_o\,
	datad => \A[2]~input_o\,
	combout => \tt[1]~2_combout\);

-- Location: LCCOMB_X29_Y29_N6
\tt[1]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tt[1]~3_combout\ = (!\rst~input_o\ & (\tt[1]~1_combout\ & ((\Equal1~10_combout\) # (!\tt[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datab => \tt[1]~2_combout\,
	datac => \tt[1]~1_combout\,
	datad => \Equal1~10_combout\,
	combout => \tt[1]~3_combout\);

-- Location: FF_X30_Y29_N1
\tt[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector20~5_combout\,
	ena => \tt[1]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tt[1]~reg0_q\);

-- Location: LCCOMB_X34_Y29_N18
\Selector19~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector19~0_combout\ = (\actual_s.add~q\ & !\actual_s.time_count~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \actual_s.add~q\,
	datad => \actual_s.time_count~q\,
	combout => \Selector19~0_combout\);

-- Location: LCCOMB_X30_Y29_N16
\Selector19~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector19~2_combout\ = (\tt[1]~reg0_q\ & ((\tt[0]~reg0_q\) # ((\A[2]~input_o\ & !\Equal1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tt[0]~reg0_q\,
	datab => \tt[1]~reg0_q\,
	datac => \A[2]~input_o\,
	datad => \Equal1~10_combout\,
	combout => \Selector19~2_combout\);

-- Location: LCCOMB_X30_Y29_N30
\Selector18~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector18~0_combout\ = (\tt[2]~reg0_q\ & (\Selector19~0_combout\ & (!\tt[3]~reg0_q\ & \Selector19~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tt[2]~reg0_q\,
	datab => \Selector19~0_combout\,
	datac => \tt[3]~reg0_q\,
	datad => \Selector19~2_combout\,
	combout => \Selector18~0_combout\);

-- Location: LCCOMB_X30_Y29_N12
\Selector18~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector18~1_combout\ = (\Selector19~0_combout\ & (\tt[3]~reg0_q\ & ((!\Selector19~2_combout\) # (!\tt[2]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tt[2]~reg0_q\,
	datab => \Selector19~0_combout\,
	datac => \tt[3]~reg0_q\,
	datad => \Selector19~2_combout\,
	combout => \Selector18~1_combout\);

-- Location: LCCOMB_X30_Y29_N24
\Selector18~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector18~3_combout\ = (\Selector18~0_combout\) # ((\Selector18~1_combout\) # ((\Selector18~2_combout\ & \actual_s.time_count~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector18~2_combout\,
	datab => \actual_s.time_count~q\,
	datac => \Selector18~0_combout\,
	datad => \Selector18~1_combout\,
	combout => \Selector18~3_combout\);

-- Location: FF_X30_Y29_N25
\tt[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector18~3_combout\,
	ena => \tt[1]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tt[3]~reg0_q\);

-- Location: LCCOMB_X29_Y29_N22
\Equal2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (!\tt[2]~reg0_q\ & (!\tt[0]~reg0_q\ & (!\tt[1]~reg0_q\ & !\tt[3]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tt[2]~reg0_q\,
	datab => \tt[0]~reg0_q\,
	datac => \tt[1]~reg0_q\,
	datad => \tt[3]~reg0_q\,
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X41_Y29_N18
\Selector25~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector25~1_combout\ = (\Selector25~0_combout\) # ((\actual_s.time_count~q\ & (!\Equal2~0_combout\ & !\d~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector25~0_combout\,
	datab => \actual_s.time_count~q\,
	datac => \Equal2~0_combout\,
	datad => \d~input_o\,
	combout => \Selector25~1_combout\);

-- Location: FF_X41_Y29_N19
\next_s.time_count\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector25~1_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_s.time_count~q\);

-- Location: LCCOMB_X41_Y29_N2
\actual_s.time_count~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \actual_s.time_count~feeder_combout\ = \next_s.time_count~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_s.time_count~q\,
	combout => \actual_s.time_count~feeder_combout\);

-- Location: FF_X41_Y29_N3
\actual_s.time_count\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \actual_s.time_count~feeder_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \actual_s.time_count~q\);

-- Location: IOIBUF_X29_Y0_N1
\f~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_f,
	o => \f~input_o\);

-- Location: LCCOMB_X29_Y29_N10
\next_s.sel_type~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \next_s.sel_type~0_combout\ = (\actual_s.sel_type~q\ & (((!\c~input_o\ & !\f~input_o\)))) # (!\actual_s.sel_type~q\ & (\b~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b~input_o\,
	datab => \c~input_o\,
	datac => \f~input_o\,
	datad => \actual_s.sel_type~q\,
	combout => \next_s.sel_type~0_combout\);

-- Location: LCCOMB_X29_Y29_N4
\next_s.sel_type~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \next_s.sel_type~1_combout\ = (\actual_s.end_park~q\ & (\next_s.sel_type~0_combout\ & (\actual_s.add~q\ $ (\actual_s.time_count~q\)))) # (!\actual_s.end_park~q\ & ((\actual_s.add~q\ & ((\next_s.sel_type~0_combout\) # (!\actual_s.time_count~q\))) # 
-- (!\actual_s.add~q\ & (!\actual_s.time_count~q\ & \next_s.sel_type~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actual_s.end_park~q\,
	datab => \actual_s.add~q\,
	datac => \actual_s.time_count~q\,
	datad => \next_s.sel_type~0_combout\,
	combout => \next_s.sel_type~1_combout\);

-- Location: FF_X29_Y29_N5
\next_s.sel_type\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \next_s.sel_type~1_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_s.sel_type~q\);

-- Location: FF_X29_Y29_N13
\actual_s.sel_type\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_s.sel_type~q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \actual_s.sel_type~q\);

-- Location: LCCOMB_X29_Y29_N26
\Selector24~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector24~0_combout\ = (!\f~input_o\ & (\c~input_o\ & \actual_s.sel_type~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \f~input_o\,
	datab => \c~input_o\,
	datad => \actual_s.sel_type~q\,
	combout => \Selector24~0_combout\);

-- Location: FF_X29_Y29_N27
\next_s.add\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector24~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_s.add~q\);

-- Location: FF_X29_Y29_N21
\actual_s.add\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_s.add~q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \actual_s.add~q\);

-- Location: IOIBUF_X29_Y41_N1
\b~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b,
	o => \b~input_o\);

-- Location: LCCOMB_X29_Y29_N20
\next_s.wait_b~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \next_s.wait_b~0_combout\ = (\actual_s.sel_type~q\) # (\b~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actual_s.sel_type~q\,
	datad => \b~input_o\,
	combout => \next_s.wait_b~0_combout\);

-- Location: LCCOMB_X34_Y29_N0
\next_s.wait_b~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \next_s.wait_b~1_combout\ = (\actual_s.end_park~q\ & (\next_s.wait_b~0_combout\ & (\actual_s.add~q\ $ (\actual_s.time_count~q\)))) # (!\actual_s.end_park~q\ & ((\next_s.wait_b~0_combout\) # (\actual_s.add~q\ $ (\actual_s.time_count~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000111010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \actual_s.end_park~q\,
	datab => \actual_s.add~q\,
	datac => \next_s.wait_b~0_combout\,
	datad => \actual_s.time_count~q\,
	combout => \next_s.wait_b~1_combout\);

-- Location: FF_X34_Y29_N1
\next_s.wait_b\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \next_s.wait_b~1_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_s.wait_b~q\);

-- Location: LCCOMB_X34_Y29_N16
\actual_s.wait_b~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \actual_s.wait_b~feeder_combout\ = \next_s.wait_b~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_s.wait_b~q\,
	combout => \actual_s.wait_b~feeder_combout\);

-- Location: FF_X34_Y29_N17
\actual_s.wait_b\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \actual_s.wait_b~feeder_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \actual_s.wait_b~q\);

-- Location: LCCOMB_X34_Y29_N14
\Selector5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\ts[0]~reg0_q\ & \actual_s.wait_b~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ts[0]~reg0_q\,
	datad => \actual_s.wait_b~q\,
	combout => \Selector5~0_combout\);

-- Location: FF_X34_Y29_N21
\ts[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ts[0]~6_combout\,
	asdata => \Selector5~0_combout\,
	sload => \ALT_INV_actual_s.add~q\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ts[0]~reg0_q\);

-- Location: LCCOMB_X34_Y29_N4
\Selector4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\ts[1]~reg0_q\ & \actual_s.wait_b~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ts[1]~reg0_q\,
	datad => \actual_s.wait_b~q\,
	combout => \Selector4~0_combout\);

-- Location: FF_X34_Y29_N23
\ts[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ts[1]~8_combout\,
	asdata => \Selector4~0_combout\,
	sload => \ALT_INV_actual_s.add~q\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ts[1]~reg0_q\);

-- Location: LCCOMB_X34_Y29_N8
\Selector2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\ts[3]~reg0_q\ & \actual_s.wait_b~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ts[3]~reg0_q\,
	datad => \actual_s.wait_b~q\,
	combout => \Selector2~0_combout\);

-- Location: FF_X34_Y29_N27
\ts[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ts[3]~12_combout\,
	asdata => \Selector2~0_combout\,
	sload => \ALT_INV_actual_s.add~q\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ts[3]~reg0_q\);

-- Location: LCCOMB_X41_Y29_N14
\Selector12~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = (\actual_s.wait_b~q\ & !\actual_s.end_park~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \actual_s.wait_b~q\,
	datad => \actual_s.end_park~q\,
	combout => \Selector12~0_combout\);

-- Location: LCCOMB_X41_Y29_N12
\Selector8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (!\ts[4]~reg0_q\ & (\actual_s.end_park~q\ & !\ts[5]~reg0_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ts[4]~reg0_q\,
	datac => \actual_s.end_park~q\,
	datad => \ts[5]~reg0_q\,
	combout => \Selector8~0_combout\);

-- Location: LCCOMB_X41_Y29_N0
\Selector11~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = (\ts[0]~reg0_q\ & ((\Selector8~0_combout\) # ((\Selector12~0_combout\ & \go[0]~reg0_q\)))) # (!\ts[0]~reg0_q\ & (\Selector12~0_combout\ & (\go[0]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ts[0]~reg0_q\,
	datab => \Selector12~0_combout\,
	datac => \go[0]~reg0_q\,
	datad => \Selector8~0_combout\,
	combout => \Selector11~0_combout\);

-- Location: FF_X41_Y29_N1
\go[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector11~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \go[0]~reg0_q\);

-- Location: LCCOMB_X41_Y29_N6
\Selector10~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = (\ts[1]~reg0_q\ & ((\Selector8~0_combout\) # ((\Selector12~0_combout\ & \go[1]~reg0_q\)))) # (!\ts[1]~reg0_q\ & (\Selector12~0_combout\ & (\go[1]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ts[1]~reg0_q\,
	datab => \Selector12~0_combout\,
	datac => \go[1]~reg0_q\,
	datad => \Selector8~0_combout\,
	combout => \Selector10~0_combout\);

-- Location: FF_X41_Y29_N7
\go[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector10~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \go[1]~reg0_q\);

-- Location: LCCOMB_X42_Y29_N4
\Selector9~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = (\Selector8~0_combout\ & ((\ts[2]~reg0_q\) # ((\go[2]~reg0_q\ & \Selector12~0_combout\)))) # (!\Selector8~0_combout\ & (((\go[2]~reg0_q\ & \Selector12~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector8~0_combout\,
	datab => \ts[2]~reg0_q\,
	datac => \go[2]~reg0_q\,
	datad => \Selector12~0_combout\,
	combout => \Selector9~0_combout\);

-- Location: FF_X42_Y29_N5
\go[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector9~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \go[2]~reg0_q\);

-- Location: LCCOMB_X41_Y29_N24
\Selector8~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector8~1_combout\ = (\ts[3]~reg0_q\ & ((\Selector8~0_combout\) # ((\Selector12~0_combout\ & \go[3]~reg0_q\)))) # (!\ts[3]~reg0_q\ & (\Selector12~0_combout\ & (\go[3]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ts[3]~reg0_q\,
	datab => \Selector12~0_combout\,
	datac => \go[3]~reg0_q\,
	datad => \Selector8~0_combout\,
	combout => \Selector8~1_combout\);

-- Location: FF_X41_Y29_N25
\go[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector8~1_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \go[3]~reg0_q\);

-- Location: LCCOMB_X41_Y29_N26
\Selector7~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector7~3_combout\ = (\Selector7~2_combout\) # ((\actual_s.wait_b~q\ & (\go[4]~reg0_q\ & !\actual_s.end_park~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector7~2_combout\,
	datab => \actual_s.wait_b~q\,
	datac => \go[4]~reg0_q\,
	datad => \actual_s.end_park~q\,
	combout => \Selector7~3_combout\);

-- Location: FF_X41_Y29_N27
\go[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector7~3_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \go[4]~reg0_q\);

-- Location: LCCOMB_X41_Y29_N16
\Selector17~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector17~0_combout\ = (\Selector7~2_combout\ & ((\ts[0]~reg0_q\) # ((\Selector12~0_combout\ & \ch[0]~reg0_q\)))) # (!\Selector7~2_combout\ & (\Selector12~0_combout\ & (\ch[0]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector7~2_combout\,
	datab => \Selector12~0_combout\,
	datac => \ch[0]~reg0_q\,
	datad => \ts[0]~reg0_q\,
	combout => \Selector17~0_combout\);

-- Location: FF_X41_Y29_N17
\ch[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector17~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ch[0]~reg0_q\);

-- Location: LCCOMB_X41_Y29_N10
\Selector16~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = (\Selector7~2_combout\ & ((\ts[1]~reg0_q\) # ((\Selector12~0_combout\ & \ch[1]~reg0_q\)))) # (!\Selector7~2_combout\ & (\Selector12~0_combout\ & (\ch[1]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector7~2_combout\,
	datab => \Selector12~0_combout\,
	datac => \ch[1]~reg0_q\,
	datad => \ts[1]~reg0_q\,
	combout => \Selector16~0_combout\);

-- Location: FF_X41_Y29_N11
\ch[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector16~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ch[1]~reg0_q\);

-- Location: LCCOMB_X41_Y29_N22
\Selector7~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector7~2_combout\ = (\actual_s.end_park~q\ & ((\ts[4]~reg0_q\) # (\ts[5]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ts[4]~reg0_q\,
	datac => \actual_s.end_park~q\,
	datad => \ts[5]~reg0_q\,
	combout => \Selector7~2_combout\);

-- Location: LCCOMB_X42_Y29_N30
\Selector15~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = (\ts[2]~reg0_q\ & ((\Selector7~2_combout\) # ((\ch[2]~reg0_q\ & \Selector12~0_combout\)))) # (!\ts[2]~reg0_q\ & (((\ch[2]~reg0_q\ & \Selector12~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ts[2]~reg0_q\,
	datab => \Selector7~2_combout\,
	datac => \ch[2]~reg0_q\,
	datad => \Selector12~0_combout\,
	combout => \Selector15~0_combout\);

-- Location: FF_X42_Y29_N31
\ch[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector15~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ch[2]~reg0_q\);

-- Location: LCCOMB_X41_Y29_N4
\Selector14~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = (\Selector7~2_combout\ & ((\ts[3]~reg0_q\) # ((\Selector12~0_combout\ & \ch[3]~reg0_q\)))) # (!\Selector7~2_combout\ & (\Selector12~0_combout\ & (\ch[3]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector7~2_combout\,
	datab => \Selector12~0_combout\,
	datac => \ch[3]~reg0_q\,
	datad => \ts[3]~reg0_q\,
	combout => \Selector14~0_combout\);

-- Location: FF_X41_Y29_N5
\ch[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector14~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ch[3]~reg0_q\);

-- Location: LCCOMB_X41_Y29_N20
\Selector12~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector12~1_combout\ = (\actual_s.end_park~q\ & \ts[5]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \actual_s.end_park~q\,
	datad => \ts[5]~reg0_q\,
	combout => \Selector12~1_combout\);

-- Location: LCCOMB_X41_Y29_N30
\Selector13~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = (\ts[4]~reg0_q\ & (\Selector12~0_combout\ & (\ch[4]~reg0_q\))) # (!\ts[4]~reg0_q\ & ((\Selector12~1_combout\) # ((\Selector12~0_combout\ & \ch[4]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ts[4]~reg0_q\,
	datab => \Selector12~0_combout\,
	datac => \ch[4]~reg0_q\,
	datad => \Selector12~1_combout\,
	combout => \Selector13~0_combout\);

-- Location: FF_X41_Y29_N31
\ch[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector13~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ch[4]~reg0_q\);

-- Location: LCCOMB_X41_Y29_N28
\Selector12~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector12~2_combout\ = (\ts[4]~reg0_q\ & ((\Selector12~1_combout\) # ((\Selector12~0_combout\ & \ch[5]~reg0_q\)))) # (!\ts[4]~reg0_q\ & (\Selector12~0_combout\ & (\ch[5]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ts[4]~reg0_q\,
	datab => \Selector12~0_combout\,
	datac => \ch[5]~reg0_q\,
	datad => \Selector12~1_combout\,
	combout => \Selector12~2_combout\);

-- Location: FF_X41_Y29_N29
\ch[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector12~2_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ch[5]~reg0_q\);

-- Location: LCCOMB_X48_Y31_N12
\td[0]~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \td[0]~5_combout\ = \actual_s.end_park~q\ $ (\td[0]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \actual_s.end_park~q\,
	datac => \td[0]~reg0_q\,
	combout => \td[0]~5_combout\);

-- Location: FF_X48_Y31_N13
\td[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \td[0]~5_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \td[0]~reg0_q\);

-- Location: LCCOMB_X48_Y31_N20
\td[1]~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \td[1]~6_combout\ = (\td[0]~reg0_q\ & (\td[1]~reg0_q\ $ (VCC))) # (!\td[0]~reg0_q\ & (\td[1]~reg0_q\ & VCC))
-- \td[1]~7\ = CARRY((\td[0]~reg0_q\ & \td[1]~reg0_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \td[0]~reg0_q\,
	datab => \td[1]~reg0_q\,
	datad => VCC,
	combout => \td[1]~6_combout\,
	cout => \td[1]~7\);

-- Location: FF_X48_Y31_N21
\td[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \td[1]~6_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \td[1]~reg0_q\);

-- Location: LCCOMB_X48_Y31_N22
\td[2]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \td[2]~8_combout\ = (\td[2]~reg0_q\ & (!\td[1]~7\)) # (!\td[2]~reg0_q\ & ((\td[1]~7\) # (GND)))
-- \td[2]~9\ = CARRY((!\td[1]~7\) # (!\td[2]~reg0_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \td[2]~reg0_q\,
	datad => VCC,
	cin => \td[1]~7\,
	combout => \td[2]~8_combout\,
	cout => \td[2]~9\);

-- Location: FF_X48_Y31_N23
\td[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \td[2]~8_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \td[2]~reg0_q\);

-- Location: LCCOMB_X48_Y31_N24
\td[3]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \td[3]~10_combout\ = (\td[3]~reg0_q\ & (\td[2]~9\ $ (GND))) # (!\td[3]~reg0_q\ & (!\td[2]~9\ & VCC))
-- \td[3]~11\ = CARRY((\td[3]~reg0_q\ & !\td[2]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \td[3]~reg0_q\,
	datad => VCC,
	cin => \td[2]~9\,
	combout => \td[3]~10_combout\,
	cout => \td[3]~11\);

-- Location: FF_X48_Y31_N25
\td[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \td[3]~10_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \td[3]~reg0_q\);

-- Location: LCCOMB_X48_Y31_N26
\td[4]~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \td[4]~12_combout\ = (\td[4]~reg0_q\ & (!\td[3]~11\)) # (!\td[4]~reg0_q\ & ((\td[3]~11\) # (GND)))
-- \td[4]~13\ = CARRY((!\td[3]~11\) # (!\td[4]~reg0_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \td[4]~reg0_q\,
	datad => VCC,
	cin => \td[3]~11\,
	combout => \td[4]~12_combout\,
	cout => \td[4]~13\);

-- Location: FF_X48_Y31_N27
\td[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \td[4]~12_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \td[4]~reg0_q\);

-- Location: LCCOMB_X48_Y31_N28
\td[5]~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \td[5]~14_combout\ = \td[4]~13\ $ (!\td[5]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \td[5]~reg0_q\,
	cin => \td[4]~13\,
	combout => \td[5]~14_combout\);

-- Location: FF_X48_Y31_N29
\td[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \td[5]~14_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \td[5]~reg0_q\);

-- Location: LCCOMB_X49_Y29_N10
\tgo[0]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tgo[0]~8_combout\ = (\tgo[0]~reg0_q\ & (\go[0]~reg0_q\ $ (VCC))) # (!\tgo[0]~reg0_q\ & (\go[0]~reg0_q\ & VCC))
-- \tgo[0]~9\ = CARRY((\tgo[0]~reg0_q\ & \go[0]~reg0_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tgo[0]~reg0_q\,
	datab => \go[0]~reg0_q\,
	datad => VCC,
	combout => \tgo[0]~8_combout\,
	cout => \tgo[0]~9\);

-- Location: LCCOMB_X48_Y31_N2
\Equal3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (\td[0]~reg0_q\ & (!\td[3]~reg0_q\ & (!\td[2]~reg0_q\ & !\td[1]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \td[0]~reg0_q\,
	datab => \td[3]~reg0_q\,
	datac => \td[2]~reg0_q\,
	datad => \td[1]~reg0_q\,
	combout => \Equal3~0_combout\);

-- Location: LCCOMB_X48_Y31_N8
\Equal3~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal3~1_combout\ = (!\td[5]~reg0_q\ & (!\td[4]~reg0_q\ & \Equal3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \td[5]~reg0_q\,
	datac => \td[4]~reg0_q\,
	datad => \Equal3~0_combout\,
	combout => \Equal3~1_combout\);

-- Location: FF_X49_Y29_N11
\tgo[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tgo[0]~8_combout\,
	asdata => \go[0]~reg0_q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tgo[0]~reg0_q\);

-- Location: LCCOMB_X49_Y29_N12
\tgo[1]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tgo[1]~10_combout\ = (\tgo[1]~reg0_q\ & ((\go[1]~reg0_q\ & (\tgo[0]~9\ & VCC)) # (!\go[1]~reg0_q\ & (!\tgo[0]~9\)))) # (!\tgo[1]~reg0_q\ & ((\go[1]~reg0_q\ & (!\tgo[0]~9\)) # (!\go[1]~reg0_q\ & ((\tgo[0]~9\) # (GND)))))
-- \tgo[1]~11\ = CARRY((\tgo[1]~reg0_q\ & (!\go[1]~reg0_q\ & !\tgo[0]~9\)) # (!\tgo[1]~reg0_q\ & ((!\tgo[0]~9\) # (!\go[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tgo[1]~reg0_q\,
	datab => \go[1]~reg0_q\,
	datad => VCC,
	cin => \tgo[0]~9\,
	combout => \tgo[1]~10_combout\,
	cout => \tgo[1]~11\);

-- Location: FF_X49_Y29_N13
\tgo[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tgo[1]~10_combout\,
	asdata => \go[1]~reg0_q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tgo[1]~reg0_q\);

-- Location: LCCOMB_X49_Y29_N14
\tgo[2]~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tgo[2]~12_combout\ = ((\tgo[2]~reg0_q\ $ (\go[2]~reg0_q\ $ (!\tgo[1]~11\)))) # (GND)
-- \tgo[2]~13\ = CARRY((\tgo[2]~reg0_q\ & ((\go[2]~reg0_q\) # (!\tgo[1]~11\))) # (!\tgo[2]~reg0_q\ & (\go[2]~reg0_q\ & !\tgo[1]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tgo[2]~reg0_q\,
	datab => \go[2]~reg0_q\,
	datad => VCC,
	cin => \tgo[1]~11\,
	combout => \tgo[2]~12_combout\,
	cout => \tgo[2]~13\);

-- Location: FF_X49_Y29_N15
\tgo[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tgo[2]~12_combout\,
	asdata => \go[2]~reg0_q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tgo[2]~reg0_q\);

-- Location: LCCOMB_X49_Y29_N16
\tgo[3]~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tgo[3]~14_combout\ = (\go[3]~reg0_q\ & ((\tgo[3]~reg0_q\ & (\tgo[2]~13\ & VCC)) # (!\tgo[3]~reg0_q\ & (!\tgo[2]~13\)))) # (!\go[3]~reg0_q\ & ((\tgo[3]~reg0_q\ & (!\tgo[2]~13\)) # (!\tgo[3]~reg0_q\ & ((\tgo[2]~13\) # (GND)))))
-- \tgo[3]~15\ = CARRY((\go[3]~reg0_q\ & (!\tgo[3]~reg0_q\ & !\tgo[2]~13\)) # (!\go[3]~reg0_q\ & ((!\tgo[2]~13\) # (!\tgo[3]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \go[3]~reg0_q\,
	datab => \tgo[3]~reg0_q\,
	datad => VCC,
	cin => \tgo[2]~13\,
	combout => \tgo[3]~14_combout\,
	cout => \tgo[3]~15\);

-- Location: FF_X49_Y29_N17
\tgo[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tgo[3]~14_combout\,
	asdata => \go[3]~reg0_q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tgo[3]~reg0_q\);

-- Location: LCCOMB_X49_Y29_N18
\tgo[4]~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tgo[4]~16_combout\ = ((\go[4]~reg0_q\ $ (\tgo[4]~reg0_q\ $ (!\tgo[3]~15\)))) # (GND)
-- \tgo[4]~17\ = CARRY((\go[4]~reg0_q\ & ((\tgo[4]~reg0_q\) # (!\tgo[3]~15\))) # (!\go[4]~reg0_q\ & (\tgo[4]~reg0_q\ & !\tgo[3]~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \go[4]~reg0_q\,
	datab => \tgo[4]~reg0_q\,
	datad => VCC,
	cin => \tgo[3]~15\,
	combout => \tgo[4]~16_combout\,
	cout => \tgo[4]~17\);

-- Location: FF_X49_Y29_N19
\tgo[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tgo[4]~16_combout\,
	asdata => \go[4]~reg0_q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tgo[4]~reg0_q\);

-- Location: LCCOMB_X49_Y29_N20
\tgo[5]~18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tgo[5]~18_combout\ = (\tgo[5]~reg0_q\ & (!\tgo[4]~17\)) # (!\tgo[5]~reg0_q\ & ((\tgo[4]~17\) # (GND)))
-- \tgo[5]~19\ = CARRY((!\tgo[4]~17\) # (!\tgo[5]~reg0_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tgo[5]~reg0_q\,
	datad => VCC,
	cin => \tgo[4]~17\,
	combout => \tgo[5]~18_combout\,
	cout => \tgo[5]~19\);

-- Location: LCCOMB_X48_Y29_N4
\~GND\ : cycloneiv_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: FF_X49_Y29_N21
\tgo[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tgo[5]~18_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tgo[5]~reg0_q\);

-- Location: LCCOMB_X49_Y29_N22
\tgo[6]~20\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tgo[6]~20_combout\ = (\tgo[6]~reg0_q\ & (\tgo[5]~19\ $ (GND))) # (!\tgo[6]~reg0_q\ & (!\tgo[5]~19\ & VCC))
-- \tgo[6]~21\ = CARRY((\tgo[6]~reg0_q\ & !\tgo[5]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tgo[6]~reg0_q\,
	datad => VCC,
	cin => \tgo[5]~19\,
	combout => \tgo[6]~20_combout\,
	cout => \tgo[6]~21\);

-- Location: FF_X49_Y29_N23
\tgo[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tgo[6]~20_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tgo[6]~reg0_q\);

-- Location: LCCOMB_X49_Y29_N24
\tgo[7]~22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tgo[7]~22_combout\ = \tgo[6]~21\ $ (\tgo[7]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \tgo[7]~reg0_q\,
	cin => \tgo[6]~21\,
	combout => \tgo[7]~22_combout\);

-- Location: FF_X49_Y29_N25
\tgo[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tgo[7]~22_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tgo[7]~reg0_q\);

-- Location: LCCOMB_X48_Y29_N8
\tch[0]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tch[0]~8_combout\ = (\ch[0]~reg0_q\ & (\tch[0]~reg0_q\ $ (VCC))) # (!\ch[0]~reg0_q\ & (\tch[0]~reg0_q\ & VCC))
-- \tch[0]~9\ = CARRY((\ch[0]~reg0_q\ & \tch[0]~reg0_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ch[0]~reg0_q\,
	datab => \tch[0]~reg0_q\,
	datad => VCC,
	combout => \tch[0]~8_combout\,
	cout => \tch[0]~9\);

-- Location: FF_X48_Y29_N9
\tch[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tch[0]~8_combout\,
	asdata => \ch[0]~reg0_q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tch[0]~reg0_q\);

-- Location: LCCOMB_X48_Y29_N10
\tch[1]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tch[1]~10_combout\ = (\tch[1]~reg0_q\ & ((\ch[1]~reg0_q\ & (\tch[0]~9\ & VCC)) # (!\ch[1]~reg0_q\ & (!\tch[0]~9\)))) # (!\tch[1]~reg0_q\ & ((\ch[1]~reg0_q\ & (!\tch[0]~9\)) # (!\ch[1]~reg0_q\ & ((\tch[0]~9\) # (GND)))))
-- \tch[1]~11\ = CARRY((\tch[1]~reg0_q\ & (!\ch[1]~reg0_q\ & !\tch[0]~9\)) # (!\tch[1]~reg0_q\ & ((!\tch[0]~9\) # (!\ch[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tch[1]~reg0_q\,
	datab => \ch[1]~reg0_q\,
	datad => VCC,
	cin => \tch[0]~9\,
	combout => \tch[1]~10_combout\,
	cout => \tch[1]~11\);

-- Location: FF_X48_Y29_N11
\tch[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tch[1]~10_combout\,
	asdata => \ch[1]~reg0_q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tch[1]~reg0_q\);

-- Location: LCCOMB_X48_Y29_N12
\tch[2]~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tch[2]~12_combout\ = ((\ch[2]~reg0_q\ $ (\tch[2]~reg0_q\ $ (!\tch[1]~11\)))) # (GND)
-- \tch[2]~13\ = CARRY((\ch[2]~reg0_q\ & ((\tch[2]~reg0_q\) # (!\tch[1]~11\))) # (!\ch[2]~reg0_q\ & (\tch[2]~reg0_q\ & !\tch[1]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ch[2]~reg0_q\,
	datab => \tch[2]~reg0_q\,
	datad => VCC,
	cin => \tch[1]~11\,
	combout => \tch[2]~12_combout\,
	cout => \tch[2]~13\);

-- Location: FF_X48_Y29_N13
\tch[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tch[2]~12_combout\,
	asdata => \ch[2]~reg0_q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tch[2]~reg0_q\);

-- Location: LCCOMB_X48_Y29_N14
\tch[3]~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tch[3]~14_combout\ = (\tch[3]~reg0_q\ & ((\ch[3]~reg0_q\ & (\tch[2]~13\ & VCC)) # (!\ch[3]~reg0_q\ & (!\tch[2]~13\)))) # (!\tch[3]~reg0_q\ & ((\ch[3]~reg0_q\ & (!\tch[2]~13\)) # (!\ch[3]~reg0_q\ & ((\tch[2]~13\) # (GND)))))
-- \tch[3]~15\ = CARRY((\tch[3]~reg0_q\ & (!\ch[3]~reg0_q\ & !\tch[2]~13\)) # (!\tch[3]~reg0_q\ & ((!\tch[2]~13\) # (!\ch[3]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tch[3]~reg0_q\,
	datab => \ch[3]~reg0_q\,
	datad => VCC,
	cin => \tch[2]~13\,
	combout => \tch[3]~14_combout\,
	cout => \tch[3]~15\);

-- Location: FF_X48_Y29_N15
\tch[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tch[3]~14_combout\,
	asdata => \ch[3]~reg0_q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tch[3]~reg0_q\);

-- Location: LCCOMB_X48_Y29_N16
\tch[4]~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tch[4]~16_combout\ = ((\ch[4]~reg0_q\ $ (\tch[4]~reg0_q\ $ (!\tch[3]~15\)))) # (GND)
-- \tch[4]~17\ = CARRY((\ch[4]~reg0_q\ & ((\tch[4]~reg0_q\) # (!\tch[3]~15\))) # (!\ch[4]~reg0_q\ & (\tch[4]~reg0_q\ & !\tch[3]~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ch[4]~reg0_q\,
	datab => \tch[4]~reg0_q\,
	datad => VCC,
	cin => \tch[3]~15\,
	combout => \tch[4]~16_combout\,
	cout => \tch[4]~17\);

-- Location: FF_X48_Y29_N17
\tch[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tch[4]~16_combout\,
	asdata => \ch[4]~reg0_q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tch[4]~reg0_q\);

-- Location: LCCOMB_X48_Y29_N18
\tch[5]~18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tch[5]~18_combout\ = (\ch[5]~reg0_q\ & ((\tch[5]~reg0_q\ & (\tch[4]~17\ & VCC)) # (!\tch[5]~reg0_q\ & (!\tch[4]~17\)))) # (!\ch[5]~reg0_q\ & ((\tch[5]~reg0_q\ & (!\tch[4]~17\)) # (!\tch[5]~reg0_q\ & ((\tch[4]~17\) # (GND)))))
-- \tch[5]~19\ = CARRY((\ch[5]~reg0_q\ & (!\tch[5]~reg0_q\ & !\tch[4]~17\)) # (!\ch[5]~reg0_q\ & ((!\tch[4]~17\) # (!\tch[5]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ch[5]~reg0_q\,
	datab => \tch[5]~reg0_q\,
	datad => VCC,
	cin => \tch[4]~17\,
	combout => \tch[5]~18_combout\,
	cout => \tch[5]~19\);

-- Location: FF_X48_Y29_N19
\tch[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tch[5]~18_combout\,
	asdata => \ch[5]~reg0_q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tch[5]~reg0_q\);

-- Location: LCCOMB_X48_Y29_N20
\tch[6]~20\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tch[6]~20_combout\ = (\tch[6]~reg0_q\ & (\tch[5]~19\ $ (GND))) # (!\tch[6]~reg0_q\ & (!\tch[5]~19\ & VCC))
-- \tch[6]~21\ = CARRY((\tch[6]~reg0_q\ & !\tch[5]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \tch[6]~reg0_q\,
	datad => VCC,
	cin => \tch[5]~19\,
	combout => \tch[6]~20_combout\,
	cout => \tch[6]~21\);

-- Location: FF_X48_Y29_N21
\tch[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tch[6]~20_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tch[6]~reg0_q\);

-- Location: LCCOMB_X48_Y29_N22
\tch[7]~22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \tch[7]~22_combout\ = \tch[7]~reg0_q\ $ (\tch[6]~21\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \tch[7]~reg0_q\,
	cin => \tch[6]~21\,
	combout => \tch[7]~22_combout\);

-- Location: FF_X48_Y29_N23
\tch[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \tch[7]~22_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => \Equal3~1_combout\,
	ena => \actual_s.end_park~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tch[7]~reg0_q\);

-- Location: LCCOMB_X30_Y29_N6
\Selector19~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector19~3_combout\ = (\Selector19~1_combout\) # ((\Selector19~0_combout\ & (\tt[2]~reg0_q\ $ (\Selector19~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector19~1_combout\,
	datab => \Selector19~0_combout\,
	datac => \tt[2]~reg0_q\,
	datad => \Selector19~2_combout\,
	combout => \Selector19~3_combout\);

-- Location: FF_X30_Y29_N7
\tt[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector19~3_combout\,
	ena => \tt[1]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tt[2]~reg0_q\);

ww_ts(0) <= \ts[0]~output_o\;

ww_ts(1) <= \ts[1]~output_o\;

ww_ts(2) <= \ts[2]~output_o\;

ww_ts(3) <= \ts[3]~output_o\;

ww_ts(4) <= \ts[4]~output_o\;

ww_ts(5) <= \ts[5]~output_o\;

ww_go(0) <= \go[0]~output_o\;

ww_go(1) <= \go[1]~output_o\;

ww_go(2) <= \go[2]~output_o\;

ww_go(3) <= \go[3]~output_o\;

ww_go(4) <= \go[4]~output_o\;

ww_go(5) <= \go[5]~output_o\;

ww_ch(0) <= \ch[0]~output_o\;

ww_ch(1) <= \ch[1]~output_o\;

ww_ch(2) <= \ch[2]~output_o\;

ww_ch(3) <= \ch[3]~output_o\;

ww_ch(4) <= \ch[4]~output_o\;

ww_ch(5) <= \ch[5]~output_o\;

ww_td(0) <= \td[0]~output_o\;

ww_td(1) <= \td[1]~output_o\;

ww_td(2) <= \td[2]~output_o\;

ww_td(3) <= \td[3]~output_o\;

ww_td(4) <= \td[4]~output_o\;

ww_td(5) <= \td[5]~output_o\;

ww_tgo(0) <= \tgo[0]~output_o\;

ww_tgo(1) <= \tgo[1]~output_o\;

ww_tgo(2) <= \tgo[2]~output_o\;

ww_tgo(3) <= \tgo[3]~output_o\;

ww_tgo(4) <= \tgo[4]~output_o\;

ww_tgo(5) <= \tgo[5]~output_o\;

ww_tgo(6) <= \tgo[6]~output_o\;

ww_tgo(7) <= \tgo[7]~output_o\;

ww_tch(0) <= \tch[0]~output_o\;

ww_tch(1) <= \tch[1]~output_o\;

ww_tch(2) <= \tch[2]~output_o\;

ww_tch(3) <= \tch[3]~output_o\;

ww_tch(4) <= \tch[4]~output_o\;

ww_tch(5) <= \tch[5]~output_o\;

ww_tch(6) <= \tch[6]~output_o\;

ww_tch(7) <= \tch[7]~output_o\;

ww_tt(0) <= \tt[0]~output_o\;

ww_tt(1) <= \tt[1]~output_o\;

ww_tt(2) <= \tt[2]~output_o\;

ww_tt(3) <= \tt[3]~output_o\;
END structure;


