----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:54:05 03/05/2016 
-- Design Name: 
-- Module Name:    i2C_master - Behavioral 
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

use IEEE.NUMERIC_STD.ALL;

entity i2C_master is
	 Generic(
					input_freq 	: INTEGER := 50_000_000; 						-- fréquence de l'horloge d'entrée
					bus_freq	  	: INTEGER := 400_000								-- fréquence du bus
				);
    Port ( 
					CLK 			: in  STD_LOGIC;									-- horloge d'entrée
					RST 			: in  STD_LOGIC;									-- reset asynchrone
					ENABLE 		: in  STD_LOGIC;									-- activation / désactivation
					ADDR 			: in  STD_LOGIC_VECTOR (6 downto 0);		-- adresse de l'esclave courant
					RW 			: in  STD_LOGIC;									-- 0 pour ecrire / 1 pour lire
					Data_wr 		: in  STD_LOGIC_VECTOR (7 downto 0);		-- données à écrire dans le bus (rw=0)
					Data_rd 		: out  STD_LOGIC_VECTOR (7 downto 0); 		-- données lue dans le bus (rw=1)
					ack_error 	: buffer  STD_LOGIC;								-- erreur d'ACK
					busy 			: out  STD_LOGIC;									-- bus occupé
					SCL 			: inout  STD_LOGIC;								-- horloge du bus (Serial Clock)
					SDA 			: inout  STD_LOGIC								-- données du bus (Serial Data)
			  );								
end i2C_master;

architecture Behavioral of i2C_master is
	constant cycle_scl  : INTEGER := input_freq / bus_freq;			-- periode de l'horloge scl en cycles 
	constant quarter	  : INTEGER := (input_freq / bus_freq) / 4;						-- periode / 4 
	------ Etats ----------------------------------------------------------------------------------------------
	type I2C_States is (READY, START, COMMAND, SLAVE_ACK1, WR_DATA, RD_DATA, SLAVE_ACK2, MASTER_ACK,STOP);
	signal etat : I2C_States:=READY; 								-- etat actuel
	------ Registres et signaux internes -----------------------------------------------------------------------
	signal data_clock				: std_logic;								-- Horloge pour les données
	signal data_clock_prev		: std_logic;								-- Valeur precedente de l'horloge des données
	signal slave_scl_control 	: std_logic;								-- Indique si l'horloge scl est contrôlée par un esclave
	signal scl_out 				: std_logic := '0';						-- Met l'horloge scl interne en sortie si 1
	signal scl_interne 			: std_logic;								-- Horloge SCL interne
	signal sda_interne			: std_logic := '1';						-- SDA interne
	signal sda_out					: std_logic;   							-- Met les données internes (sda_interne) en sortie si 1
	signal adresse_esclave		: std_logic_vector(7 downto 0);		-- adresse de l'esclave cible
	signal data_tx 				: std_logic_vector(7 downto 0);		-- Prochaine donnée en attente de transmission
	signal data_rx 				: std_logic_vector(7 downto 0);		-- Dernière donnée lue
	signal bitNumber           : integer range 0 to 7 := 7;			-- compteur de bits dans la transaction actuelle
begin

with etat select
	sda_out <= data_clock_prev when START,
				  not data_clock_prev when STOP,
				  sda_interne when others;

SCL <= '0' when (scl_out='1' and scl_interne='0') else 'Z';
SDA <= '0' when sda_out = '0' else 'Z';


-----------------------------------------------------------------------------------------------------------
--- Génération des signaux d'horloges internes ( scl_interne et data_clock ) ------------------------------
-----------------------------------------------------------------------------------------------------------
gen_clk: process(CLK,RST)
	variable compteur : integer range 0 to cycle_scl; -- compteur de cycles de l'horloge d'entree
begin
	if(RST = '1') then											-- reset asynchrone
		slave_scl_control <= '0';								
		compteur := 0;
	elsif(CLK = '1' and CLK'event) then						-- sur front montant
		data_clock_prev <= data_clock;						-- on stocke la valeur data_clock precedente
		if(compteur = cycle_scl - 1) then					-- compteur arrivé en fin de cycle de l'horloge scl
			compteur := 0;
		elsif(slave_scl_control = '0') then					-- si l'esclave ne contrôle pas l'horloge
			compteur := compteur + 1;							-- on incrémente le compteur
		else
		end if;
		
		case compteur is									-- case sur chaque quart de cycle de scl
			when 0 to (quarter - 1) =>					-- 1er quart de cycle
				scl_interne <= '0';
				data_clock <= '0';
			when quarter to ((quarter*2) - 1) =>	-- 2eme quart de cycle
				scl_interne <= '0';
				data_clock <= '1';
			when quarter*2 to ((quarter*3) -1) =>	-- 3eme quart de cycle
				scl_interne <= '1';
				if(SCL = '0') then						-- détection du contrôle de l'esclave sur l'horloge
					slave_scl_control <= '1';
				else
					slave_scl_control <= '0';
				end if;
				data_clock <= '1';
			when others =>									-- 4eme quart de cycle
				scl_interne <= '1';
				data_clock <= '0';
		end case;
	end if;
end process;

------------------------------------------------------------------------------------------------------------------
-- Génération des sorties et mise à jour des etats ---------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
exec: process(CLK,RST)
begin
	if(RST = '1') then -- reset asynchrone
		etat <= READY;
		busy <= '1';
		scl_out <= '0';
		sda_interne <= '1';
		ack_error <= '0';
		bitNumber <= 7;
		data_rd <= (others=>'0');
	elsif(CLK='1' and CLK'event) then -- sur front montant de l'horloge d'entrée
		if(data_clock = '1' and data_clock_prev = '0') then -- sur front montant de la data_clock( donc front descendant scl)
			case etat is
				when READY      => ---------------- Etat READY: attente d'une requete de transaction -------------------
					if(ENABLE = '1') then 				-- requete de transaction
						busy <= '1';						-- le bus est occupé
						adresse_esclave <= ADDR & RW; -- adresse = concaténation de l'adresse de l'esclave et de l'instruction I/O
						data_tx <= Data_wr;				-- on envoie les données à transmettre en sortie
						etat <= START;						-- prochain etat -> START
					else										-- sinon le bus est inactif
						busy <= '0';						-- le bus n'est pas occupé
						etat <= READY;						-- on reste à l'etat READY
					end if;
				when START      => ------------------ Etat START : Passage à l'envoi de l'adresse ----------------------
					busy <= '1';											-- le bus est occupé
					sda_interne <= adresse_esclave(bitNumber);	-- on ecrit le premier bit de l'adresse
					etat <= COMMAND; 										-- on passe à l'etat COMMAND
				when COMMAND    => ------------------ Etat COMMAND: transaction de l'adresse d'un esclave --------------
					if(bitNumber = 0) then  									-- transaction terminée
						sda_interne <= '1';										-- on relève sda pour voir l'ACK
						bitNumber <= 7;											-- on réinitialise le compteurs de bits
						etat <= SLAVE_ACK1;										-- on passe à l'état SLAVE_ACK1
					else																-- transaction en cours
						bitNumber <= bitNumber - 1;							-- on décrémente le compteur de bits
						sda_interne <= adresse_esclave(bitNumber - 1);  -- on écrit le bit courant sur le bus
						etat <= COMMAND;											-- on reste à l'état COMMAND
					end if;
				when SLAVE_ACK1 => ------------------ Etat SLAVE_ACK1: attente de réception de l'ACK pour l'adresse -----
					if(adresse_esclave(0) = '0') then 		-- bit de poids faible à 0 -> écriture sur le bus (etat WR_DATA)
						sda_interne <= data_tx(bitNumber);	-- on écrit le premier bit
						etat <= WR_DATA;							-- on passe à l'état WR_DATA
					else												-- bit de poids faible à 1 -> lecture sur le bus (etat RD_DATA)
						sda_interne <= '1';						-- on relève sda à 1
						etat <= RD_DATA;							-- on passe à l'etat RD_DATA
					end if;
				when WR_DATA	 => ------------------ Etat WR_DATA : écriture sur le bus ---------------------------------
					busy <= '1';										-- bus occupé
					if(bitNumber = 0) then 							-- transaction terminée 
						sda_interne <= '1';							-- on releve sda pour voir l'ACK
						bitNumber <= 7;								-- on réinitialise bitNumber
						etat <= SLAVE_ACK2;							-- on passe à l'état SLAVE_ACK2
					else						  							-- transaction en cours 
						sda_interne <= data_tx(bitNumber - 1);	-- on écrit sur le bus
						etat <= WR_DATA;								-- on reste à l'état WR_DATA
					end if;
				when RD_DATA    => ----------------- Etat RD_DATA : lecture sur le bus -------------------------------------------
					busy <= '1';															-- bus occupé
					if(bitNumber = 0) then 												-- transaction terminée 
						if(ENABLE = '1' and adresse_esclave = ADDR & RW) then -- autre lecture à la meme adresse
							sda_interne <= '0';											-- ACK
						else																	-- sinon écriture, lecture d'une autre adresse ou stop
							sda_interne <= '1';											-- NON-ACK
						end if;
						bitNumber <= 7;													-- on réinitialise bitNumber
						Data_rd <= data_rx;												-- on met les données lues en sortie
						etat <= MASTER_ACK;												-- on passe à l'etat MASTER_ACK
					else						  												-- transaction en cours on reste à l'état RD_DATA
						bitNumber <= bitNumber - 1;									-- on décrémente le compteur de bits
						etat <= RD_DATA;													--	on reste à l'etat RD_DATA
					end if;
				when SLAVE_ACK2 => ------------------ Etat SLAVE_ACK2 : Accusé de réception de lecture sur le bus -----------------
					if(ENABLE='1') then								-- nouvelle transaction
						busy <= '0';									-- la transaction peut continuer
						adresse_esclave <= ADDR & RW;				-- adresse = concaténation de l'adresse de l'esclave et de l'instruction I/O
						data_tx <= Data_wr;							-- on collecte les données à écrire
						if(adresse_esclave = ADDR & RW) then	-- la transaction est une ecriture
							sda_interne <= data_tx(bitNumber);	-- on ecrit le premier bit
							etat <= WR_DATA;							-- on passe à l'etat WR_DATA
						else												-- la transaction est une lecture 
							etat <= START;								-- on passe à l'etat START
						end if;
					else													-- plus de transaction à effectuer
						etat <= STOP;									-- on passe à l'état STOP
					end if;
				when MASTER_ACK => ------------------ Etat MASTER_ACK : Accusé de réception d'ecriture sur le bus -----------------
					if(ENABLE='1') then								-- nouvelle transaction
						busy <= '0';									-- la transaction peut continuer
						adresse_esclave <= ADDR & RW;				-- adresse = concaténation de l'adresse de l'esclave et de l'instruction I/O
						data_tx <= Data_wr;							-- on collecte les données à écrire
						if(adresse_esclave = ADDR & RW) then	-- la transaction est une ecriture à la meme adresse
							sda_interne <= '1';						-- on ecrit 1 sur le bus
							etat <= RD_DATA;							-- on passe à l'etat RD_DATA
						else												-- la transaction est une lecture 
							etat <= START;								-- on passe à l'etat START
						end if;
					else													-- plus de transaction à effectuer
						etat <= STOP;									-- on passe à l'état STOP
					end if;
				when STOP       => ------------------ Etat STOP : interrompre lecture ou ecriture-----------------------------------
					busy <= '0';		-- bus inoccupé
					etat <= READY;		-- on passe à l'état READY
				when others     => -- par défault, on met l'état à READY
					etat <= READY;
			end case;
		elsif(data_clock = '0' and data_clock_prev = '1') then -- sur front descendant de la data_clock( donc front montant scl)
			case etat is
				when START => -- initialisation
					if(scl_out = '0') then 
						scl_out <= '1';
						ack_error <= '0';
					else
					end if;
				when SLAVE_ACK1 => -- recuperation d'ack
					if(SDA = '1' or ACK_ERROR = '1') then
						ack_error <= '1';
					else
					end if;
				when RD_DATA =>					-- lecture sur le bus
					data_rx(bitNumber) <= sda;
				when SLAVE_ACK2 => -- recuperation d'ack
					if(sda = '1' or ack_error = '1') then
						ack_error <= '1';
						else
					end if;
				when STOP =>
					scl_out <= '0';
				when others =>
			end case;
		else
		end if;
	else
	end if;
end process;


end Behavioral;

