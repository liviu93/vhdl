--3. Bistabilul Dff cu resetare asincronă
architecture example_r of dff is 
begin 
process (clk, reset) 
begin 
if (reset = '1') then 
q <= '0'; 
elsif rising_edge (clk) then 
q <= d; 
end if; 
end process; 
end example_r; 


--5. Registru pe 8 biți, activ pe frontul crescător al semnalului de ceas.
library ieee;
use ieee.std_logic_1164.all;
entity reg8 is
   port (d: in std_logic_vector (7 downto 0);
            clk: in std_logic;
            q: out std_logic_vector (7 downto 0));
end reg8;
architecture ex_reg of reg8 is
    begin
       process (clk)
          begin
            if (clk'event and clk = '1') then
           q <= d;
           end if;
    end process;
end ex_reg;

--7. Descrierea unui registru de deplasare la stânga de 8 biţi cu semnale de  validare a ceasului, intrare 
--serială şi ieşire serială. Pentru descrierea registrului de deplasare se utilizează o construcţie for loop. 

library ieee;
use ieee.std_logic_1164.all;
entity reg8_depl is
   port (clk, ce, si: in std_logic;
             so:            out std_logic);
end reg8_depl;
architecture reg_depl of reg8_depl is
    signal tmp: std_logic_vector (7 downto 0);
     begin
       process (clk)
           begin
             if (clk'event and clk = '1') then
                if (ce = '1') then
                for i in 0 to 6 loop
                   tmp(i+1) <= tmp(i);
                end loop;
                   tmp(0) <= si; -- încărcare serială
                end if;
            end if;
       end process;
   so <= tmp(7); -- ieșire serială
end reg_depl; 

--9. Numărător direct de 8 biţi cu semnale asincrone de resetare şi setare.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity num8 is
   port (clk: in std_logic;
             rst, set: in std_logic;
             en, load: in std_logic;
             data: in std_logic_vector (7 downto 0);
              num: out std_logic_vector (7 downto 0));
end num8;
architecture arh_num8 of num8 is
    signal tmp: std_logic_vector (7 downto 0);
      begin
        cnt: process (rst, set, clk)
              begin
                   if (rst = '1') then
                        tmp <= (others => '0');
                    elsif (set = '1') then
                        tmp <= (others => '1');
                    elsif (clk'event and clk = '1') then
                        if (load = '1') then
                             tmp <= data;
                    elsif (en = '1') then
                             tmp <= tmp + 1;
                    end if;
                end if;
         end process cnt;
            num <= tmp;
end arh_num8;











