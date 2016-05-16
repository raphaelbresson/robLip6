----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:09:33 04/30/2016 
-- Design Name: 
-- Module Name:    ReceveurOrdres - Behavioral 
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

entity ReceveurOrdres is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           ENABLE : in  STD_LOGIC;
           DATA_RX : in  STD_LOGIC_VECTOR (7 downto 0);
			  NEW_DATA_RX: in STD_LOGIC;
           SERVO : out  STD_LOGIC_VECTOR (6 downto 0);
           FAST_PWM : out  STD_LOGIC_VECTOR (1 downto 0));
end ReceveurOrdres;

architecture Behavioral of ReceveurOrdres is
type etatReceveur is (IDLE, RC_INDICE, RC_ORDRE1, RC_ORDRE2);
signal etat_d, etat_q: etatReceveur;
signal data_d,data_q, indice_d, indice_q: STD_LOGIC_VECTOR(7 downto 0);
type mem is ARRAY(8 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
signal memoire_d, memoire_q: mem;
begin
-----------------------------------------------------------
--- SERVOS MOTEURS ----------------------------------------
-----------------------------------------------------------
gen_servo: for i in 0 to 6 generate
	pwm_servo : entity work.pwm_mgr
		generic map(
							com_length => 10, -- 8 bits pour la valeur commande
							cmp_length => 20,  -- 20 bits pour avoir un fréquence de 50Hz
							offset => 165
			)
		port map(
						clk => clk,
						rst => rst,
						com => memoire_q(i) & "00",
						pwm => Servo(i)
		);
end generate;
-------------------------------------------------------------
--- FAST PWMS (ROUES) ---------------------------------------
-------------------------------------------------------------
gen_pwms_roues : for i in 7 to 8 generate
	pwm_base: entity work.pwm_mgr
		generic map(
						com_length => 8,  -- 8 bits pour la valeur commande
						cmp_length => 16,	 -- 16 bits pour avoir une fréquence de 1kHz
						offset => 0
					)
		port map(
						clk => clk,
						rst => rst,
						com => memoire_q(i),
						pwm => Fast_PWM(i-7)
					);
end generate;

comb:process(CLK,RST,ENABLE,DATA_RX,NEW_DATA_RX,etat_q,data_q, memoire_q, indice_q)
begin
data_d <= data_q;
indice_d <= indice_q;
etat_d <= etat_q;
memoire_d <= memoire_q;
case etat_q is
when IDLE =>
	if(ENABLE='1') then
		etat_d <= RC_INDICE;
	else
		etat_d <= IDLE;
	end if;
when RC_INDICE =>
	if(NEW_DATA_RX='1') then
		indice_d <= data_rx;
		etat_d <= RC_ORDRE1;
	else
		etat_d <= RC_INDICE;
	end if;
when RC_ORDRE1 =>
	if(NEW_DATA_RX='1')then
		data_d <= DATA_RX;
		etat_d<= RC_ORDRE2;
	else
		etat_d <= RC_ORDRE1;
	end if;
when RC_ORDRE2 =>
	memoire_d(to_integer(unsigned(indice_q))) <= data_q;
	etat_d <= RC_INDICE;
end case;
end process;

clocked:process(CLK,RST)
begin
if(RST='1') then
	memoire_q <= (others=>(others=>'0'));
	etat_q <= IDLE;
	data_q <= (others=>'0');
	indice_q <= (others=>'0');
elsif(CLK='1' and CLK'event) then
	memoire_q <= memoire_d;
	data_q <= data_d;
	indice_q <= indice_d;
	etat_q <= etat_d;
end if;
end process;

end Behavioral;

