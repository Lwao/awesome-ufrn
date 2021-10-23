library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU is
	port(	
		a : in std_logic_vector (4 downto 0);
		b : in std_logic_vector (4 downto 0);
		o : in std_logic_vector (2 downto 0);
		show : in integer;

		s : out std_logic_vector (4 downto 0);
		csig : out std_logic
	);
end ALU;

architecture proc of ALU is
	signal vta, vtb: std_logic_vector (5 downto 0) := "000000";
	signal temp_s, temp_a, temp_b : signed (5 downto 0) := "000000";

begin
	ula: process (show)
	begin
	if (show=3) then
		vta(3 downto 0) <= a(3 downto 0);
		vtb(3 downto 0) <= b(3 downto 0);
	
		if (a(4)='1') then
			temp_a <=  signed(not vta)+1;
		else
			temp_a <= signed(vta);
		end if;
		
		if (b(4)='1') then
			temp_b <=  signed(not vtb)+1;
		else
			temp_b <= signed(vtb);
		end if;
		
		temp_a(5) <= a(4);
		temp_b(5) <= b(4);
		
		case o is
			when "000" => -- soma
				temp_s <= temp_a + temp_b;
				s <= std_logic_vector(temp_s(4 downto 0));
				csig <= temp_s(5);
			when "001" => -- subtracao
				temp_s <= temp_a - temp_b;
				s <= std_logic_vector(temp_s(4 downto 0));
				csig <= temp_s(5);
			when "010" => -- comparacao
				if(temp_a>temp_b) then
					s <= "00100"; -- maior
				elsif(temp_a=temp_b) then
					s <= "00010"; -- igual
				else 
					s <= "00001"; -- menor
				end if;
			when "011" => -- and
				s <= a and b;
			when "100" => -- or
				s <= a or b;
			when "101" => -- not
				s <= not a;
			when "110" => -- xor
				s <= a xor b;
			when "111" => -- xnor
				s <= a xnor b;
		end case;
	else
		s <= "00000";
		csig <= '0';
	end if;
	end process ula;
end proc;


