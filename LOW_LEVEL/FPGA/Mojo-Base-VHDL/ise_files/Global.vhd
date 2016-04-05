----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:20:30 04/03/2016 
-- Design Name: 
-- Module Name:    Global - Behavioral 
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

entity Global is

	Generic ( 
					NB_CAPTEURS : INTEGER := 2;
					NB_BUS_I2C : INTEGER := 1;
					NB_SERVOS : INTEGER := 6;
					NB_FAST_PWM : INTEGER := 2
				);
    Port    ( 
					CLK : in  STD_LOGIC;									-- horloge du systèmes
					RST : in  STD_LOGIC;									-- signal de reset
												-- UART --
					NEW_RX_DATA : in  STD_LOGIC;						-- signal de nouvelle donnée reçue via UART
					RX_DATA : in  STD_LOGIC_VECTOR (7 downto 0); -- données reçues via UART
					TX_BUSY : in  STD_LOGIC;							-- signal de transmission UART occupé
					TX_DATA : out  STD_LOGIC_VECTOR (7 downto 0);-- données à transmettre via UART
					NEW_TX_DATA : out  STD_LOGIC;						-- signal de nouvelle donnée à transmettre via UART					
					TX_BLOCK : in std_logic;
												-- Analog In --
					NEW_SAMPLE : in STD_LOGIC;						-- signal de nouvelle valeur analogique
					SAMPLE : in STD_LOGIC_VECTOR(9 downto 0); -- valeur analogique
					SAMPLE_CHANNEL : in STD_LOGIC_VECTOR(3 downto 0);-- Entrée de la nouvelle valuer analogique
					CHANNEL: out STD_LOGIC_VECTOR(3 downto 0);-- Entrée ADC à lire
												-- I2C --
					SCL : inout STD_LOGIC_VECTOR(NB_CAPTEURS_I2C - 1 downto 0);-- horloge I2C
					SDA : inout STD_LOGIC_VECTOR(NB_CAPTEURS_I2C - 1 downto 0);-- Data I2C
												-- Servos --
					SERVO : out STD_LOGIC_VECTOR(NB_SERVOS - 1 downto 0);
												-- fast pwm --
					FAST_PWM : out STD_LOGIC_VECTOR(NB_FAST_PWM - 1 downto 0)

				);
end Global;

architecture Behavioral of Global is
signal ok: std_logic:='0';
signal addr_send_d, addr_send_q :std_logic_vector(7 downto 0):=(others=>'0');
signal data_send:std_logic_vector(15 downto 0):=(others=>'0');
signal new_data_send_d, new_data_send_q : std_logic;
signal uart_busy: std_logic;
begin
TX_DATA <= tx_data_e when ok='1' else tx_data_i;
NEW_TX_DATA <= new_tx_data_e when ok='1' else new_tx_data_i;

actionneurs: entity work.ActionControlleur
	generic map(
						NB_SERVOS => NB_SERVOS,
						NB_FAST_PWM => NB_FAST_PWM
					)
	port map(
				CLK=>CLK,
				RST=>RST,
				WR_DATA => RX_DATA,
				WR_ENABLE => (NEW_RX_DATA and ok_q),
				SERVO_OUT => SERVO,
				FAST_PWM_OUT => FAST_PWM
				);
				
capteurs: entity work.CapteursController
	generic map(
						NB_CAPTEURS => NB_CAPTEURS,
						NB_BUS_I2C => NB_BUS_I2C
					)
	port map(
			CLK => CLK,
			RST => RST,
			DATA => data_send,
			ADDR => addr_send_q,
			SCL_v => SCL_v,
			SDA_v => SDA_v,
			NEW_SAMPLE => NEW_SAMPLE,						
			SAMPLE => SAMPLE, 
			SAMPLE_CHANNEL => SAMPLE_CHANNEL,
			CHANNEL => CHANNEL	
	);
	
init: entity work.initialisateur_uart
	generic map(
			NB_CAPT => NB_CAPTEURS,
			NB_ACT => NB_ACTIONNEURS
		)
		port map(
			CLK => CLK,
			RST => RST,
			ENABLE => init_q,
			TX_BUSY => TX_BUSY,
			DATA_TX => tx_data_i,
			NEW_DATA_TX => new_data_tx_i,
			DONE => ok
			);
	
	
sender: entity work.UART_sender
	port map(
			CLK => CLK,
			RST => RST,
			NEW_DATA => new_data_send_q,
			DATA => data_send,
			DATA_TX => tx_data_e,
			TX_BUSY => TX_BUSY,
			BUSY => uart_busy,
			NEW_DATA_TX => new_tx_data_e
	);
end Behavioral;

