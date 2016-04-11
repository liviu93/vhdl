---- basic gates 
--library ieee;
--use ieee.std_logic_1164.all;
--entity and_2 is
--	port (
--				a 		: in 	std_logic;
--				b		: in 	std_logic;
--				f		: out	std_logic
--			);
--end entity and_2;
--
--architecture rtl of and_2 is
--begin
--process(a, b)
--begin
--	f <= a and b;
--end process;
--end architecture rtl;
--------------------
--library ieee;
--use ieee.std_logic_1164.all;
--entity or_3 is
--	port (
--				a 		: in 	std_logic;
--				b		: in 	std_logic;
--				c		: in 	std_logic;
--				f		: out	std_logic
--			);
--end entity or_3;
--
--architecture rtl of or_3 is
--begin
--process(a, b, c)
--begin
--	f <= a or b or c;
--end process;
--end architecture rtl;
--
--------------------
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;  
--use ieee.std_logic_unsigned.all; 
--entity adder is
--	generic (size : integer);
--	port (
--				a 		: 	in std_logic_vector(size-1 downto 0);
--				b 		: 	in std_logic_vector(size-1 downto 0);
--				cin	: 	in std_logic;
--				cout	:	out std_logic; 
--				s		:  out std_logic_vector(size-1 downto 0)
--			);
--end entity adder;
--
--architecture rtl of adder is	
--	signal tmp: std_logic_vector(size downto 0); 
--begin
--process(a, b, cin , tmp)
--begin
--   tmp <= conv_std_logic_vector(  
--                (	conv_integer(a) + 
--						conv_integer(b) +  
--						conv_integer(cin)
--					 ), size+1);  
--    s 	<= tmp(size-1 downto 0);  
--    cout <= tmp(size);  
--end process;
--end architecture rtl;
--
--
--------------------------------------------------
--
--library ieee;
--use ieee.std_logic_1164.all;
--entity adder8421 is
--	port (
--				a 		: 	in std_logic_vector(3 downto 0);
--				b 		: 	in std_logic_vector(3 downto 0);
--				cin	: 	in std_logic;
--				cout	:	out std_logic; 
--				s		:  out std_logic_vector(3 downto 0)
--			);
--end entity adder8421;
--
--
--architecture rtl  of adder8421 is
--	component adder is
--		generic (size : integer := 4);
--		port (
--				a 		: 	in std_logic_vector(size-1 downto 0);
--				b 		: 	in std_logic_vector(size-1 downto 0);
--				cin	: 	in std_logic;
--				cout	:	out std_logic; 
--				s		:  out std_logic_vector(size-1 downto 0)
--			);
--	end component;
--	component and_2 is
--	port (
--				a 		: in 	std_logic;
--				b		: in 	std_logic;
--				f		: out	std_logic
--			);
--	end component;
--
--	component or_3 is
--	port (
--				a 		: in 	std_logic;
--				b		: in 	std_logic;
--				c		: in 	std_logic;
--				f		: out	std_logic
--			);
--	end component;
--
--
--	signal s1			: std_logic_vector(3 downto 0); 
--	signal cout1		: std_logic; 
--	signal coutand1	: std_logic;
--	signal coutand2	: std_logic;
--	signal coutor		: std_logic;
--begin
--	adder1: adder generic map (size => 4) 
--					port map (
--						a 		=> a,
--						b 		=> b,
--						cin 	=> cin,
--						cout	=> cout1,
--						s		=> s1
--					);
--					
--	adder2: adder generic map (size => 4) 
--					port map (
--						a(3)	=> '0',
--						a(2)	=> coutor,
--						a(1)	=> coutor,
--						a(0)	=> '0',
--						
--						b 		=> s1,
--						cin 	=> '0',
--						s		=> s
--					);
--	
--	andd1	: and_2 port map(
--					a => s1(3),
--					b => s1(2),
--					f => coutand1
--				);
--				
--	andd2	: and_2 port map(
--					a => s1(3),
--					b => s1(1),
--					f => coutand2
--				);	
--				
--	orr3	: or_3 port map(
--					a => coutand1,
--					b => coutand2,
--					c => cout1,
--					f => coutor	
--				);	
--				
--	cout <= coutor;
--	
--end architecture rtl;




----------------------------




------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;  
use ieee.std_logic_unsigned.all; 
entity adder8421 is
	generic (size : integer := 4);
	port (
				a 		: 	in std_logic_vector(size-1 downto 0);
				b 		: 	in std_logic_vector(size-1 downto 0);
				cin	: 	in std_logic;
				cout	:	out std_logic; 
				s		:  out std_logic_vector(size-1 downto 0)
			);
end entity adder8421;


architecture rtl  of adder8421 is
	signal s1			: std_logic_vector(size downto 0); 
	signal cout_i		: std_logic; 
	signal a2			: std_logic_vector(size-1 downto 0);
begin
process(a, b, cin, s1, a2, cout_i)
begin		
	s1 <= conv_std_logic_vector(  
                (	conv_integer(a) + 
						conv_integer(b) +  
						conv_integer(cin)
					 ), size+1);  
					 
	cout_i 	<= (s1(3) and s1(2)) or (s1(3) and s1(1)) or s1(4);
	
	a2 <= '0' & cout_i & cout_i & '0';
	s <= conv_std_logic_vector(  
                (	conv_integer(a2) + 
						conv_integer(s1(3 downto 0))
					 ), size);  
					 
	cout 		<= cout_i;
end process;
---------------

	
end architecture rtl;




----------------------------





