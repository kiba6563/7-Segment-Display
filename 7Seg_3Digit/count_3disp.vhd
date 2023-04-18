----------------------------------------------------------------------------------
-- 
-- Designer : Kishore Bachu
-- Date: 15-April-2023
-- Title: count_3disp. Counter module, counts 000 to 999 and displays on 7 segment
-- 
-- Inputs: SYS_CLK, SYS_RESET, COUNT_EN
-- Outputs: HEX0, HEX1, HEX2
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
entity count_3disp is
      Port ( 
                SLOW_CLK    :   in std_logic;
                SYS_RESET   :   in std_logic;
                COUNT_EN    :   in std_logic;
					 HEX0			 :   out std_logic_vector(7 downto 0);
					 HEX1		    :   out std_logic_vector(7 downto 0);
					 HEX2		    :   out std_logic_vector(7 downto 0)
            );
end count_3disp;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
architecture Behavioral of count_3disp is

    --Intermediate signals
    signal digit0    :   std_logic_vector(3 downto 0) := "0000";
    signal digit1    :   std_logic_vector(3 downto 0) := "0000";
    signal digit2    :   std_logic_vector(3 downto 0) := "0000";
	 
	 --Constants
	 constant ZERO		:	 std_logic_vector(3 downto 0) := "0000";
	 constant NINE		:	 std_logic_vector(3 downto 0) := "1001";
    
begin

		-- process block for counters
      count: process (SLOW_CLK, SYS_RESET)
		begin
			if (SLOW_CLK' event and SLOW_CLK = '1') then		-- look for clock edge
				if (SYS_RESET = '0') then							-- on reset low
					digit0 <= ZERO;									-- set digit0 counter to 0
					digit1 <= ZERO;									-- set digit1 counter to 0
					digit2 <= ZERO;									-- set digit2 counter to 0
				elsif (COUNT_EN = '1') then						-- on count enable
					digit0 <= digit0 + 1;							-- increment digit0 counter
					if (digit0 = NINE) then						   -- reset digit0 to 0 when count reaches 9
						digit0 <= ZERO;
						digit1 <= digit1 + 1;
						if (digit1 = NINE) then						-- reset digit1 to 0 when count reaches 9
							digit1 <= ZERO;
							digit2 <= digit2 + 1;
							if (digit2 = NINE) then					-- reset digit2 to 0 when count reaches 9
								digit2 <= ZERO;
							end if;
						end if;
					end if;
				else														-- hold digit values when count_en is 0
					digit0 <= digit0;		
					digit1 <= digit1;
					digit2 <= digit2;
				end if;
			end if;
		end process count;
	
		-- process block for digit0 BCD to HEX conversion
		bcd2hex0: process (digit0)
		begin
			case digit0 is 
				when "0000" => HEX0 <= "01000000";  -- Display 0
            when "0001" => HEX0 <= "01111001";  -- Display 1
				when "0010" => HEX0 <= "00100100";  -- Display 2
				when "0011" => HEX0 <= "00110000";  -- Display 3
				when "0100" => HEX0 <= "00011001";  -- Display 4
				when "0101" => HEX0 <= "00010010";  -- Display 5
				when "0110" => HEX0 <= "00000010";  -- Display 6
				when "0111" => HEX0 <= "01111000";  -- Display 7
				when "1000" => HEX0 <= "00000000";  -- Display 8
				when "1001" => HEX0 <= "00010000";  -- Display 9
				when others => HEX0 <= "11111111";  -- Display off
			end case;
		end process bcd2hex0;

		-- process block for digit1 BCD to HEX conversion
		bcd2hex1: process (digit1)
		begin
			case digit1 is 
				when "0000" => HEX1 <= "01000000";  -- Display 0
            when "0001" => HEX1 <= "01111001";  -- Display 1
				when "0010" => HEX1 <= "00100100";  -- Display 2
				when "0011" => HEX1 <= "00110000";  -- Display 3
				when "0100" => HEX1 <= "00011001";  -- Display 4
				when "0101" => HEX1 <= "00010010";  -- Display 5
				when "0110" => HEX1 <= "00000010";  -- Display 6
				when "0111" => HEX1 <= "01111000";  -- Display 7
				when "1000" => HEX1 <= "00000000";  -- Display 8
				when "1001" => HEX1 <= "00010000";  -- Display 9
				when others => HEX1 <= "11111111";  -- Display off
			end case;
		end process bcd2hex1;
					
		-- process block for digit2 BCD to HEX conversion			
		bcd2hex2: process (digit2)
		begin
			case digit2 is 
				when "0000" => HEX2 <= "01000000";  -- Display 0
            when "0001" => HEX2 <= "01111001";  -- Display 1
				when "0010" => HEX2 <= "00100100";  -- Display 2
				when "0011" => HEX2 <= "00110000";  -- Display 3
				when "0100" => HEX2 <= "00011001";  -- Display 4
				when "0101" => HEX2 <= "00010010";  -- Display 5
				when "0110" => HEX2 <= "00000010";  -- Display 6
				when "0111" => HEX2 <= "01111000";  -- Display 7
				when "1000" => HEX2 <= "00000000";  -- Display 8
				when "1001" => HEX2 <= "00010000";  -- Display 9
				when others => HEX2 <= "11111111";  -- Display off
			end case;
		end process bcd2hex2;
							
                     
end Behavioral;
----------------------------------------------------------------------------------