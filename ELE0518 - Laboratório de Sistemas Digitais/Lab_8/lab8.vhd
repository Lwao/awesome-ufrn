library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity lab8 is
	port(
		e 						  : in std_logic_vector (1 downto 0);
		c 			  	 		  : in std_logic;
		d 						  : out std_logic;
		s : buffer integer range 0 to 255;
		--sum 					  : buffer integer range 0 to 255;;
		clk_in, rst : in std_logic;
		clk					  : buffer std_logic;
		dis_0, dis_1, dis_2 : out std_logic_vector (6 downto 0)
	);
end lab8;

architecture mde2 of lab8 is
	-- i
	--- Estado de inicialização, d=0 e sum=0	
	-- w
	--- Estado de espera, esperando moedas a serem somadas, ou o botão para sair doce
	-- a
	--- Estado de soma, que irá somar as moedas inseridas ao montante
	-- o
	--- Estado de saida, que irá depejar o doce
	-- n
	--- Estado de subtração, que irá deduzir do montante o valor do doce
	
	type state is (init, waitc, adder, dispenser, subtract);
	signal actual_s, next_s: state;
	signal d2, d1, d0: integer range 0 to 255 := 0;
	--signal s: integer;
	
	component disp_divider is
	port(
		n 					  : in integer range 0 to 255;
		dis_0, dis_1, dis_2 : out integer range 0 to 255
		);
	end component;
	
	component BCD27 is
	port(
		bcd : in integer range 0 to 255;
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
			d <= '0';
			s <= 0;
			--sum <= "00000000";
			actual_s <= init;
		elsif rising_edge(clk) then
			case actual_s is
				when init =>
					d <= '0';
					s <= 0;
					--sum <= "00000000";
					next_s <= waitc;
				when waitc =>
					d <= '0';
					--s <= to_integer(sum); 
					if ((e(1)='0') and (e(0)='0') and (c='0') and (s<80)) then
						next_s <= waitc;
					elsif (((e(1)='1') and (e(0)='0')) or ((e(1)='0') and (e(0)='1')) or ((e(1)='1') and (e(0)='1'))) then
						next_s <= adder;
					elsif ((e(1)='0') and (e(0)='0') and (s>=80) and (c='1')) then
						next_s <= dispenser;
					end if;
				when adder =>
					d <= '0';
					--s <= to_integer(sum);
					if ((e(1)='1') and (e(0)='0')) then
						s <= s + 10;
					elsif ((e(1)='0') and (e(0)='1')) then
						s <= s + 25;
					elsif ((e(1)='1') and (e(0)='1')) then
						s <= s + 50;
					end if;
					next_s <= waitc;
				when dispenser =>
					d <= '1';
					next_s <= subtract;
				when subtract =>
					d <= '0';
					--s <= to_integer(sum);
					s <= s - 80;
					next_s <= waitc;
			end case;
			--sum <= to_unsigned(s, 8);
			--sum(0) <= '0';
			actual_s <= next_s;
		end if;
	end process state_register;
	p_3dnum : disp_divider port map (s, d0, d1, d2);
	p_disp2 : BCD27 port map (d2, dis_2);
	p_disp1 : BCD27 port map (d1, dis_1);
	p_disp0 : BCD27 port map (d0, dis_0);
end mde2;