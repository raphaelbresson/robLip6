----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:39:00 04/03/2016 
-- Design Name: 
-- Module Name:    UART_Sender - Behavioral 
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

entity UART_Sender is
    Port ( 
			  CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           NEW_DATA : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (15 downto 0);
           DATA_TX : out  STD_LOGIC_VECTOR(7 downto 0);
			  TX_BUSY : in STD_LOGIC;
			  BUSY : out STD_LOGIC;
			  NEW_DATA_TX : out STD_LOGIC
			  );
end UART_Sender;

architecture Behavioral of UART_Sender is
	type send_etat is (IDLE,FIRST_BYTE,SECOND_BYTE);
	signal etat_present, etat_futur : send_etat := IDLE;
	signal data_tx_d, data_tx_q :  STD_LOGIC_VECTOR(7 downto 0);
	signal new_data_tx_d, new_data_tx_q : STD_LOGIC;
	signal busy_d, busy_q : STD_LOGIC;
begin
	DATA_TX <= data_tx_q;
	NEW_DATA_TX <= new_data_tx_q;
	BUSY <= BUSY_q;
	comb: process(CLK,RST,NEW_DATA)
	begin
		data_tx_d <= data_tx_q;
		busy_d <= busy_q;
		new_data_tx_d <= new_data_tx_q;
		case etat_present is
		
			when IDLE =>
				if(NEW_DATA='1') then
					data_tx_d <= DATA(15 downto 8);
					NEW_DATA_TX <= '1';
					busy_d <= '1';
					etat_futur <= FIRST_BYTE;
				else
					busy_d <= '0';
					etat_futur <= IDLE;
				end if;
				
			when FIRST_BYTE =>
				busy_d <= '1';
				if(TX_BUSY='0' and new_data_tx_q='0') then
					data_tx_d <= DATA(7 downto 0);
					new_data_tx_d <= '1';
					etat_futur <= SECOND_BYTE;
				else
					new_data_tx_d <= '0';
					etat_futur <= FIRST_BYTE;
				end if;
				
			when SECOND_BYTE =>
				busy_d <= '1';
				if(TX_BUSY='0' and new_data_tx = '0') then
					etat_futur <= IDLE;
				else
					new_data_tx_d <= '0';
					etat_futur <= SECOND_BYTE;
				end if;
		end case;
	end process;
	
	
	seq: process(CLK,RST)
	begin
		if(RST='1') then
			data_tx_q <= (others=>'0');
			busy_q <= '0';
			new_data_tx_q <= '0';
			etat_presnt <= IDLE;
		elsif(CLK='1' and CLK'event) then
			data_tx_q <= data_tx_d;
			busy_q <= busy_d;
			new_data_tx_q <= new_data_tx_d;
			etat_present <= etat_futur;
		end if;
	end process;
end Behavioral;

