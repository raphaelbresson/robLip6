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
		clk			: in  std_logic;		-- 50Mhz clock
		rst_n		: in  std_logic;		-- "reset" button input (negative logic)
		cclk		: in  std_logic;		-- configuration clock (?) from AVR (to detect when AVR ready)
		led			: out std_logic_vector(7 downto 0);	 -- 8 LEDs on Mojo board
		spi_sck		: in  std_logic;		-- SPI clock to from AVR
		spi_ss		: in  std_logic;		-- SPI slave select from AVR
		spi_mosi	: in  std_logic;		-- SPI serial data master out, slave in (AVR -> FPGA)
		spi_miso	: out std_logic;		-- SPI serial data master in, slave out (AVR <- FPGA)
		spi_channel : out std_logic_vector(3 downto 0);  -- analog read channel (input to AVR service task)
		avr_tx		: in  std_logic;		-- serial data transmited from AVR/USB (FPGA recieve)
		avr_rx		: out std_logic;		-- serial data for AVR/USB to receive (FPGA transmit)
		avr_rx_busy : in  std_logic			-- AVR/USB buffer full (don't send data when true)
--		pwm_out			: out std_logic   -- sorties pwm
	);
end mojo_top;

architecture RTL of mojo_top is

signal rst	: std_logic;		-- reset signal (rst_n inverted for postive logic)

-- signals for avr_interface
signal channel			: std_logic_vector(3 downto 0);
signal sample			: std_logic_vector(9 downto 0);
signal sample_channel	: std_logic_vector(3 downto 0);
signal new_sample		: std_logic;
signal tx_data			: std_logic_vector(7 downto 0);
signal rx_data			: std_logic_vector(7 downto 0);
signal new_tx_data		: std_logic;
signal new_rx_data		: std_logic;
signal tx_busy			: std_logic;

-- signal de commande des entrées pwm
type com_pwm_tab is array(0 to 7) of std_logic_vector(9 downto 0);
signal com_pwm : com_pwm_tab; 

begin

-- entrees analogiques
analog_inputs: entity work.Analog_in
	port map(
			clk => clk,
			rst => rst,
			new_sample => new_sample,
			sample => sample,
			sample_channel => sample_channel,
			channel => channel,
			analog_0 => com_pwm(0),
			analog_1 => com_pwm(1),
			analog_2 => com_pwm(2),
			analog_3 => com_pwm(3),
			analog_4 => com_pwm(4),
			analog_5 => com_pwm(5),
			analog_6 => com_pwm(6),
			analog_7 => com_pwm(7)
		); 

-- test pwm avec les leds
gen_led_pwm: for i in 0 to 7 generate
	pwm_output_leds : entity work.pwm_mgr
		generic map(
				com_length => 10,
				cmp_length => 20
			)
		port map(
			clk => clk,
			rst => rst,
			com => com_pwm(i),
			pwm => led(i)
		);
end generate;
-- test pwm avec l'oscilloscope (Pin 58)		
--pwm_output8 : entity work.pwm_mgr
--	generic map(
--				com_length => 10
--			)
--	port map(
--		clk => clk,
--		rst => rst,
--		com => com_pwm(0),
--		pwm => pwm_out
--		);
		
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

testUART:process(CLK)
begin
	if(CLK='1' and CLK'event) then
		new_tx_data <= '1';
		tx_data <= "01010111";
	end if;
end process;


end RTL;
