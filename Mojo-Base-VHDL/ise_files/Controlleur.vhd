----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:02:27 03/08/2016 
-- Design Name: 
-- Module Name:    Controller - Behavioral 
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

entity Controller is
	 Generic(
					Num_Capteurs_Analog  : INTEGER := 1; -- Nombre de capteurs analogiques
					Num_Capteurs_I2C		: INTEGER := 1; -- Nombre de capteurs connectés via I2C
					Num_Servos			   : INTEGER := 6; -- Nombre de sorties servo-moteurs
					Num_FastPwm				: INTEGER := 2  -- Nombre de sorties fast-pwm
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
												-- Analog In --
					NEW_SAMPLE : in STD_LOGIC;						-- signal de nouvelle valeur analogique
					SAMPLE : in STD_LOGIC_VECTOR(9 downto 0); -- valeur analogique
					SAMPLE_CHANNEL : in STD_LOGIC_VECTOR(3 downto 0);-- Entrée de la nouvelle valuer analogique
					CHANNEL: out STD_LOGIC_VECTOR(3 downto 0);-- Entrée ADC à lire
												-- I2C --
					 SCL : inout STD_LOGIC_VECTOR(Num_Capteurs_I2C - 1 downto 0);-- horloge I2C
					 SDA : inout STD_LOGIC_VECTOR(Num_Capteurs_I2C - 1 downto 0)-- Data I2C
												-- Servos --
					-- servo_out : out STD_LOGIC_VECTOR(Num_Servos - 1 downto 0);-- sorties servo-moteurs
												-- fast-pwm --
					-- fast_pwm : out STD_LOGIC_VECTOR(Num_FastPwm - 1 downto 0);-- sorties fast_pwm
				);
end Controller;

architecture Behavioral of Controller is
	-- constantes d'initialisation
	constant num_capteurs : integer := Num_Capteurs_Analog + Num_Capteurs_I2C;
	constant last_init_byte_capteurs : integer := (num_capteurs*2)-1;
	constant num_actionneurs : integer := Num_Servos + Num_FastPwm;
	constant last_init_byte_actionneurs : integer := (num_actionneurs*2)-1;
	type tabInitCapteurs is array(0 to last_init_byte_capteurs)  of std_logic_vector(7 downto 0);
	type tabInitActionneurs is array(0 to last_init_byte_actionneurs)  of std_logic_vector(7 downto 0);
	signal buffer_init_capteurs : tabInitCapteurs;
	signal buffer_init_actionneurs : tabInitActionneurs;
	-- etats
	type Etat_control is (
				--	ETATS D'INITIALISATION DU SYSTEME
							INIT_START,								-- début: initialisation
							INIT_SEND_NUM_CAPTEURS,				-- envoi du nombre de capteurs
							INIT_SEND_NUM_ACTIONNEURS,			-- envoi du nombre d'actionneurs
							INIT_SEND_INFO_CAPTEURS,			-- envoi des infos de chaque capteur
							INIT_SEND_INFO_ACTIONNEURS,		-- envoi des infos de chaque actionneur
				-- ETAT DE LECTURE/ECRITURE
							EXEC_READ_WRITE,
							EXEC_PAUSE
							);
	signal Etat_present, Etat_futur : Etat_control := INIT_START;
	-- caractères à gérer
	constant fin_de_ligne   : std_logic_vector(7 downto 0):=X"0A"; -- '\n'
	constant retour_chariot : std_logic_vector(7 downto 0):=X"0D"; -- '\r'
	constant carac_a		   : std_logic_vector(7 downto 0):=X"41"; -- 'A'
	constant carac_c		   : std_logic_vector(7 downto 0):=X"43"; -- 'C'
	--buffers d'écriture
	signal new_tx_data_d, new_tx_data_q : std_logic;				-- flag de nouvelle ecriture
	signal tx_data_q, tx_data_d: std_logic_vector(7 downto 0);	-- dernières données écrites ou à écrire
	constant frame_write_size : integer := Num_Capteurs_Analog + (Num_Capteurs_I2C*2)-1;
	type frame_to_high_level is array(frame_write_size downto 0) of std_logic_vector(7 downto 0);
	signal frame_write : frame_to_high_level := (others=>(others=>'0'));							-- Frame d'envoi complete
	
	--buffers de lecture
	signal new_rx_data_d, new_rx_data_q : std_logic;
	signal rx_data_d, rx_data_q, rx_data_t: std_logic_vector(7 downto 0);	-- dernières données lues ou à lire
	constant frame_read_size : integer := num_actionneurs - 1;
	type frame_from_high_level is array(frame_read_size downto 0) of std_logic_vector(7 downto 0);
	signal frame_read : frame_from_high_level:= (others=>(others=>'0'));						-- Frame de réception complète
	
	-- compteurs d'octets
	signal byte_counter_d, byte_counter_q : integer;
	signal byte_counter2_d, byte_counter2_q : integer;
	
	-- Entrées analogiques
	type Analog_inputs_type is array(7 downto 0) of std_logic_vector(9 downto 0);
	signal Analog_inputs : Analog_inputs_type;
	signal current_analog_input : integer:=0;
	signal potentiometre : std_logic_vector(7 downto 0);
	
	-- I2C
	type I2C_inputs_type is array(Num_Capteurs_I2C - 1 downto 0) of std_logic_vector(15 downto 0);
	signal i2c_datas_i, i2c_datas_t,i2c_datas_q,i2c_datas_d: I2C_inputs_type:=(others=>(others=>'0'));
	signal new_data_lidar : std_logic;
	
	-- pause
	constant delay_pause : integer:=0;
	signal count_delay_d, count_delay_q : integer := delay_pause;
begin
-- entrée/sortie UART
rx_data_t <= RX_DATA;
TX_DATA <= tx_data_q;
NEW_TX_DATA <= new_tx_data_q;
-- entrées analogiques
potentiometre <= Analog_inputs(0)(9 downto 2);
-- entrées capteurs via I2C
i2c_datas_i <= i2c_datas_t;

--------------------------------------------------------------------------
------------------	Entrées analogiques	--------------------------------
--------------------------------------------------------------------------
analogValues: entity work.Analog_in
	port map(
			clk => clk,
			rst => rst,
			new_sample => new_sample,
			sample => sample,
			sample_channel => sample_channel,
			channel => channel,
			analog_0 => Analog_inputs(0),
			analog_1 => Analog_inputs(1),
			analog_2 => Analog_inputs(2),
			analog_3 => Analog_inputs(3),
			analog_4 => Analog_inputs(4),
			analog_5 => Analog_inputs(5),
			analog_6 => Analog_inputs(6),
			analog_7 => Analog_inputs(7)
		);
--------------------------------------------------------------------------
-------------------	Lidar I2C -------------------------------------------
--------------------------------------------------------------------------
lidar_i2c: entity work.lidar
	port map(
			clk => clk,
			rst => rst,
			scl => scl(0),
			sda => sda(0),
			data => i2c_datas_t(0),
			new_data => new_data_lidar
		);


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
	
------------------------------------------------------------------
--- 	Fonction de transition (sur front descendant de CLK)		 --								---
------------------------------------------------------------------	
transition:process(CLK,RST,new_tx_data_q, byte_counter_q, tx_data_q, etat_present,NEW_RX_DATA,RX_DATA, TX_BUSY,NEW_DATA_LIDAR)
begin
i2c_datas_d <= i2c_datas_q;
if(new_data_lidar = '1') then
		i2c_datas_d <= i2c_datas_t;
	else
		i2c_datas_d <= i2c_datas_q;
	end if;

if(NEW_RX_DATA = '1') then
	rx_data_d <= rx_data_t;
	new_rx_data_q <= '1';
else
	rx_data_d <= rx_data_q;
	new_rx_data_d <= '0';
end if;
count_delay_d <= count_delay_q;
new_tx_data_d <= new_tx_data_q;
byte_counter_d <= byte_counter_q;
tx_data_d <= tx_data_q;
etat_futur <= etat_Present;
	case Etat_present is
		-- ON COMMENCE L'INITIALISATION EN ENVOYANT LE NOMBRE DE CAPTEURS (1 OCTET)
		when INIT_START =>
			if(rx_data_q="11111111") then
				new_tx_data_d <= '1';
				tx_data_d <= std_logic_vector(to_unsigned(num_capteurs,8));
				etat_futur <= INIT_SEND_NUM_CAPTEURS;
			else
				etat_futur <= INIT_START;
				new_tx_data_d <= '0';
			end if;
			
		-- ATTENTE DE LA FIN DE L'ECRITURE SUR LE BUS UART DU NOMBRE DE CAPTEURS (1 OCTET)
		when INIT_SEND_NUM_CAPTEURS=>		
			if(TX_BUSY = '0' and new_tx_data_q='0') then -- si l'écriture est finie on passe à l'envoi
				new_tx_data_d <= '1';							-- du nombre d'actionneurs
				tx_data_d <= std_logic_vector(to_unsigned(num_actionneurs,8));
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
					new_tx_data_d <= '1';							-- on passe à l'exécution
					byte_counter_d <= frame_write_size;
					tx_data_d <= frame_write(frame_write_size);
					etat_futur <= EXEC_READ_WRITE;
				end if;
			else															-- sinon écriture d'un octet en cours 
				new_tx_data_d <= '0';								-- on continue
				tx_data_d <= tx_data_q;
				etat_futur <= INIT_SEND_INFO_ACTIONNEURS;
			end if;
			
		-- LECTURE/ECRITURE DES TRAMES SUR L'UART (BOUCLE INFINIE SUR CET ETAT)
		when EXEC_READ_WRITE =>
			-- ECRITURE
			if(TX_BUSY = '0' and new_tx_data_q = '0') then 	-- l'écriture d'un octet est finie
				if(byte_counter_q > 0) then						-- si ce n'est pas le dernier octet 
					new_tx_data_d <= '1';							-- on envoie l'octet suivant
					byte_counter_d <=  byte_counter_q - 1;
					tx_data_d <= frame_write(byte_counter_q - 1);
					etat_futur <= EXEC_READ_WRITE;
				else														-- sinon c'est le dernier : on revient au début
					new_tx_data_d <= '0';							-- de la trame d'écriture
					count_delay_d <= delay_pause;
					etat_futur <= EXEC_PAUSE;
				end if;
			else															-- écriture d'un octet en cours
				new_tx_data_d <= '0';
				tx_data_d <= tx_data_q;
				etat_futur <= EXEC_READ_WRITE;
			end if;
			--LECTURE
			if(new_rx_data_q = '1') then 			-- 1 nouvel octet à lire
				if(byte_counter2_q > 0) then 	-- si ce n'est pas le dernier octet, on passe au suivant
					frame_read(byte_counter2_q -1) <= rx_data_q;
					byte_counter2_d <= byte_counter2_q - 1;
				else										-- si c'est le dernier on passe à l'ecriture
					byte_counter2_d <= frame_read_size;
					frame_read(frame_read_size) <= rx_data_q;
				end if;
			else											-- sinon lecture en cours
				frame_read(byte_counter2_q) <= rx_data_q;
			end if;
			if(RST = '1') then
				etat_futur <= INIT_START;
			end if;
		when EXEC_PAUSE =>
			--LECTURE asynchrone
			if(new_rx_data_q = '1') then 			-- 1 nouvel octet à lire
				if(byte_counter2_q > 0) then 	-- si ce n'est pas le dernier octet, on passe au suivant
					frame_read(byte_counter2_q -1) <= rx_data_q;
					byte_counter2_d <= byte_counter2_q - 1;
				else										-- si c'est le dernier on passe à l'ecriture
					byte_counter2_d <= frame_read_size;
					frame_read(frame_read_size) <= rx_data_q;
				end if;
			else											-- sinon lecture en cours
				frame_read(byte_counter2_q) <= rx_data_q;
			end if;
			--delai d'écriture
			if(count_delay_q > 0) then
				new_tx_data_d <= '0';
				count_delay_d <= count_delay_q - 1;
				etat_futur <= EXEC_PAUSE;
			else
				new_tx_data_d <= '1';
				byte_counter_d <= frame_write_size;
				tx_data_d <= frame_write(frame_write_size);
				etat_futur <= EXEC_READ_WRITE;
			end if;
	end case;
end process;

-------------------------------------------------------------------
--	MISE A JOUR DES SORTIES (sur front montant de CLK)	  		  	  --
-------------------------------------------------------------------
sorties:process(CLK,RST)
begin
if(RST='1') then
	etat_present <= INIT_START;
	new_tx_data_q <= '0';
	byte_counter_q <= 7;
	tx_data_q <= (others=>'0');
elsif(CLK='1' and CLK'event) then
	new_tx_data_q <= new_tx_data_d;
	new_rx_data_q <= new_rx_data_d;
	tx_data_q <= tx_data_d;
	rx_data_q <= rx_data_d;
	byte_counter_q <= byte_counter_d;
	byte_counter2_q <= byte_counter2_d;
	etat_present <= Etat_futur;
	i2c_datas_q <= i2c_datas_d;
	count_delay_q <= count_delay_d;
	-- sorties UART
	frame_write(frame_write_size) <= (others=>'0');
	--frame_write(frame_write_size) <= potentiometre;
	frame_write(frame_write_size - 1) <= i2c_datas_d(0)(15 downto 8);
	frame_write(frame_write_size - 2) <= i2c_datas_d(0)(7 downto 0);
end if;

end process;

end Behavioral;

