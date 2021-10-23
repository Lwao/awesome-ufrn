library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity BCD27 is
	port(
		bcd: in integer range 0 to 255;
		seg: out std_logic_vector (6 downto 0)
		);
end BCD27;

architecture conv of BCD27 is
	--signal n: integer;
begin
	-- anodo comum
	change: process(bcd)
	begin
		--n <= to_integer(bcd);
		case bcd is
			when 0 =>
				seg <= "1000000"; ---0
			when 1 =>
				seg <= "1111001"; ---1
			when 2 =>
				seg <= "0100100"; ---2
			when 3 =>
				seg <= "0110000"; ---3
			when 4 =>
				seg <= "0011001"; ---4
			when 5 =>
				seg <= "0010010"; ---5
			when 6 =>
				seg <= "0000010"; ---6
			when 7 =>
				seg <= "1111000"; ---7
			when 8 =>
				seg <= "0000000"; ---8
			when 9 =>
				seg <= "0010000"; ---9
			when others =>
				seg <= "1111111"; ---null
		end case;

	end process change;

end conv;


