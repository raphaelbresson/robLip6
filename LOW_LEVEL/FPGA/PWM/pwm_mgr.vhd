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
-- Description: gestion des sorties PWM
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
	Generic ( 
					com_length  : INTEGER := 8;			 -- longueur en bits du signal de commande
					cmp_length  : INTEGER := 20; 			 -- longueur en bits du compteur (20 -> 50Hz)
					offset	   : INTEGER := 165			 -- Valeur de l'offset
		);
    Port ( 
					CLK : in  STD_LOGIC;
					RST : in  STD_LOGIC;
					COM : in  STD_LOGIC_VECTOR(com_length -1 downto 0);
					PWM : out  STD_LOGIC
			);
end pwm_mgr;

architecture Behavioral of pwm_mgr is
	signal pwm_d, pwm_q : STD_LOGIC := '0';
	signal cmp_d, cmp_q : STD_LOGIC_VECTOR(cmp_length -1 downto 0):=(others=>'0');
begin
	pwm <= pwm_q;
	inc:process(CLK,RST,cmp_q,COM) -- incrementation des compteurs
	begin
		if(RST = '0') then
			cmp_d <= std_logic_vector(unsigned(cmp_q) + 1);
			if((unsigned('0' & COM) + offset) > unsigned(cmp_q(cmp_length-1 downto (cmp_length-1 - com_length-2)))) then
				pwm_d <= '1';
			else
				pwm_d <= '0';
			end if;
		else
		end if;
		
		
	end process;
	
	proc:process(CLK,RST) -- mise à jour des registres pour la sortie
	begin
		if(RST = '1') then -- reset asynchrone
			pwm_q <= '0';
			cmp_q <= (others=>'0');
		elsif(CLK='1' and CLK'event) then -- sur front montant
			cmp_q <= cmp_d;
			pwm_q <= pwm_d;
		else
		end if;
	end process;

end Behavioral;

