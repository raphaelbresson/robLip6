----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:46:48 04/03/2016 
-- Design Name: 
-- Module Name:    ActionControlleur - Behavioral 
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

entity ActionControlleur is
	Generic(
				NB_SERVOS : INTEGER := 6;
				NB_FAST_PWM :INTEGER := 2
				);
    Port ( 
			  CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           WR_MEM : in  STD_LOGIC_VECTOR (7 downto 0);
           WR_ENABLE : in  STD_LOGIC;
			  						-- Servos --
			  SERVO_OUT : out STD_LOGIC_VECTOR(NB_SERVOS - 1 downto 0);
									-- fast-pwm --
			  FAST_PWM_OUT : out STD_LOGIC_VECTOR(NB_FAST_PWM - 1 downto 0)
			  );
end ActionControlleur;

architecture Behavioral of ActionControlleur is
	type mem_act is array(NB_SERVOS + NB_FAST_PWM - 1 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal memoire_d, memoire_q : mem_act := (others=>(others=>'0'));
	signal addr_d, addr_q : INTEGER := 0;
begin
-----------------------------------------------------------
--- SERVOS MOTEURS ----------------------------------------
-----------------------------------------------------------
gen_servo: for i in 0 to 5 generate
	pwm_servo : entity work.pwm_mgr
		generic map(
							com_length => 8, -- 8 bits pour la valeur commande
							cmp_length => 20,  -- 20 bits pour avoir un fréquence de 50Hz
							offset => 165
			)
		port map(
						clk => clk,
						rst => rst,
						com => memoire_q(i),
						pwm => servo(i)
		);
end generate;
-------------------------------------------------------------
--- FAST PWMS (ROUES) ---------------------------------------
-------------------------------------------------------------
gen_pwms_roues : for i in 6 to 7 generate
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
						pwm => FAST_PWM_OUT(i-6)
					);
end generate;


comb:process(CLK,RST,WR_MEM,WR_ENABLE)
begin
	memoire_d <= memoire_q;
	addr_d <= addr_q;
	if(WR_ENABLE = '1') then
		memoire_d(addr_q) <= WR_MEM;
	else
		if(addr_d < NB_SERVOS + NB_FAST_PWM - 1) then
			addr_d <= addr_q + 1;
		else
			addr_d <= 0;
		end if;
	end if;
end process;

seq:process(CLK,RST)
begin
	if(RST='1') then
		memoire_q <= (others=>(others=>'0'));
		addr_q <= (others=>'0');
	elsif(CLK='1' and CLK'event) then
		memoire_q <= memoire_d;
		addr_q <= addr_d;
	end if;
end process;
end Behavioral;

