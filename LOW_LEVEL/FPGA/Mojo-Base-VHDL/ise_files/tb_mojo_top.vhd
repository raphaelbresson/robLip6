--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:52:46 03/28/2016
-- Design Name:   
-- Module Name:   /home/raphael/Desktop/Mojo-Base-VHDL/ise_files/tb_mojo_top.vhd
-- Project Name:  Mojo-Base-VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mojo_top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_mojo_top IS
END tb_mojo_top;
 
ARCHITECTURE behavior OF tb_mojo_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mojo_top
    PORT(
         clk : IN  std_logic;
         rst_n : IN  std_logic;
         cclk : IN  std_logic;
         spi_sck : IN  std_logic;
         spi_ss : IN  std_logic;
         spi_mosi : IN  std_logic;
         spi_miso : OUT  std_logic;
         spi_channel : OUT  std_logic_vector(3 downto 0);
         avr_tx : IN  std_logic;
         avr_rx : OUT  std_logic;
         avr_rx_busy : IN  std_logic;
         scl : OUT  std_logic_vector(0 downto 0);
         sda : INOUT  std_logic_vector(0 downto 0);
			servo 		: out 	std_logic_vector(6 downto 0); 
			fast_pwm		: out 	std_logic_vector(1 downto 0);
			RX_IMU : in STD_LOGIC;
			TX_IMU : out STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst_n : std_logic := '0';
   signal cclk : std_logic := '0';
   signal spi_sck : std_logic := '0';
   signal spi_ss : std_logic := '0';
   signal spi_mosi : std_logic := '0';
   signal avr_tx : std_logic := '0';
   signal avr_rx_busy : std_logic := '0';

	signal servo : std_logic_vector(6 downto 0):=(others=>'0'); 
	signal fast_pwm	: std_logic_vector(1 downto 0):=(others=>'0');
	signal RX_IMU : STD_LOGIC:='0';
	signal TX_IMU : STD_LOGIC:='0';
	--BiDirs
   signal scl : std_logic_vector(0 downto 0);
   signal sda : std_logic_vector(0 downto 0);

 	--Outputs
   signal spi_miso : std_logic;
   signal spi_channel : std_logic_vector(3 downto 0);
   signal avr_rx : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
   constant cclk_period : time := 62500 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mojo_top PORT MAP (
          clk => clk,
          rst_n => rst_n,
          cclk => cclk,
          spi_sck => spi_sck,
          spi_ss => spi_ss,
          spi_mosi => spi_mosi,
          spi_miso => spi_miso,
          spi_channel => spi_channel,
          avr_tx => avr_tx,
          avr_rx => avr_rx,
          avr_rx_busy => avr_rx_busy,
          scl => scl,
          sda => sda,
			 servo => servo,
			 fast_pwm=>fast_pwm,
			 RX_IMU => RX_IMU,
			 TX_IMU => TX_IMU
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   cclk_process :process
   begin
		cclk <= '0';
		wait for cclk_period/2;
		cclk <= '1';
		wait for cclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
	rst_n <= '0';
      wait for 100 ns;
			rst_n <= '1';
	avr_rx <= '1';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
