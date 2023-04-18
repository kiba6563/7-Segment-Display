----------------------------------------------------------------------------------
--
-- Designer : Kishore Bachu
-- Date: 15-April-2023
-- Title: top_3Disp_7Seg.vhd. Seven Segment Display (3Digit).
-- 
-- Inputs: SYS_CLK, SYS_RESET, COUNT_EN
-- Outputs: HEX0, HEX1, HEX2
-- Parent : None
-- Child : slow_clock.vhd, count_disp.vhd
-- 
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Entity
entity top_3Disp_7Seg is
    Port (
            SYS_CLK     :   in std_logic;    						-- System Clock, 50Mhz                   
            SYS_RESET   :   in std_logic;    						-- Active LOW Reset. Push Button KEY0   
            COUNT_EN    :   in std_logic;    						-- Count Enable. Slide Switch SW0
            HEX0   		:   out std_logic_vector(7 downto 0);  -- 7Segment HEX0
				HEX1			:	 out std_logic_vector(7 downto 0);  -- 7Segment HEX1
				HEX2			:	 out std_logic_vector(7 downto 0)   -- 7Segment HEX2
				
          );
end top_3Disp_7Seg;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Architecture
architecture Behavioral of top_3Disp_7Seg is

    -- Component slow_clock module
    component slow_clock is
        port (
                SYS_CLK     :   in std_logic;
                SYS_RESET   :   in std_logic;
                SLOW_CLK    :   out std_logic
             );
    end component slow_clock;
   
    -- Component count_3disp module
    component count_3disp is
        port (
                SLOW_CLK    :   in std_logic;
                SYS_RESET   :   in std_logic;
                COUNT_EN    :   in std_logic;
                HEX0		    :   out std_logic_vector(7 downto 0);
					 HEX1		    :   out std_logic_vector(7 downto 0);
					 HEX2		    :   out std_logic_vector(7 downto 0)
             );
    end component count_3disp;
    
   -- Intermediate signals
   signal   SLOW_CLK        :   std_logic;
    
begin    

    -- Port map for slow_clock module 
    SCK     :   slow_clock
        port map (
                    SYS_CLK     =>  SYS_CLK,
                    SYS_RESET   =>  SYS_RESET,
                    SLOW_CLK    =>  SLOW_CLK
                  );
         
    -- Port map for count_disp module
    C_DISP  :  count_3disp
        port map (
                    SLOW_CLK    =>  SLOW_CLK,
                    SYS_RESET   =>  SYS_RESET,
                    COUNT_EN    =>  COUNT_EN,
                    HEX0   	  =>  HEX0,
						  HEX1   	  =>  HEX1,
						  HEX2   	  =>  HEX2
                  );
    
end Behavioral;
----------------------------------------------------------------------------------