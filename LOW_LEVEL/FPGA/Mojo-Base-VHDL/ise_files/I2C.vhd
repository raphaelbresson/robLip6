----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:01:47 03/19/2016 
-- Design Name: 
-- Module Name:    I2C - Behavioral 
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

entity I2C is
	Generic( DIVIDE_FACTOR_CLK : INTEGER := 500); -- 125 -> fast-mode, 500 -> slow-mode
    Port ( 
				CLK : in  STD_LOGIC;
				RST : in  STD_LOGIC;
				ENABLE : in STD_LOGIC;
				
				ADDR : in STD_LOGIC_VECTOR(6 downto 0);
				RW_CMD : in STD_LOGIC;
           
				data_rx   : out  STD_LOGIC_VECTOR(7 downto 0);
				data_tx 	 : in  STD_LOGIC_VECTOR(7 downto 0);
				ERROR_ACK : out  STD_LOGIC;
				BUSY		 : out  STD_LOGIC;
				SDA : inout  STD_LOGIC;
				SCL : inout  STD_LOGIC
			  );
end I2C;

architecture Behavioral of I2C is
type i2c_states is (	
								IDLE,
								COMMAND1,
								COMMAND2,
								SLV_ACK1_1,
								SLV_ACK1_2,							
								WR_DATA1,
								WR_DATA2,
								RD_DATA1,
								RD_DATA2,
								SLV_ACK2_1,
								SLV_ACK2_2,
								MASTER_ACK1,
								MASTER_ACK2,
								STOP1,
								STOP2,
								STOP3
							);
signal Etat_present, etat_futur : i2c_states;
signal sda_d,sda_q : STD_LOGIC:='1';
signal scl_d,scl_q,scl_out_d, scl_out_q : STD_LOGIC:='1';
signal sclp_d,sclp_q : STD_LOGIC:='1';
signal ack_error_d,ack_error_q : STD_LOGIC;
signal count_gen_scl_d, count_gen_scl_q: INTEGER := 0;
signal bit_counter_d, bit_counter_q: INTEGER := 7;
signal adresse_d,adresse_q : STD_LOGIC_VECTOR(7 downto 0);
signal busy_d, busy_q: STD_LOGIC:='0';
signal rx_d,rx_q: STD_LOGIC_VECTOR(7 downto 0);
begin

SDA <= 'Z' when sda_q = '1' else '0';
SCL <= scl_out_q;
DATA_RX <= rx_q;
BUSY <= busy_q;
ERROR_ACK <= ack_error_q;

gen_scl_comb:process(CLK,RST,data_tx,ADDR,RW_CMD,ENABLE,SDA,SCL,count_gen_scl_q,scl_q) 
begin
	scl_d <= scl_q;
	sclp_d <= scl_q;
	if(count_gen_scl_q < DIVIDE_FACTOR_CLK) then
		count_gen_scl_d <= count_gen_scl_q + 1;
		if(count_gen_scl_q < DIVIDE_FACTOR_CLK/2) then
			scl_d <= '1';
		else
			scl_d <= '0';
		end if;
	else
		count_gen_scl_d <= 0;
	end if;
end process;

gen_scl_clocked:process(CLK,RST)
begin
	
	if(RST='1') then
		scl_q <= '0';
	elsif(CLK='1' and CLK'event) then
		scl_q <= scl_d;
		count_gen_scl_q <= count_gen_scl_d;
		sclp_q <= sclp_d;
	end if;
end process;

i2c_comb:process(CLK,RST,data_tx,ADDR,RW_CMD,ENABLE,SDA,SCL,scl_q,sda_q,etat_present,ack_error_q,adresse_q,busy_q)
begin
	sda_d <= sda_q;
	etat_futur <= etat_present;
	ack_error_d <= ack_error_q;
	adresse_d <= adresse_q;
	busy_d <= busy_q;
	scl_out_d <= scl_out_q;
	rx_d <= rx_q;
	bit_counter_d <= bit_counter_q;
	case etat_present is
		------------------------------- IDLE
		when IDLE =>
			scl_out_d <= '1';
			if(Enable='1') then
				ack_error_d <= '0';
				busy_d <='1';
				sda_d <= '0'; -- start condition
				bit_counter_d <= 7;
				etat_futur <= COMMAND1;
				adresse_d <= ADDR & RW_CMD;
			else
				sda_d <= '1';
				busy_d <= '0';
				etat_futur <= IDLE;
			end if;
		------------------------------- COMMAND: ADRESSE + RW	
		when COMMAND1 =>
			busy_d <= '1';
			scl_out_d <= '0';
			sda_d <= adresse_q(bit_counter_q);
			etat_futur <= COMMAND2;
			
		when COMMAND2 =>
			busy_d <= '1';
			scl_out_d <= '1';
			if(bit_counter_q > 0) then
				etat_futur <= COMMAND1;
				bit_counter_d <= bit_counter_q - 1;
			else
				etat_futur <= SLV_ACK1_1;
			end if;
		-------------------------------- ACK ESCLAVE DE ADRESSE + RW
		when SLV_ACK1_1 =>
			busy_d <= '1';
			scl_out_d <= '0';
			sda_d <= '1';
			etat_futur <= SLV_ACK1_2;
		when SLV_ACK1_2=>
			busy_d <= '1';
			scl_out_d <= '1';
			if(SDA='1' or ack_error_q='1') then -- non-reception de l'ACK
				ack_error_d <= '1';
				etat_futur <= STOP1;
			else
				ack_error_d <= '0';
				if(RW_CMD = '0') then
					bit_counter_d <= 7;
					etat_futur <= WR_DATA1;
				else
					bit_counter_d <= 8;
					--sda_d <= '1';
					etat_futur <= RD_DATA1;
				end if;
			end if;
		--------------------------------- WR_DATA ECRITURE D'UN OCTET	
		when WR_DATA1 =>
			busy_d <= '1';
			scl_out_d <= '0';
			sda_d <= DATA_TX(bit_counter_q);
			etat_futur <= WR_DATA2;
		when WR_DATA2 =>
			busy_d <= '1';
			scl_out_d <= '1';
			if(bit_counter_q > 0) then
				etat_futur <= WR_DATA1;
				bit_counter_d <= bit_counter_q - 1;
			else
				etat_futur <= SLV_ACK2_1;
			end if;
		--------------------------------- RD_DATA LECTURE D'UN OCTET	
		when RD_DATA1 =>
			busy_d <= '1';
			scl_out_d <= '0';
			sda_d <= '1';
			etat_futur <= RD_DATA2;
		when RD_DATA2 =>
			busy_d <= '1';
			scl_out_d <= '1';
			if(bit_counter_q > 0) then
				etat_futur <= RD_DATA1;
				bit_counter_d <= bit_counter_q - 1;
				rx_d(bit_counter_q - 1) <= SDA;
			else
				etat_futur <= MASTER_ACK1;
			end if;
		--------------------------------- ACK ECRITURE D'UN OCTET
		when SLV_ACK2_1 =>
			busy_d <= '0';
			scl_out_d <= '0';
			sda_d <= '1';
			etat_futur <= SLV_ACK2_2;
			
		when SLV_ACK2_2 =>
			busy_d <= '0';
			scl_out_d <= '1';
			if(SDA='1' or ack_error_q='1') then 
				ack_error_d <= '1';
				etat_futur <= STOP1;
			else
				ack_error_d <= '0';
				if(RW_CMD = '0' and ADDR = adresse_q(6 downto 0) and Enable='1') then
					bit_counter_d <= 7;
					etat_futur <= WR_DATA1;
				else
					etat_futur <= STOP1;
				end if;
			end if;
		--------------------------------- ACK LECTURE D'UN OCTET
		when MASTER_ACK1 =>
			busy_d <= '0'; 
			scl_out_d <= '0';
			sda_d <= '0';
			etat_futur <= MASTER_ACK2;
		when MASTER_ACK2 =>
			busy_d <= '0';
			scl_out_d <= '1';
			sda_d <= '0';
			if(RW_CMD = '1' and ADDR = adresse_q(6 downto 0) and Enable='1') then
				bit_counter_d <= 8;
				etat_futur <= RD_DATA1;
			else
				etat_futur <= STOP1;
			end if;
		---------------------------------- STOP ARRET DU BUS
		when STOP1 =>
			busy_d <= '0';
			scl_out_d <= '0';
			sda_d <= '0';
			etat_futur <= STOP2;
		when STOP2 =>
			busy_d <= '0';
			scl_out_d <= '1';
			sda_d <= '0';
			etat_futur <= STOP3;
		when STOP3 =>
			busy_d <= '0';
			scl_out_d <= '1';
			sda_d <= '1';
			etat_futur <= IDLE;
	end case;
end process;

i2c_clocked: process(CLK,scl_q,RST)
begin
	if(RST='1') then
		sda_q <= '1';
		etat_present <= IDLE;
		ack_error_q <= '0';
		adresse_q <= (others=>'0');
		busy_q <= '0';
		scl_out_q <= '1';
		rx_q <= (others=>'0');
		bit_counter_q <= 7;
	elsif(CLK = '1' and CLK'event) then
			if(scl_q='1' and sclp_q = '0') then
				sda_q <= sda_d;
				etat_present <= etat_futur;
				ack_error_q <= ack_error_d;
				adresse_q <= adresse_d;
				busy_q <= busy_d;
				scl_out_q <= scl_out_d;
				rx_q <= rx_d;
				bit_counter_q <= bit_counter_d;
			elsif(scl_q='0' and sclp_q = '1') then
				sda_q <= sda_d;
				etat_present <= etat_futur;
				ack_error_q <= ack_error_d;
				adresse_q <= adresse_d;
				busy_q <= busy_d;
				scl_out_q <= scl_out_d;
				rx_q <= rx_d;
				bit_counter_q <= bit_counter_d;
			end if;
	end if;
end process;

end Behavioral;

