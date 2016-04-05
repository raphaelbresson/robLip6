----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:31:11 04/03/2016 
-- Design Name: 
-- Module Name:    Initialisateur_uart - Behavioral 
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

entity Initialisateur_uart is
	Generic ( NB_CAPT : INTEGER := 8;
				 NB_ACT  : INTEGER := 2);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  ENABLE : in STD_LOGIC;
           TX_BUSY : in  STD_LOGIC;
           DATA_TX : out  STD_LOGIC;
           NEW_DATA_TX : out  STD_LOGIC_VECTOR (31 downto 0);
           DONE : out  STD_LOGIC
			 );
end Initialisateur_uart;

architecture Behavioral of Initialisateur_uart is
	constant last_init_byte_actionneurs : integer := (NB_ACT*2)-1;
	constant last_init_byte_capteurs : integer := (NB_CAPT*2)-1;
	type Etat_init is (
				--	ETATS D'INITIALISATION DU SYSTEME
							INIT_START,								-- début: initialisation
							INIT_SEND_NUM_CAPTEURS,				-- envoi du nombre de capteurs
							INIT_SEND_NUM_ACTIONNEURS,			-- envoi du nombre d'actionneurs
							INIT_SEND_INFO_CAPTEURS,			-- envoi des infos de chaque capteur
							INIT_SEND_INFO_ACTIONNEURS,		-- envoi des infos de chaque actionneur
				-- ETAT DE LECTURE/ECRITURE
							FINISH
							);
	signal etat_present, etat_futur : Etat_init;
	type tabInitCapteurs is array(0 to last_init_byte_capteurs)  of std_logic_vector(7 downto 0);
	type tabInitActionneurs is array(0 to last_init_byte_actionneurs)  of std_logic_vector(7 downto 0);
	signal buffer_init_capteurs : tabInitCapteurs;
	signal buffer_init_actionneurs : tabInitActionneurs;
	
	signal new_tx_data_d, new_tx_data_q : std_logic:='0';				-- flag de nouvelle ecriture
	signal tx_data_q, tx_data_d: std_logic_vector(7 downto 0):=(others=>'0');	-- dernières données écrites ou à écrire
	signal done_d, done_q: std_logic:='0';
	signal byte_counter_d, byte_counter_q : INTEGER := 7;
begin


---------------------------------------------------------------
---						BUFFERS D'INITIALISATION					---
---------------------------------------------------------------
	-- buffer d'initialisation des capteurs
	buffer_init_capteurs(last_init_byte_capteurs - 0) <= X"00"; 		-- Proximite
	buffer_init_capteurs(last_init_byte_capteurs - 1) <= X"00"; 		-- type : 00 -> proximite 
	
	buffer_init_capteurs(last_init_byte_capteurs - 2) <= X"01"; 		-- Lidar
	buffer_init_capteurs(last_init_byte_capteurs - 3) <= X"01"; 		-- type : 01 -> lidar
	
	-- buffer d'initialisation des actionneurs
	buffer_init_actionneurs(last_init_byte_actionneurs - 0) <= X"00"; 	-- servo 1
	buffer_init_actionneurs(last_init_byte_actionneurs - 1) <= X"00"; 	-- type : 00 -> servo

	buffer_init_actionneurs(last_init_byte_actionneurs - 2) <= X"01"; 	-- servo 2
	buffer_init_actionneurs(last_init_byte_actionneurs - 3) <= X"00"; 	-- type : 00 -> servo
	
	buffer_init_actionneurs(last_init_byte_actionneurs - 4) <= X"02"; 	-- servo 3
	buffer_init_actionneurs(last_init_byte_actionneurs - 5) <= X"00"; 	-- type : 00 -> servo

	buffer_init_actionneurs(last_init_byte_actionneurs - 6) <= X"03"; 	-- servo 4
	buffer_init_actionneurs(last_init_byte_actionneurs - 7) <= X"00"; 	-- type : 00 -> servo
	
	buffer_init_actionneurs(last_init_byte_actionneurs - 8) <= X"04"; 	-- servo 5
	buffer_init_actionneurs(last_init_byte_actionneurs - 9) <= X"00"; 	-- type : 00 -> servo
	
	buffer_init_actionneurs(last_init_byte_actionneurs - 10) <= X"05"; 	-- servo 6
	buffer_init_actionneurs(last_init_byte_actionneurs - 11) <= X"00";	-- type : 00 -> servo
	
	buffer_init_actionneurs(last_init_byte_actionneurs - 12) <= X"06";	-- roues gauches
	buffer_init_actionneurs(last_init_byte_actionneurs - 13) <= X"01";	-- type : 01 -> fast pwm
	
	buffer_init_actionneurs(last_init_byte_actionneurs - 14) <= X"07";	-- roues droites
	buffer_init_actionneurs(last_init_byte_actionneurs - 15) <= X"01";	-- type : 01 -> fast pwm


comb:process(CLK,RST,TX_BUSY)
begin
	tx_data_d <= tx_data_q;
	new_tx_data_d <= new_tx_data_q;
	byte_counter_d <= byte_counter_q;
	done_d <= done_q;
	case Etat_present is
		-- ON COMMENCE L'INITIALISATION EN ENVOYANT LE NOMBRE DE CAPTEURS (1 OCTET)
		when INIT_START =>
			if(ENABLE='1') then
				new_tx_data_d <= '1';
				tx_data_d <= std_logic_vector(to_unsigned(NB_CAPT,8));
				etat_futur <= INIT_SEND_NUM_CAPTEURS;
			else
				etat_futur <= INIT_START;
				new_tx_data_d <= '0';
			end if;
			
		-- ATTENTE DE LA FIN DE L'ECRITURE SUR LE BUS UART DU NOMBRE DE CAPTEURS (1 OCTET)
		when INIT_SEND_NUM_CAPTEURS=>		
			if(TX_BUSY = '0' and new_tx_data_q='0') then -- si l'écriture est finie on passe à l'envoi
				new_tx_data_d <= '1';							-- du nombre d'actionneurs
				tx_data_d <= std_logic_vector(to_unsigned(NB_ACT,8));
				etat_futur <= INIT_SEND_NUM_ACTIONNEURS;
			else														-- sinon l'écriture n'est pas finie
				new_tx_data_d <= '0';							-- on continue
				tx_data_d <= tx_data_q;
				etat_futur <= INIT_SEND_NUM_CAPTEURS;
			end if;
			
		-- ATTENTE DE LA FIN DE L'ECRITURE SUR LE BUS UART DU NOMBRE D'ACTIONNEURS (1 OCTET)
		when INIT_SEND_NUM_ACTIONNEURS =>
			if(TX_BUSY = '0' and new_tx_data_q='0') then -- si l'écriture est finie on passe à l'envoi
				new_tx_data_d <= '1';							-- des infos de chaque capteur
				byte_counter_d <= last_init_byte_capteurs;
				tx_data_d <= buffer_init_capteurs(last_init_byte_capteurs);
				etat_futur <= INIT_SEND_INFO_CAPTEURS;
			else														-- sinon l'écriture n'est pas finie
				new_tx_data_d <= '0';							-- on continue
				tx_data_d <= tx_data_q;
				etat_futur <= INIT_SEND_NUM_ACTIONNEURS;
			end if;
			
		-- ECRITURE UART DE CHAQUE INFORMATION DES CAPTEURS
		when INIT_SEND_INFO_CAPTEURS =>
			if(TX_BUSY = '0' and new_tx_data_q = '0') then 		-- si l'écriture d'un octet est finie
				new_tx_data_d <= '1';
				if(byte_counter_q > 0) then					  		-- si ce n'est pas le dernier octet
					byte_counter_d <=  byte_counter_q - 1;	  		-- on envoie l'octet suivant
					tx_data_d <= buffer_init_capteurs(byte_counter_q - 1);
					etat_futur <= INIT_SEND_INFO_CAPTEURS;
				else															-- si c'est le dernier octet on passe à
					byte_counter_d <= last_init_byte_actionneurs;-- l'envoi des infos de chaque actionneur
					tx_data_d <= buffer_init_actionneurs(last_init_byte_actionneurs);
					etat_futur <= INIT_SEND_INFO_ACTIONNEURS;
				end if;
			else																-- sinon écriture d'un octet en cours
				new_tx_data_d <= '0';									-- on continue
				tx_data_d <= tx_data_q;
				etat_futur <= INIT_SEND_INFO_CAPTEURS;
			end if;
			
		-- ECRITURE UART DE CHAQUE INFORMATION DES ACTIONNEURS
		when INIT_SEND_INFO_ACTIONNEURS =>
			if(TX_BUSY = '0' and new_tx_data_q = '0') then 	-- l'écriture d'un octet est finie
				new_tx_data_d <= '1';
				if(byte_counter_q > 0) then						-- si ce n'est pas le dernier octet
					byte_counter_d <=  byte_counter_q - 1;	  	-- on envoie l'octet suivant
					tx_data_d <= buffer_init_actionneurs(byte_counter_q - 1);
					etat_futur <= INIT_SEND_INFO_ACTIONNEURS;
				else														--	si c'est le dernier octet							
					new_tx_data_d <= '0';							-- on passe à l'exécution
					etat_futur <= FINISH;
				end if;
			else															-- sinon écriture d'un octet en cours 
				new_tx_data_d <= '0';								-- on continue
				tx_data_d <= tx_data_q;
				etat_futur <= INIT_SEND_INFO_ACTIONNEURS;
			end if;
		when FINISH =>
			done_d <='1';
			if(Enable='0') then
				etat_futur <= INIT_START;
			else
				etat_futur <= FINISH;
			end if;
	end case;
end process;

seq:process(CLK,RST)
begin
	if(RST='1') then
		tx_data_q <= (others=>'0');
		new_tx_data_q <= '0';
		byte_counter_q <= 0;
		done_q <= '0';
		etat_present <= INIT_START;
	elsif(CLK='1' and CLK'event) then
		tx_data_q <= tx_data_d;
		new_tx_data_q <= new_tx_data_d;
		byte_counter_q <= byte_counter_d;
		done_q <= done_d;
		etat_present <= etat_futur;
	end if;
end process;
end Behavioral;

