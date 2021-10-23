library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity disp_divider is
	port(
		n 					  : in integer range 0 to 255;
		dis_0, dis_1, dis_2 : out integer range 0 to 255
		);
end disp_divider;


architecture conv of disp_divider is
	--signal temp: integer;
	
begin 
	--temp <= to_integer(n);
	--dis_0 <= to_unsigned((temp mod 10), 8);
	--dis_1 <= to_unsigned(((temp/10) mod 10), 8);
	--dis_2 <= to_unsigned((temp/100), 8);
	dis_0 <= n mod 10;
	dis_1 <= (n/10) mod 10;
	dis_2 <= n/100;
end conv;