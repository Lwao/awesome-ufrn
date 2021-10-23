
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity project3 is
	port(
		a     : in std_logic_vector (4 downto 0); -- switch, entradas numéricas +/-
		
		b_op  : in std_logic; -- button, botão operacional para confirmar a escolha de a, b e operação
		b_rst : in std_logic; --button, botão que retorna ao estado que recebe a primeira entrada
		rst 	: in std_logic;
		
		op_in : in std_logic_vector (2 downto 0); -- switch, seletores para a escolha da operação
		-- 1 soma
		-- 2 subtracao
		-- 3 comparacao
		-- 4 and
		-- 5 or
		-- 6 not
		-- 7 xor 
		-- 8 xnor		

		s    : buffer std_logic_vector (4 downto 0); -- out integer, saída para valor inteiro 
		csig : buffer std_logic; 
		--estado : buffer integer;

		clk_in : in std_logic; -- clock 50Mhz (FPGA)
		clk : buffer std_logic; -- clock 1Hz (FPGA)
		--clk : in std_logic; -- clock (SIMULAÇÃO)

		dis_0, dis_1, dis_2, dis_3, dis_4 : out std_logic_vector (6 downto 0) -- disp7, saídas para Xdisp
	);

end project3; 

architecture proc of project3 is
	
	type state is (init, wait_a, wait_b, wait_o, unit); --s0, s1, s2, s3, s4, s5, s6, s7
	signal actual_s, next_s: state;
	signal a_temp, b_temp: std_logic_vector (4 downto 0) := "00000";
	signal o_temp: std_logic_vector (2 downto 0) := "000";
	signal show: integer := 0;
	
	signal d0, d1, d2, d3, d4: std_logic_vector (3 downto 0) := "0000";
	
	component divider is
	port(
		a 	  : in std_logic_vector (4 downto 0);
		show : in integer;
		csig : in std_logic;
		op   : in std_logic_vector(2 downto 0);
		s    : in std_logic_vector (4 downto 0);
		dis_0, dis_1, dis_2, dis_3, dis_4: out std_logic_vector (3 downto 0)
		);
	end component;
	
	component ALU is
	port(	
		a    : in std_logic_vector (4 downto 0);
		b    : in std_logic_vector (4 downto 0);
		o    : in std_logic_vector (2 downto 0);
		show : in integer;

		s    : out std_logic_vector (4 downto 0);
		csig : out std_logic
	);
	end component;
	
	component BCD27 is
	port(
		bcd : in std_logic_vector (3 downto 0);
		seg : out std_logic_vector (6 downto 0)
		);
	end component;
		
	component ClockDiv is
   port(
	   clkIn  : in std_logic;
		clkOut : out std_logic
	);
	end component;



begin 
	clock : ClockDiv port map(clk_in, clk);
	
	state_register: process(clk, rst)
	begin 
		if (rst='1') then
			--s <= "00000";
			--csig <= '0';
			--a_temp <= "00000";
			--b_temp <= "00000";
			--o_temp <= "000";
			show <= 5;
			--estado <= 0;
			actual_s <= init;
		elsif rising_edge(clk) then
			case actual_s is 
				when init =>
					--a_temp <= "00000";
					--b_temp <= "00000";
					--o_temp <= "000";
					--estado <= 1;
					show <= 5;
					next_s <= wait_a;
				when wait_a =>
					--estado <= 2;
					show <= 0;
					next_s <= wait_a;
					if (b_op='1') then
						next_s <= wait_b;
						a_temp <= a;
						--show <= 1;
					--else
						--next_s <= wait_a;
						--show <=0;
					end if;
				when wait_b =>
					--estado <= 3;
					show <= 1;
					next_s <= wait_b;
					if (b_op='1') then
						next_s <= wait_o;
						b_temp <= a;
						--show <= 2;
					--else
						--next_s <= wait_b;
						--show <= 1;
					end if;
				when wait_o =>
					--estado <= 4;
					show <= 2;
					next_s <= wait_o;
					if (b_op='1') then
						next_s <= unit;
						o_temp <= op_in;
						--show <= 3;
					--else
						--next_s <= wait_o;
						--show <= 2;
					end if;
				when unit =>
					--estado <= 5;
					show <= 3;
					if (b_rst='0') then
						next_s <= unit;
						--show <= 3;
					else
						--next_s <= init;
						next_s <= wait_a;
						--show <= 0;
					end if;
			end case;
			actual_s <= next_s;
		end if;
	end process state_register;
	procALU : ALU port map (a_temp, b_temp, o_temp, show, s, csig);
	display : divider port map (a, show, csig, op_in, s, d0, d1, d2, d3, d4);
	p_disp4 : BCD27 port map (d4, dis_4);
	p_disp3 : BCD27 port map (d3, dis_3);
	p_disp2 : BCD27 port map (d2, dis_2);
	p_disp1 : BCD27 port map (d1, dis_1);
	p_disp0 : BCD27 port map (d0, dis_0);
end proc ;