library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity divider is
	port(
		a : in std_logic_vector (4 downto 0);
		show : in integer;
		csig : in std_logic;
		op : in std_logic_vector(2 downto 0);
		s: in std_logic_vector (4 downto 0);
		dis_0, dis_1, dis_2, dis_3, dis_4: out std_logic_vector (3 downto 0)
		);
end divider;


architecture conv of divider is
	signal temp_s, d1, d0: signed (4 downto 0) := "00000";
	signal vta: std_logic_vector (4 downto 0) := "00000";
	signal opt, optt: std_logic_vector (3 downto 0) := "0000";
	
begin 
	div: process(show)
	begin
		case show is
			when 0 =>
				vta(3 downto 0) <= a(3 downto 0);
				temp_s <= signed(vta);
				if(a(4)='1') then --checa se é positivo ou negativo
					dis_2 <= "1011";
				else
					dis_2 <= "1010";
				end if;
				dis_1 <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_s))/10, 4));
				dis_0 <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_s)) mod 10, 4));
				--dis_1 <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_s))/10, 4));
				--dis_0 <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_s)) mod 10, 4));
				dis_3 <= "1110";
				dis_4 <= "0001";
			when 1 =>
				vta(3 downto 0) <= a(3 downto 0);
				temp_s <= signed(vta);
				if(a(4)='1') then --checa se é positivo ou negativo
					dis_2 <= "1011";
				else
					dis_2 <= "1010";
				end if;
				dis_1 <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_s))/10, 4));
				dis_0 <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_s)) mod 10, 4));
				--dis_1 <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_s))/10, 4));
				--dis_0 <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_s)) mod 10, 4));
				dis_3 <= "1110";
				dis_4 <= "0010";
			when 2 =>
				opt(2 downto 0) <= op(2 downto 0);
				optt <= std_logic_vector(to_unsigned(to_integer(unsigned(opt))+1, 4));
				dis_0 <= optt;
				dis_1 <= "1110";
				dis_2 <= "1110";
				dis_3 <= "1110";
				dis_4 <= "0011";
			when 3 =>
				opt(2 downto 0) <= op(2 downto 0);
				optt <= std_logic_vector(to_unsigned(to_integer(unsigned(opt))+1, 4));
				dis_4 <= optt;
				if (to_integer(unsigned(op))<2) then -- se é soma ou subtração
					if(csig='1') then --checa se é positivo ou negativo
						dis_2 <= "1011";
						temp_s <= signed(not s)+1;
					else
						dis_2 <= "1010";
						temp_s <= signed(s);
					end if;
					if (temp_s(4)='1') then -- checa se extrapolou
						dis_3 <= "0001";
					else
						dis_3 <= "0000";
					end if;
					dis_1 <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_s))/10, 4));
					dis_0 <= std_logic_vector(to_unsigned(to_integer(unsigned(temp_s)) mod 10, 4));
				else
					if (s(3)='1') then
						dis_3 <= "0001";
					else
						dis_3 <= "0000";
					end if;
					if (s(2)='1') then
						dis_2 <= "0001";
					else
						dis_2 <= "0000";
					end if;
					if (s(1)='1') then
						dis_1 <= "0001";
					else
						dis_1 <= "0000";
					end if;
					if (s(0)='1') then
						dis_0 <= "0001";
					else
						dis_0 <= "0000";
					end if;
				end if;
			when others =>
				dis_0 <= "1110";
				dis_1 <= "0010";
				dis_2 <= "0100";
				dis_3 <= "1110";
				dis_4 <= "1111";
		end case;
	end process div;
end conv;

