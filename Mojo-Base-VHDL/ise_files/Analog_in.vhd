----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:37:42 03/03/2016 
-- Design Name: 
-- Module Name:    Analog_in - Behavioral 
-- Project Name: 
-- Target Devices: Mojo V3
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

entity Analog_in is
    Port ( 	
					CLK : in  STD_LOGIC;
					RST : in  STD_LOGIC;
					new_sample : in  STD_LOGIC;
					sample : in  STD_LOGIC_VECTOR (9 downto 0);
					sample_channel : in  STD_LOGIC_VECTOR (3 downto 0);
					channel : out  STD_LOGIC_VECTOR (3 downto 0);
					analog_0 : out  STD_LOGIC_VECTOR (9 downto 0);
					analog_1 : out  STD_LOGIC_VECTOR (9 downto 0);
					analog_2 : out  STD_LOGIC_VECTOR (9 downto 0);
					analog_3 : out  STD_LOGIC_VECTOR (9 downto 0);
					analog_4 : out  STD_LOGIC_VECTOR (9 downto 0);
					analog_5 : out  STD_LOGIC_VECTOR (9 downto 0);
					analog_6 : out  STD_LOGIC_VECTOR (9 downto 0);
					analog_7 : out  STD_LOGIC_VECTOR (9 downto 0)
			 );
end Analog_in;

architecture Behavioral of Analog_in is

-- registres pour les valeurs de tension du signal analogique voulu
type sample_tab is array(0 to 7) of std_logic_vector(9 downto 0);
signal samples_d, samples_q : sample_tab;

-- registre pour sauvegarder le pin sur lequel la valeur est lue
signal current_channel : std_logic_vector(3 downto 0);

begin
	channel <= current_channel;
	analog_0 <= samples_q(0);
	analog_1 <= samples_q(1);
	analog_2 <= samples_q(2);
	analog_3 <= samples_q(3);
	analog_4 <= samples_q(4);
	analog_5 <= samples_q(5);
	analog_6 <= samples_q(6);
	analog_7 <= samples_q(7);
	
	lecture: process(CLK,new_sample,sample,sample_channel,samples_q) 
	begin
		if(new_sample = '1') then
			case sample_channel is
				when "0000" => samples_d(0) <= sample; -- A0
					current_channel <= "0001";
				when "0001" => samples_d(1) <= sample; -- A1
					current_channel <= "0100";
				when "0100" => samples_d(2) <= sample; -- A2
					current_channel <= "0101";
				when "0101" => samples_d(3) <= sample; -- A3
					current_channel <= "0110";
				when "0110" => samples_d(4) <= sample; -- A4
					current_channel <= "0111";
				when "0111" => samples_d(5) <= sample; -- A5
					current_channel <= "1000";
				when "1000" => samples_d(6) <= sample; -- A6
					current_channel <= "1001";
				when "1001" => samples_d(7) <= sample; -- A7
					current_channel <= "0000";
				when others => current_channel <= "0000";
			end case;
		else
		end if;
		
	end process;
	
	mise_a_jour: process(CLK)
	begin
		if(CLK = '1' and CLK'event) then
			if(RST = '1') then
				for i in 0 to 7 loop
					samples_q(i) <= (others=>'0');
				end loop;
			else
				for i in 0 to 7 loop
					samples_q(i) <= samples_d(i);
				end loop;
			end if;
		else
		end if;
	end process;
end Behavioral;

