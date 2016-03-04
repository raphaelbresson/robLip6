----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:12:11 03/04/2016 
-- Design Name: 
-- Module Name:    Diviseur_Freq - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Diviseur_Freq is
	 Generic( factor : integer:= 20);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           OUT_CLK : out  STD_LOGIC);
end Diviseur_Freq;

architecture Behavioral of Diviseur_Freq is
	signal compteur : integer range 0 to factor - 1;
	signal out_clk_d, out_clk_q : std_logic;
begin
	OUT_CLK <= out_clk_q;
	incrementation: process(CLK)
	begin
		--if(CLK = '1' and CLK'event) then
			if(RST = '1') then
				compteur <= 0;
				out_clk_q <= '0';
			else
				out_clk_q <= out_clk_d;
				if(compteur = factor - 1) then
					compteur <= 0;
				else
					compteur <= compteur + 1;
				end if;
			end if;
		--else
		--end if;
	end process;
	
	sortie: process(compteur)
	begin
		if(compteur = factor - 1) then
			out_clk_d <= not(out_clk_q);
		else
			out_clk_d <= out_clk_q;
		end if;
	end process;
end Behavioral;

