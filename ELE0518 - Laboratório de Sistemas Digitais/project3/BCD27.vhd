library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity BCD27 is
	port(
		bcd: in std_logic_vector (3 downto 0);
		seg: out std_logic_vector (6 downto 0)
		);
end BCD27;

architecture conv of BCD27 is
	
begin
	-- anodo comum
	change: process(bcd) 
	begin
		case bcd is
			when "0000" =>
				seg <= "1000000"; ---0
			when "0001" =>
				seg <= "1111001"; ---1
			when "0010" =>
				seg <= "0100100"; ---2
			when "0011" =>
				seg <= "0110000"; ---3
			when "0100" =>
				seg <= "0011001"; ---4
			when "0101" =>
				seg <= "0010010"; ---5
			when "0110" =>
				seg <= "0000010"; ---6
			when "0111" =>
				seg <= "1111000"; ---7
			when "1000" =>
				seg <= "0000000"; ---8
			when "1001" =>
				seg <= "0010000"; ---9
			when "1010" =>
				seg <= "1111111"; ---10 or positive
			when "1011" =>
				seg <= "0111111"; ---11 or negative
			--when "1100" =>
				--seg <= "0001000"; ---12 or A
			--when "1101" =>
				--seg <= "0000000"; ---13 or B
			when "1110" =>
				seg <= "1110111"; ---14 or underline
			--when "1111" =>
				--seg <= "1100010"; -- 15 or o
			when others =>
				seg <= "1111111"; ---null
		end case;
	end process change;
end conv;