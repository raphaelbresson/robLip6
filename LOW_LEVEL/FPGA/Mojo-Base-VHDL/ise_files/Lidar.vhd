----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:46:44 03/18/2016 
-- Design Name: 
-- Module Name:    Lidar - Behavioral 
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

entity Lidar is
	 Generic ( 	
					data_length : Integer := 16;
					delay			: Integer := 4
				);
    Port ( 
			  CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           SCL : out  STD_LOGIC;
           SDA : inout  STD_LOGIC;
           DATA : out  STD_LOGIC_VECTOR(data_length - 1 downto 0);
			  NEW_DATA : out std_logic
			  -- debug
			 -- etat : out STD_LOGIC_VECTOR(3 downto 0);
			 -- etatLidar : out STD_LOGIC_VECTOR(2 downto 0)
			  );
end Lidar;

architecture Behavioral of Lidar is
	constant adresse : std_logic_vector(6 downto 0) := "1100010";
	constant register_measure : std_logic_vector(7 downto 0) := X"00";
	constant measure_value : std_logic_vector(7 downto 0) := X"04";
	constant register_high_low_b : std_logic_vector(7 downto 0) := X"8f";
	constant num_Bytes_To_Read : integer := data_length / 8; 
	type Lidar_states is (INIT1, 
								 INIT2, 
								 PAUSE_INIT,
								 START, 
								 PAUSE_1, 
								 HIGH_LOW_BYTES, 
								 PAUSE_2, 
								 REQUEST1,
								 REQUEST2,
								 PAUSE_3);
	signal etat_present, etat_futur : Lidar_states := INIT1;
	signal enable_d, enable_q : std_logic:='1';
	signal bytes_to_write_d, bytes_to_write_q : integer := 0;
	signal bytes_to_read_d, bytes_to_read_q : integer := 0;
	signal count_delay_t,count_delay_d, count_delay_q : integer := delay;
	signal busy : std_logic;
	signal rw_d, rw_q : std_logic := '0';
	signal data_rd_d, data_rd_q, data_rd_t : std_logic_vector(7 downto 0):=(others=>'0');
	signal data_wr_d, data_wr_q : std_logic_vector(7 downto 0):=(others=>'0');
	signal ack_error_t, ack_error_d,ack_error_q : std_logic;
	signal out_data_d, out_data_q : std_logic_vector(data_length - 1 downto 0);
	signal new_data_d, new_data_q : std_logic:='0';
	signal clk_i2c, clk_i2c_prec : std_logic;
begin
--DEBUG
--WITH etat_present SELECT etatLidar <=
--	"000" WHEN INIT1,
--	"001" WHEN INIT2,
--	"010" WHEN START,
--	"011" WHEN HIGH_LOW_BYTES,
--	"100" WHEN REQUEST1,
--	"101" WHEN REQUEST2,
--	"111" WHEN OTHERS;

DATA <= out_data_q;
NEW_DATA <= new_data_q;
i2c_interface: entity work.i2c
	port map(
			clk => CLK,
			rst => RST,
			enable => enable_q,
			addr => adresse,
			rw_CMD => rw_q,
			data_TX => data_wr_q,
			data_RX => data_rd_t,
			error_ack => ack_error_t,
			busy => busy,
			SCL => SCL,
			SDA => SDA,
			CLK_I2C => clk_i2c,
			CLK_I2C_PREC => clk_i2c_prec
			--debug
			--etat => etat
		);
		
delai:process(CLK)
begin
	if(CLK='1' and CLK'event) then
		if(etat_present=PAUSE_INIT or etat_present=PAUSE_1 or etat_present=PAUSE_2 or etat_present=PAUSE_3) then 
			count_delay_t <= count_delay_q - 1;
		else
		end if;
	end if;
end process;

comb_lidar: process(enable_q,RST,busy,ack_error_t,count_delay_t,CLK_I2C)
begin
	enable_d <= enable_q;
	data_rd_d <= data_rd_t;
	data_wr_d <= data_wr_q;
	ack_error_d <= ack_error_t;
	bytes_to_write_d <= bytes_to_write_q;
	bytes_to_read_d <= bytes_to_read_q;
	rw_d <= rw_q;
	out_data_d <= out_data_q;
	etat_futur <= etat_present;
	new_data_d <= new_data_q;
	case etat_present is
		-- INIT : on ne fait rien et on passe à l'état START 
		when INIT1 =>
			new_data_d <= '0';
			enable_d <= '1';
			bytes_to_write_d <= 2;
			etat_futur <= INIT2;
		when INIT2 =>
			new_data_d <= '0';
			rw_d <= '0';
			enable_d <= '1';
			if(busy = '0' and ack_error_q = '0') then			-- le bus n'est pas occupé (écriture terminée d'un octet)
				if(bytes_to_write_q = 2) then			-- premier octet adresse de registre de mesure
					enable_d <= '1';
					data_wr_d <= (others=>'0');
					bytes_to_write_d <= 1;
					etat_futur <= INIT2;
				elsif(bytes_to_write_q = 1) then		-- deuxième octet: adresse de la valeur
					enable_d <= '1';
					data_wr_d <= (others=>'0');
					bytes_to_write_d <= 0;
					etat_futur <= INIT2;
				else											-- fin de l'etat
					enable_d <= '0';
					count_delay_d <= delay;
					etat_futur <= PAUSE_INIT;
				end if;
			else -- le bus est occupé
				if(ack_error_q = '1') then
					enable_d <= '0';
					etat_futur <= INIT1;
				else
					enable_d <= '1';
					data_wr_d <= data_wr_q;
					etat_futur <= INIT2;
				end if;
			end if;
		--	PAUSE_INIT : On ne fait rien pendant 20 ms
		when PAUSE_INIT =>
			new_data_d <= '0';
			if(count_delay_q > 0) then
				enable_d <= '0';
				count_delay_d <= count_delay_t;
				etat_futur <= PAUSE_INIT;
			else
				enable_d <= '1';
				bytes_to_write_d <= 2;
				etat_futur <= START;
			end if;
		-- START : on envoie les adresses des registres que l'on souhaite récupérer
		when START =>
			new_data_d <= '0';
			rw_d <= '0';
			if(busy = '0' and ack_error_q = '0') then			-- le bus n'est pas occupé (écriture terminée d'un octet)
				if(bytes_to_write_q = 2) then			-- premier octet adresse de registre de mesure
					enable_d <= '1';
					data_wr_d <= register_measure;
					bytes_to_write_d <= 1;
					etat_futur <= START;
				elsif(bytes_to_write_q = 1) then		-- deuxième octet: adresse de la valeur
					enable_d <= '1';
					data_wr_d <= measure_value;
					bytes_to_write_d <= 0;
					etat_futur <= START;
				else											-- fin de l'etat
					count_delay_d <= delay;
					enable_d <= '0';
					etat_futur <= PAUSE_1;
				end if;
			else -- le bus est occupé
				if(bytes_to_write_q = 0) then
					enable_d <= '0';
				else
					enable_d <= '1';
				end if;
				data_wr_d <= data_wr_q;
				etat_futur <= START;
			end if;
		-- PAUSE_1 : On ne fait rien pendant 20 ms	
		when PAUSE_1 =>
			new_data_d <= '0';
			if(count_delay_q > 0) then
				enable_d <= '0';
				count_delay_d <= count_delay_t;
				etat_futur <= PAUSE_1;
			else
				enable_d <= '1';
				bytes_to_write_d <= 1;
				etat_futur <= HIGH_LOW_BYTES;
				data_wr_d <= register_high_low_b;
			end if;
		-- HIGH_LOW_BYTES : On envoie la commande pour récupérer les deux octets d'un coup
		when HIGH_LOW_BYTES =>
			new_data_d <= '0';
			rw_d <= '0';
			if(busy = '0' and ack_error_q = '0') then
				if(bytes_to_write_q = 1) then
					enable_d <= '1';
					bytes_to_write_d <= 0;
					data_wr_d <= register_high_low_b;
					etat_futur <= HIGH_LOW_BYTES;
				else
					enable_d <= '0';
					count_delay_d <= delay;
					etat_futur <= PAUSE_2;
				end if;
			else
				enable_d <= '0';
				data_wr_d <= data_wr_q;
				etat_futur <= HIGH_LOW_BYTES;
			end if;
		-- PAUSE_2 : On ne fait rien pendant 20 ms
		when PAUSE_2 =>
			new_data_d <= '0';
			enable_d <= '0';
			if(count_delay_q > 0) then
				enable_d <= '0';
				count_delay_d <= count_delay_t;
				etat_futur <= PAUSE_2;
			else
				enable_d <= '1';
				rw_d <= '1';
				bytes_to_read_d <= 2;
				etat_futur <= REQUEST1;
			end if;
			
		when REQUEST1 =>
			new_data_d <= '0';
			enable_d <= '1';
			rw_d <= '1';
			out_data_d((bytes_to_read_q * 8)-1 downto ((bytes_to_read_q-1)*8)) <= data_rd_q;
			etat_futur <= REQUEST2;
			
		when REQUEST2 =>
			out_data_d <= out_data_q;
			if(busy = '0' and ack_error_q = '0') then
				if(bytes_to_read_q = 2) then
					rw_d <= '1';
					new_data_d <= '0';
					enable_d <= '1';
					bytes_to_read_d <= 1;
					etat_futur <= REQUEST1;
				else
					--rw_d <= '0';
					new_data_d <= '1';
					enable_d <= '0';
					count_delay_d <= delay;
					etat_futur <= PAUSE_3;
				end if;
			else
				if(bytes_to_read_q = 1) then
					enable_d <= '0';
				else
					enable_d <= '1';
				end if;
				new_data_d <= '0';
				etat_futur <= REQUEST2;
				out_data_d <= out_data_q;
			end if;
		-- PAUSE_3 : On ne fait rien pendant 20 ms et on repasse à l'etat START
		when PAUSE_3 =>
			new_data_d <= '0';
			if(count_delay_q > 0) then
				enable_d <= '0';
				count_delay_d <= count_delay_t;
				etat_futur <= PAUSE_3;
			else
				enable_d <= '1';
				rw_d <= '0';
				bytes_to_write_d <= 2;
				etat_futur <= START;
			end if;
	end case;
end process;

clocked_lidar : process(CLK,RST)
begin
	if(RST = '1') then
		etat_present <= INIT1;
		enable_q <= '0';
		data_rd_q <= (others=>'0');
		data_wr_q <= (others=>'0');
		bytes_to_write_q <= 0;
		bytes_to_read_q <= 0;
		out_data_q <= (others=>'0');
		count_delay_q <= 0;
		rw_q <= '0';
		new_data_q <= '0';
	elsif(CLK='1' and CLK'event) then
		if(CLK_I2C = '0' and CLK_I2C_PREC = '1') then
			enable_q <= enable_d;
			data_rd_q <= data_rd_d;
			data_wr_q <= data_wr_d;
			bytes_to_write_q <= bytes_to_write_d;
			bytes_to_read_q <= bytes_to_read_d; 
			ack_error_q <= ack_error_d;
			out_data_q <= out_data_d;
			count_delay_q <= count_delay_d;
			rw_q <= rw_d;
			new_data_q <= new_data_d;
			etat_present <= etat_futur;
		elsif(CLK_I2C = '1' and CLK_I2C_PREC = '0') then
			enable_q <= enable_d;
			data_rd_q <= data_rd_d;
			data_wr_q <= data_wr_d;
			bytes_to_write_q <= bytes_to_write_d;
			bytes_to_read_q <= bytes_to_read_d; 
			ack_error_q <= ack_error_d;
			out_data_q <= out_data_d;
			count_delay_q <= count_delay_d;
			rw_q <= rw_d;
			new_data_q <= new_data_d;
			etat_present <= etat_futur;
		end if;
	else
	end if;
end process;


end Behavioral;

