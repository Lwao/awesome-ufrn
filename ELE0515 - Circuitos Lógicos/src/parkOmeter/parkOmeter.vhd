library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity parkOmeter is
	port(
		b, c, f, rst, d: in std_logic;
		A: in std_logic_vector (2 downto 0);
		-- 001: 25  ¢ = 1
		-- 010: 50  ¢ = 2
		-- 100: 100 ¢ = 4
		clk: in std_logic;
		estado : buffer integer;
		ts, go, ch, td : buffer std_logic_vector (5 downto 0); 
		tgo, tch : buffer std_logic_vector (7 downto 0);
		tt : buffer std_logic_vector (3 downto 0)
	);

end parkOmeter; 

architecture behavior of parkOmeter is

	type state is (wait_b, sel_type, add, time_count, end_park); 
	signal actual_s, next_s: state;
	signal count : integer := 0;
	signal money : std_logic_vector (5 downto 0) := "000000";
	signal ttime : std_logic_vector (3 downto 0) := "0000";
	--signal td, ts, tt, a, b : std_logic_vector (4 downto 0) := "00000";
	--signal o_temp: std_logic_vector (2 downto 0) := "000";
	--signal show: integer := 0;
	
begin 
	park: process(rst, clk)
	begin 
		if (rst='1') then
			td <= "000000";
			tgo <= "00000000";
			tch <= "00000000";
			actual_s <= wait_b;
		elsif rising_edge(clk) then
			case actual_s is
				when wait_b =>
					estado <= 0;
					ts <= "000000";
					go <= "000000";
					ch <= "000000";
					tt <= "0000";
					if (b='1') then
						next_s <= sel_type;
					else
						next_s <= wait_b;
					end if;
				when sel_type =>
					estado <= 1;
					if (f = '1') then
						next_s <= time_count;
					elsif (f = '0' and c = '0') then
						next_s <= sel_type;
					elsif (f = '0' and c = '1') then
						next_s <= add;
					end if;
				when add =>
					estado <= 2;
					next_s <= sel_type;
					ts <= std_logic_vector(to_unsigned(to_integer(unsigned(ts))+to_integer(unsigned(A)), 6));
					if (to_integer(unsigned(A)) = 1) then
						count <= count + 1;
					end if;
					if (to_integer(unsigned(ts)) < 16) then 
						case to_integer(unsigned(A)) is 
							when 2 =>
								tt <= std_logic_vector(to_unsigned(to_integer(unsigned(tt))+1, 4));
							when 4 =>
								tt <= std_logic_vector(to_unsigned(to_integer(unsigned(tt))+2, 4));
							when others =>
								tt <= tt;
						end case;
						if (count = 2) then
							count <= 0;
							tt <= std_logic_vector(to_unsigned(to_integer(unsigned(tt))+1, 4));
						end if;
					end if;
					if (count = 2) then
						count <= 0;
					end if;
				when time_count =>
					estado <= 3;
					tt <= std_logic_vector(to_unsigned(to_integer(unsigned(tt))-1, 4));
					next_s <= time_count;
					if ((to_integer(unsigned(tt))=0) or (d = '1')) then
						next_s <= end_park;
					--elsif ((to_integer(unsigned(tt)) > 0) and (d = '0')) then 
						--next_s <= time_count;
					end if;
				when end_park =>
					next_s <= wait_b;
					estado <= 4;
					tt <= "0000";
					td <= std_logic_vector(to_unsigned(to_integer(unsigned(td))+1, 6));
					if (to_integer(unsigned(ts)) < 16) then
						go <= ts;
						ch <= "000000";
						tch <= tch;
						tgo <= std_logic_vector(to_unsigned(to_integer(unsigned(tgo))+to_integer(unsigned(ts)), 8));
					elsif (to_integer(unsigned(ts)) >= 16) then
						go <= "010000";
						ch <= std_logic_vector(to_unsigned(to_integer(unsigned(ts))-16, 6));
						tch <= std_logic_vector(to_unsigned(to_integer(unsigned(tch))+to_integer(unsigned(ts))-16, 8));
						tgo <= std_logic_vector(to_unsigned(to_integer(unsigned(tgo))+16, 8));
					end if;
			end case;
			actual_s <= next_s;
		end if;
	end process park;
end behavior;