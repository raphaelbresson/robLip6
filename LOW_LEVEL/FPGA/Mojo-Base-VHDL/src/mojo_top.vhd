----------------------------------------------------------------------------------
-- Mojo_top VHDL
-- Translated from Mojo-base Verilog project @ http://embeddedmicro.com/frontend/files/userfiles/files/Mojo-Base.zip
-- by Xark
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity mojo_top is
	port (
		clk			: in  	std_logic;							-- 50Mhz clock
		rst_n			: in  	std_logic;							-- "reset" button input (negative logic)
		cclk			: in  	std_logic;							-- configuration clock (?) from AVR (to detect when AVR ready)
--		led			: out 	std_logic_vector(7 downto 0);	-- 8 LEDs on Mojo board
		-- AVR --
		spi_sck		: in  	std_logic;							-- SPI clock to from AVR
		spi_ss		: in  	std_logic;							-- SPI slave select from AVR
		spi_mosi		: in  	std_logic;							-- SPI serial data master out, slave in (AVR -> FPGA)
		spi_miso		: out 	std_logic;							-- SPI serial data master in, slave out (AVR <- FPGA)
		spi_channel : out 	std_logic_vector(3 downto 0); -- analog read channel (input to AVR service task)
		avr_tx		: in  	std_logic;							-- serial data transmited from AVR/USB (FPGA recieve)
		avr_rx		: out 	std_logic;							-- serial data for AVR/USB to receive (FPGA transmit)
		avr_rx_busy : in  	std_logic;							-- AVR/USB buffer full (don't send data when true)
		-- I2C --
		scl			: out 	std_logic_vector(0 downto 0);	-- horloges i2c
		sda			: inout	std_logic_vector(0 downto 0);	-- datas i2c
		-- PWM --
		servo 		: out 	std_logic_vector(6 downto 0); -- sorties pwm des servomoteurs
		fast_pwm		: out 	std_logic_vector(1 downto 0);  -- sorties pwm des roues
			--debug lidar
		--etat : out STD_LOGIC_VECTOR(3 downto 0);
		--etatLidar : out STD_LOGIC_VECTOR(2 downto 0);
		-- debug sender
		etat_sender : OUT STD_LOGIC_VECTOR(2 downto 0);
		-- UART IMU
		RX_IMU : in STD_LOGIC;
		TX_IMU : out STD_LOGIC
	);
end mojo_top;

architecture RTL of mojo_top is

signal rst	: std_logic;										-- reset signal (rst_n inverted for postive logic)

-- signals for avr_interface
signal channel				: std_logic_vector(3 downto 0);
signal sample				: std_logic_vector(9 downto 0);
signal sample_channel	: std_logic_vector(3 downto 0);
signal new_sample			: std_logic;
signal tx_data				: std_logic_vector(7 downto 0);
signal rx_data				: std_logic_vector(7 downto 0);
signal new_tx_data		: std_logic;
signal new_rx_data		: std_logic;
signal tx_busy				: std_logic;

-- uart indépendant de l'avr-ATMEGA (115200 bauds) -> clk_per_bit = 434 -> ctr_size = 9
signal uart_new_tx 	: std_logic;
signal uart_new_rx	: std_logic;
signal uart_tx_busy	: std_logic;
signal uart_data_tx 	: std_logic_vector(7 downto 0);
signal uart_data_rx	: std_logic_vector(7 downto 0);
-- signaux de commande des entrées pwm
type com_pwm_tab is array(0 to 7) of std_logic_vector(9 downto 0);
signal com_pwm : com_pwm_tab; 

begin

controle: entity work.controller
	port map(
					clk => clk,
					rst => rst,
					
					-- UART --
					new_rx_data => new_rx_data,
					--new_rx_data => uart_new_rx,
					rx_data => rx_data,
					--rx_data => uart_data_rx,
					tx_data => tx_data,
					--tx_data => uart_data_tx,
					tx_busy => tx_busy,
					--tx_busy => uart_tx_busy,
					new_tx_data => new_tx_data,
					--new_tx_data => uart_new_tx,
					tx_block => avr_rx_busy,
					-- Analog -- 
					new_sample => new_sample,
					sample => sample,
					sample_channel => sample_channel,
					channel => channel,
					
					-- I2C --
					scl => scl,
					sda => sda,
					--servos
					servo_out => servo,
					fast_pwm => fast_pwm,
					-- debug lidar --
					--	etat => etat,
					--etatLidar => etatLidar,
					etat_sender => etat_sender,
					--IMU
					RX_IMU => RX_IMU,
					TX_IMU => TX_IMU
				);

		
rst	<= NOT rst_n;						-- generate non-inverted reset signal from rst_n button

-- instantiate the avr_interface (to handle USB UART and analog sampling, etc.)
avr_interface : entity work.avr_interface
	port map (
		clk			=> clk,				-- 50Mhz clock
		rst			=> rst,				-- reset signal
		-- AVR MCU pin connections (that will be managed)
		cclk		=> cclk,
		spi_miso	=> spi_miso,
		spi_mosi	=> spi_mosi,
		spi_sck		=> spi_sck,
		spi_ss		=> spi_ss,
		spi_channel	=> spi_channel,
		tx			=> avr_rx,
		tx_block	=> avr_rx_busy,
		rx			=> avr_tx,
		-- analog sample interface
		channel		=> channel,			-- set this to channel to sample (0, 1, 4, 5, 6, 7, 8, or 9)
		new_sample	=> new_sample,		-- indicates when new sample available
		sample_channel => sample_channel,	-- channel number of sample (only when new_sample = '1')
		sample		=> sample,			-- 10 bit sample value (only when new_sample = '1')
		-- USB UART tx interface
		new_tx_data	=> new_tx_data,		-- set to set data in tx_data (only when tx_busy = '0')
		tx_data		=> tx_data,			-- data to send
		tx_busy		=> tx_busy,			-- indicates AVR is not ready to send data
		-- USB UART rx interface
		new_rx_data	=> new_rx_data,		-- set when new data is received
		rx_data		=> rx_data			-- received data (only when new_tx_data = '1')
	);


end RTL;
