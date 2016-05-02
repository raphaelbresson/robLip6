----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:18:30 05/02/2016 
-- Design Name: 
-- Module Name:    IMU - Behavioral 
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

entity IMU is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           YAW : out  STD_LOGIC_VECTOR (31 downto 0);
           PITCH : out  STD_LOGIC_VECTOR (31 downto 0);
           ROLL : out  STD_LOGIC_VECTOR (31 downto 0);
           NEW_DATAS : out  STD_LOGIC;
			  RX_IMU : in STD_LOGIC;
			  TX_IMU : out STD_LOGIC);
end IMU;

architecture Behavioral of IMU is
-- MACHINE A ETATS --
type etatIMU is (START,INIT1,INIT2,RD_YAW1,RD_YAW2,RD_PITCH1,RD_PITCH2,RD_ROLL1,RD_ROLL2);
signal state_d, state_q: etatIMU;
signal new_data_d, new_data_q : STD_LOGIC;
-- COMMUNICATION IMU VIA UART --
signal rx_data,tx_data_d, tx_data_q : STD_LOGIC_VECTOR(7 downto 0);
signal new_rx_data, new_tx_data_d, new_tx_data_q, tx_busy : STD_LOGIC;
-- COMMANDE --
type MOT is ARRAY(0 to 3) of STD_LOGIC_VECTOR(7 downto 0);
constant BINARY_MODE: MOT := (X"43", X"157", X"98", X"00") ; -- #ob
constant NB_BYTES : INTEGER := 4;
-- Compteur
signal cpt_d, cpt_q : INTEGER:=0;
-- ANGLES D'EULER --
signal pitch_d, pitch_q : MOT:=(others=>(others=>'0'));
signal yaw_d, yaw_q : MOT:=(others=>(others=>'0'));
signal roll_d, roll_q : MOT:=(others=>(others=>'0'));

begin

YAW <= yaw_q(0) & yaw_q(1) & yaw_q(2) & yaw_q(3);
PITCH <= pitch_q(0) & pitch_q(2) & pitch_q(3);
ROLL <= roll_q(0) & roll_q(1) & roll_q(2) & roll_q(3);

IMU_rx: entity work.serial_rx
	generic map (
		CLK_PER_BIT	=> 868,
		CTR_SIZE	=> 10
	)
	port map (
		clk		=> CLK,
		rst		=> RST,
		rx			=> RX_IMU,
		data		=> rx_data,
		new_data	=> new_rx_data
	);

IMU_tx	: entity work.serial_tx
	generic map (
		CLK_PER_BIT	=>	868,
		CTR_SIZE	=>	10
	)
	port map (
		clk		=> CLK,
		rst		=> RST,
		tx			=> TX_IMU,
		tx_block	=> '0',
		busy		=> tx_busy,
		data		=> tx_data_q,
		new_data	=> new_tx_data_q
	);
	
comb: process(CLK,RST,RX_IMU,tx_busy,new_rx_data)
begin
	tx_data_d <= tx_data_q;
	new_tx_data_d <= new_tx_data_q;
	yaw_d <= yaw_q;
	pitch_d <= pitch_q;
	roll_d <= roll_q;
	state_d <= state_q;
	cpt_d <= cpt_q;
	case state_q is
		when START =>
			new_data_d <= '0';
			tx_data_d <= (others=>'0');
			new_tx_data_d <= '0';
			yaw_d <= (others=>(others=>'0'));
			pitch_d <= (others=>(others=>'0'));
			roll_d <= (others=>(others=>'0'));
			cpt_d <= 0;
			state_d <= INIT1;
			
		when INIT1 =>
			tx_data_d <= BINARY_MODE(cpt_q);
			new_tx_data_d <= '1';
			state_d <= INIT2;
		when INIT2 =>
			if(tx_busy='0' and new_tx_data_d <= '0') then
				new_tx_data_d <= '0';
				if(cpt_q < NB_BYTES) then
					cpt_d <= cpt_q + 1;
					state_d <= INIT1;
				elsif(new_rx_data = '1') then
					cpt_d <= NB_BYTES;
					state_d <= RD_YAW1;
				end if;
			end if;
			
		when RD_YAW1 =>
			new_data_d <= '0';
			yaw_d(cpt_q) <= rx_data;
			state_d <= RD_YAW2;
		when RD_YAW2 =>
			new_data_d <= '0';
			if(new_rx_data='1') then
				if(cpt_q < NB_BYTES) then
					cpt_d <= cpt_q + 1;
					state_d <= RD_YAW1;
				else
					cpt_d <= NB_BYTES;
					state_d <= RD_PITCH1;
				end if;
			end if;
			
			
		when RD_PITCH1 =>
			new_data_d <= '0';
			pitch_d(cpt_q) <= rx_data;
			state_d <= RD_PITCH2;
		when RD_PITCH2 =>
			new_data_d <= '0';
			if(new_rx_data='1') then
				if(cpt_q < NB_BYTES) then
					cpt_d <= cpt_q + 1;
					state_d <= RD_PITCH1;
				else
					cpt_d <= NB_BYTES;
					state_d <= RD_ROLL1;
				end if;
			end if;
		when RD_ROLL1 =>
			new_data_d <= '0';
			roll_d(cpt_q) <= rx_data;
			state_d <= RD_PITCH2;
		when RD_ROLL2 =>
			if(new_rx_data='1') then
				if(cpt_q < NB_BYTES) then
					cpt_d <= cpt_q + 1;
					state_d <= RD_ROLL1;
					new_data_d <= '0';
				else
					new_data_d <= '1';
					cpt_d <= NB_BYTES;
					state_d <= RD_YAW1;
				end if;
			end if;
		when others => -- JAMAIS!!!
			tx_data_d <= (others=>'0');
			new_tx_data_d <= '0';
			yaw_d <= (others=>(others=>'0'));
			pitch_d <= (others=>(others=>'0'));
			roll_d <= (others=>(others=>'0'));
			new_data_d <= '0';
			state_d <= START;
	end case;
end process;

clocked : process(CLK,RST)
begin
	if(RST='1') then
		tx_data_q <= (others=>'0');
		new_tx_data_q <= '0';
		yaw_q <= (others=>(others=>'0'));
		pitch_q <= (others=>(others=>'0'));
		roll_q <= (others=>(others=>'0'));
		new_data_q <= '0';
		state_q <= START;
	elsif(CLK='1' and CLK'event) then
		tx_data_q <= tx_data_d;
		new_tx_data_q <= new_tx_data_d;
		yaw_q <= yaw_d;
		pitch_q <= pitch_d;
		roll_q <= roll_d;
		new_data_q <= new_data_d;
		state_q <= state_d;
	end if;
end process;

end Behavioral;

