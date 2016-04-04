----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Raphaël Bresson
-- 
-- Create Date:    14:23:53 02/25/2016 
-- Design Name: 
-- Module Name:    pwm_mgr - Behavioral 
-- Project Name: RobLip6
-- Target Devices: Mojo V3 (Spartan 6)
-- Tool versions: 
-- Description: gestion sorties PWM
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

entity pwm_mgr is
	Generic ( cmp_length : INTEGER := 8);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CMP : in  STD_LOGIC_VECTOR(cmp_length -1 downto 0);
           PWM : out  STD_LOGIC);
end pwm_mgr;

architecture Behavioral of pwm_mgr is
	signal pwm_d, pwm_q : STD_LOGIC := '0';
	signal cmp_d, cmp_q : STD_LOGIC_VECTOR(cmp_length -1 downto 0):=(others=>'0');
begin
	pwm <= pwm_q;
	inc:process(CLK) -- incrementation des compteurs
	begin
		if(RST = '0') then
			cmp_d <= std_logic_vector(unsigned(cmp_q) + 1);
			if(unsigned(CMP) > unsigned(cmp_q)) then
				pwm_d <= '1';
			else
				pwm_d <= '0';
			end if;
		else
		end if;
	end process;
	
	process(CLK,RST) -- mise à jour des registres pour la sortie
	begin
		if(RST = '1') then -- reset asynchrone
			pwm_q <= '0';
			cmp_q <= (others=>'0');
		elsif(CLK = '1' and CLK'event) then -- sur front montant
			cmp_q <= cmp_d;
			pwm_q <= pwm_d;
		else
		end if;
	end process;

end Behavioral;