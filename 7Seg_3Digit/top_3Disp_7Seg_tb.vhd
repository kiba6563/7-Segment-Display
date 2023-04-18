----------------------------------------------------------------------------------
--
-- Engineer: Kishore Bachu
-- Date: 16-April-2023
-- Title: Test Bench 
--
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- entity, no port list for test bench
entity top_3Disp_7Seg_tb is
--  Port ( );
end top_3Disp_7Seg_tb;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- architecture
architecture Behavioral of top_3Disp_7Seg_tb is

    -- Component declaration of UUT
    component top_3Disp_7Seg
        port (
                SYS_CLK     :   in std_logic;
                SYS_RESET   :   in std_logic;
                COUNT_EN    :   in std_logic;
                HEX0   	    :   out std_logic_vector(7 downto 0);
		HEX1   	    :   out std_logic_vector(7 downto 0);
		HEX2	    :   out std_logic_vector(7 downto 0)
             );
    end component;

    -- Component declaration of slow_clock module
    component slow_clock 
        port (
                SYS_CLK     :   in std_logic;
                SYS_RESET   :   in std_logic;
                SLOW_CLK    :   out std_logic
             );
    end component;
   
    
    -- Component declaration of count_3disp module
    component count_3disp 
        port (
                SLOW_CLK    :   in std_logic;
                SYS_RESET   :   in std_logic;
                COUNT_EN    :   in std_logic;
                HEX0   	    :   out std_logic_vector(7 downto 0);
		HEX1   	    :   out std_logic_vector(7 downto 0);
		HEX2   	    :   out std_logic_vector(7 downto 0)
             );
    end component;

    -- Test bench signals
    signal SYS_CLK_tb      :   std_logic;
    signal SYS_RESET_tb    :   std_logic;
    signal COUNT_EN_tb     :   std_logic;
    signal HEX0_tb         :   std_logic_vector(7 downto 0);
    signal HEX1_tb         :   std_logic_vector(7 downto 0);
    signal HEX2_tb         :   std_logic_vector(7 downto 0);

    -- constants
    constant    T:  time    :=  8ns; -- clock period
	 
begin

   -- UUT instantiation
   UUT  :   top_3Disp_7Seg
      port map (
                SYS_CLK     =>  SYS_CLK_tb,
                SYS_RESET   =>  SYS_RESET_tb,
                COUNT_EN    =>  COUNT_EN_tb,
                HEX0        =>  HEX0_tb,
		HEX1	    =>  HEX1_tb,
		 HEX2	    =>  HEX2_tb
                );
   
    -- Clock generation
    sync_proc   :   process
        begin
            SYS_CLK_tb <= '0';
            wait for T/2;       -- First half period
            SYS_CLK_tb <= '1';
            wait for T/2;       -- Second half period    
        end process sync_proc;  


    -- stimulus
    stim_proc   :   process
		begin
			SYS_RESET_tb <= '0', '1' after 4*T, '0' after 1000*T; 
			COUNT_EN_tb  <= '0', '1' after 2*T, '0' after 1000*T; 
			wait;
		end process stim_proc;

end Behavioral;
----------------------------------------------------------------------------------
