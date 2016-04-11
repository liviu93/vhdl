-----------------------------------------------------------------------------------------------------
-- Laborator 3
-----------------------------------------------------------------------------------------------------

-- 1. Registru
--+----------+-------------+-----------+----------+--------+--------------------+-----------+--------+
--| Varianta | Num de biti | Front CLK | Resetare | Setare | Directie deplasare | incarcare | iesire |
--+----------+-------------+-----------+----------+--------+--------------------+-----------+--------+
--|        9 |           4 | crescator | sincrona | nu     | bidirectionala     | seriala   | seriala|
--+----------+-------------+-----------+----------+--------+--------------------+-----------+--------+

library ieee;
use ieee.std_logic_1164;
entity is lab3
	generic (size : integer := 4)
	port (
			clk 	: in std_logic;
			rst	: in std_logic;
			q		: out std_logic_vector(size-1 downto 0)
			dir	: in bit;
	);
end entity lab3;

architecture rtl of lab3 is
begin
process(clk, rst) begin
		if rising_edge(rst) then 
			q <= '0';
		else
			
end
end architecture rtl;


-- 2. Numarator
--+----------+-----+-------------+----------+-------+-----------------------+-----------+
--| Varianta | mod | Front CLK   | Resetare | tip   | secventa de numarare  | incarcare |
--+----------+-----+-------------+----------+-------+-----------------------+-----------+
--|        9 | 13  | descrescator| sincrona | direct|    2-14               | paralela  |
--+----------+-----+-------------+----------+-------+-----------------------+-----------+




















