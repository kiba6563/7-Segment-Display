----------------------------------------------------------------------------------
-- 
-- Designer : Kishore Bachu
-- Date: 25-March-2023
-- Title: top_1Disp_7Seg.vhd. Seven Segment Display (1Digit).
-- 
-- Inputs: SYS_CLK, SYS_RESET
-- Outputs: 
-- Parent : None
-- Child : slow_clock.vhd, count_disp.vhd
-- 
--				 ----a---
--				|		 |
--			   f|		 |b
--				|		 |
--				 ----g---
--				|		 |
--			   e|		 |c
--				|		 |
--				 ----d---  oDP
--
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Entity
entity top_1Disp_7Seg is
      Port ( 
                SYS_CLK     :   in std_logic;       -- System Clock, 125Mhz
                SYS_RESET   :   in std_logic;       -- Active High Reset. Push Button BTN0
                COUNT_EN    :   in std_logic;       -- Count Enable. Slide Switch SW1
                SEG7_DISP   :   out std_logic_vector (8 downto 1) 
           );
end top_1Disp_7Seg;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
--Architecture
architecture Behavioral of top_1Disp_7Seg is

    -- Component slow_clock module
    component slow_clock is 
        port (
                SYS_CLK     :   in std_logic;
                SYS_RESET   :   in std_logic;
                SLOW_CLK    :   out std_logic
             );
    end component;
    
    -- Component count_disp module
    component count_disp is
        port (
                SLOW_CLK    :   in std_logic;
                SYS_RESET   :   in std_logic;
                COUNT_EN    :   in std_logic;
                SEG7_DISP   :   out std_logic_vector(8 downto 1)
             );
    end component;
   
   -- Intermediate signals
   signal   SLOW_CLK        :   std_logic;
    
begin

    -- Port map for slow_clock module
    SCLK    :   slow_clock
        port map (
                    SYS_CLK     =>  SYS_CLK,
                    SYS_RESET   =>  SYS_RESET,
                    SLOW_CLK    =>  SLOW_CLK
                 );
     
     -- Port map for count_disp module
     C_DISP  :  count_disp
        port map (
                    SLOW_CLK    =>  SLOW_CLK,
                    SYS_RESET   =>  SYS_RESET,
                    COUNT_EN    =>  COUNT_EN,
                    SEG7_DISP   =>  SEG7_DISP
                 );

end Behavioral;
----------------------------------------------------------------------------------