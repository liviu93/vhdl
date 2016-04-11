library ieee;
use ieee.std_logic_1164.all;
entity quartus is 
	port (
				x1, x2, x3, x4 : in 	std_logic;
				f					: out std_logic
			);
end entity quartus;



--- behavioral 
--architecture quartus_beh of quartus is
--begin
-- process(x1, x2, x3, x4)
--		f <= (x2 and (not x4)) or (x3 and (not x4)) or (x1 and (not x4));
-- end process;
--end quartus_beh;




--- structural

--- and(a, not_b)
library ieee;
use ieee.std_logic_1164.all;
entity and2_1inv is
	port (
				a 		: in 	std_logic;
				b_inv	: in 	std_logic;
				f		: out	std_logic
			);
end entity and2_1inv;

architecture rtl of and2_1inv is
begin
process (a, b_inv)
begin
	f <= a and (not b_inv);
end process;
end architecture rtl;
-------------------------

--- or(a, b, c)
library ieee;
use ieee.std_logic_1164.all;
entity orr3 is
	port (
				a 		: in 	std_logic;
				b		: in 	std_logic;
				c		: in 	std_logic;
				f		: out	std_logic
			);
end entity orr3;

architecture rtl of orr3 is
begin
process(a, b, c)
begin
	f <= a or b or c;
end process;
end architecture rtl;
-------------------------

architecture rtl of quartus is
	component and2_1inv is
	port (
				a 		: in 	std_logic;
				b_inv	: in 	std_logic;
				f		: out	std_logic
			);
	end component;
	component orr3 is
	port (
				a 		: in 	std_logic;
				b		: in 	std_logic;
				c		: in 	std_logic;
				f		: out	std_logic
			);
	end component;
	signal and1_out, and2_out, and3_out : std_logic;
begin
	and1 : and2_1inv port map(
		a 		=> x2,
		b_inv	=> x4,
		f		=> and1_out
	); 
	and2 : and2_1inv port map(
		a 		=> x3,
		b_inv	=> x4,
		f		=> and2_out
	); 
	
	and3 : and2_1inv port map(
		a 		=> x1,
		b_inv	=> x4,
		f		=> and3_out
	); 

	or_3 : orr3 port map (
		a => and1_out,
		b => and2_out,
		c => and3_out,
		f => f
	);
	
end architecture rtl;



--- f = sum(2,4,6,8,10,12,14)
--- y = x2 & /x4  |  x3 & /x4 | x1 & /x4

