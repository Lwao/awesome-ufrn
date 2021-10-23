library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity lab7 is
	port(
		h				: in std_logic;
		clk_in, rst	: in std_logic;
		clk			: buffer std_logic;	
		a				: out std_logic_vector (4 downto 0)
	);
end lab7;

architecture mde1 of lab7 is
	-- s0 = 00 000
	-- s1 = 10 000
	-- s2 = 01 000
	-- s3 = 00 100
	-- s4 = 00 010
	-- s5 = 00 001
	type state is (s0, s1, s2, s3, s4, s5, s6);
	signal actual_s, next_s: state;
	
	component ClockDiv is
   port(
	   clkIn  : in std_logic;
		clkOut : out std_logic
	);
	end component;
begin 
	clock : ClockDiv port map(clk_in, clk);
	state_register: process(clk, rst)
		variable count : integer := 1;
	begin 
		-- rst
		if (rst='1') then
			a <= "00000";
			actual_s <= s0;
			count := 1;
		-- clk
		elsif rising_edge(clk) then
		-- h=1
				if (h='1') then
					case actual_s is
						when s0 =>
							a <= "00000";
							next_s <= s1;
						when s1 =>
							a <= "10000";
							next_s <= s2;
						when s2 =>
							a <= "01000";
							next_s <= s3;
						when s3 =>
							a <= "00100";
							next_s <= s4;
						when s4 =>
							a <= "00010";
							next_s <= s5;
						when s5 =>
							a <= "00001";
							if(count=3) then
								next_s <= s6;
							else
								next_s <= s0;
								count := count + 1;
							end if;
						when s6 =>
							a <= "11111";
							next_s <= s6;
					end case;
			-- h=0
				elsif (h='0') then
					case actual_s is
						when s0 =>
							a <= "00000";
						when s1 =>
							a <= "10000";
						when s2 =>
							a <= "01000";
						when s3 =>
							a <= "00100";
						when s4 =>
							a <= "00010";
						when s5 =>
							a <= "00001";
						when s6 =>
							a <= "11111";
							count := 1;
					end case;
					next_s <= s0;
				end if;
			end if;
			actual_s <= next_s;
	end process state_register;
end mde1;