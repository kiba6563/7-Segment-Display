----------------------------------------------------------------------------------
-- 
-- Designer : Kishore Bachu
-- Date: 15-April-2023
-- Title: slow_clock. Generates a slow clock from the input 50Mhz on 
-- DE10-Lite Altera FPGA board
-- 
-- Inputs: SYS_CLK, SYS_RESET
-- Outputs: SLOW_CLK
-- Parent : top_3Disp_7Seg.vhd
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
-- Entity
entity slow_clock is
    Port ( 
            SYS_CLK     :   in std_logic;       -- System Clock, 50MHz
            SYS_RESET   :   in std_logic;       -- Active Low Reset. Push Button KEY0
            SLOW_CLK    :   out std_logic       -- Slow Clock output
         );
end slow_clock;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Architecture
architecture Behavioral of slow_clock is

    signal  slow_clk_counter    :   std_logic_vector (27 downto 0); -- slow clock counter
    
    -- clk_divider (50000000) set for 1sec time delay
    constant clk_divider        :   integer := 50000000;      --uncomment for FPGA implementation  
--		constant clk_divider        :   integer := 1;           --uncomment for simulation  
     
begin
    
    -- Process block for slow_clk_counter
    process (SYS_CLK, SYS_RESET)
    begin
        if (SYS_CLK' event and SYS_CLK = '1') then
            if (SYS_RESET = '0') then                       --Reset counter
                slow_clk_counter <= x"0000000";             --Counter is 28-bit => 7hex characters
            elsif (slow_clk_counter = clk_divider) then     --Reset counter if counter reaches clk_divider
                slow_clk_counter <= x"0000000";
            else
                slow_clk_counter <= slow_clk_counter + 1;   --Increment counter on rising edge of SYS_CLK
            end if;
         end if;
    end process;

    -- Process block for SLOW_CLK 
    process (slow_clk_counter)
    begin
        if (slow_clk_counter = clk_divider) then            --Set SLOW_CLK half period to HIGH when counter
            SLOW_CLK <= '1';                                --reaches clk_divider
        else                                                --Set SLOW_CLK half period to LOW    
            SLOW_CLK <= '0';                                
        end if;
    end process;
    
end Behavioral;
----------------------------------------------------------------------------------