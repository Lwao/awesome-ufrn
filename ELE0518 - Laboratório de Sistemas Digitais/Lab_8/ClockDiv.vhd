--Divisao do clock

library ieee;
use ieee.std_logic_1164.all;

entity ClockDiv is
   port(
	   clkIn  : in std_logic;
		clkOut : out std_logic
	);
end ClockDiv;

architecture clk1Hz of ClockDiv is

signal count : integer range 0 to 50000001;

begin
   clkOut <= '1' when count = 50000000 else '0';

	divisaoClock : process(clkIn)
	begin
	   if(clkIn'event and clkIn='1') then
		   count <= count + 1;
		end if;
		if(count=50000000) then
		   count <= 0;
		end if;
	end process divisaoClock;
end clk1Hz;