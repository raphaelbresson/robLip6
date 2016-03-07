----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:25:52 03/05/2016 
-- Design Name: 
-- Module Name:    freq_divider - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity freq_divider is
	 Generic( 
				input_freq : INTEGER := 50_000_000;
				output_freq : INTEGER := 400_000
		);
    Port ( 
				CLK : in  STD_LOGIC;
				RST : in  STD_LOGIC;
				OUT_CLK : out  STD_LOGIC
			);
end freq_divider;

architecture Behavioral of freq_divider is
	constant facteur : integer := (input_freq / output_freq);
	signal counter : integer range 0 to facteur/2 := 0;
	
	signal clk_d, clk_q : std_logic := '0';
begin
	OUT_CLK <= clk_q;
	compare:process(clk_q)
	begin
		if(RST = '1') then
			counter <= 0;
		else
		end if;
		counter <= counter + 1;
		if(counter = facteur/2) then
			clk_d <= not(clk_q);
			counter <= 0;
		else
			clk_d <= clk_q;
		end if;
	end process;

	exec: process(CLK,RST)
	begin
		if(RST='1') then
			clk_q <= '0';
		elsif(CLK='1' and CLK'event) then
			clk_q <= clk_d;
		else
		end if;
	end process;

end Behavioral;

