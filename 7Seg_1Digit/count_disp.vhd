----------------------------------------------------------------------------------
-- 
-- Designer : Kishore Bachu
-- Date: 25-March-2023
-- Title: count_disp. Counter module, counts 0 to 9 and displays on 7 segment (1digit)
-- 
-- Inputs: SYS_CLK, SYS_RESET, COUNT_EN
-- Outputs: SEG7_DISP
-- Parent : top_1Disp_7Seg.vhd
-- Child : None
--
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_signed.all;

----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
entity count_disp is
      Port ( 
                SLOW_CLK    :   in std_logic;
                SYS_RESET   :   in std_logic;
                COUNT_EN    :   in std_logic;
                SEG7_DISP   :   out std_logic_vector(8 downto 1)
            );
end count_disp;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
architecture Behavioral of count_disp is

    --Intermediate signals
    signal  counter :   std_logic_vector(3 downto 0); 

begin

    count:  process (SLOW_CLK, SYS_RESET)
    begin
        if (rising_edge(SLOW_CLK)) then             -- look for clock edge
            if (SYS_RESET = '1') then               -- on reset high
                counter <= (others => '0');         -- set counter to 0
            elsif (COUNT_EN = '1') then            -- on count enable
                 counter <= counter + 1;            -- increment counter
            else
                counter <= (others => '0');
            end if;
         end if;              
                
    end process count;

    with counter select
        SEG7_DISP <= "01111111" when "0000",  -- Display 0
                     "00011100" when "0001",  -- Display 1
                     "10111011" when "0010",  -- Display 2   
                     "10111110" when "0011",  -- Display 3
                     "11011100" when "0100",  -- Display 4
                     "11101110" when "0101",  -- Display 5
                     "11101111" when "0110",  -- Display 6
                     "00111100" when "0111",  -- Display 7
                     "11111111" when "1000",  -- Display 8
                     "11111110" when "1001",  -- Display 9
                     "10111111" when "1010",  -- Display a
                     "11001111" when "1011",  -- Display b
                     "01101011" when "1100",  -- Display c
                     "10011111" when "1101",  -- Display d
                     "11101011" when "1110",  -- Display e
                     "11101001" when "1111",  -- Display f
                     "00000000" when others;  -- Display off
                     
end Behavioral;
----------------------------------------------------------------------------------