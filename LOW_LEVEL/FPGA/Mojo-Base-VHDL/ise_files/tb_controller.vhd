--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:20:22 03/23/2016
-- Design Name:   
-- Module Name:   /home/raphael/Desktop/Mojo-Base-VHDL/ise_files/tb_controller.vhd
-- Project Name:  Mojo-Base-VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Controller
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
 
ENTITY tb_controller IS
END tb_controller;
 
ARCHITECTURE behavior OF tb_controller IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Controller
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         NEW_RX_DATA : IN  std_logic;
         RX_DATA : IN  std_logic_vector(7 downto 0);
         TX_BUSY : IN  std_logic;
			TX_BLOCK : in std_logic;
         TX_DATA : OUT  std_logic_vector(7 downto 0);
         NEW_TX_DATA : OUT  std_logic;
         NEW_SAMPLE : IN  std_logic;
         SAMPLE : IN  std_logic_vector(9 downto 0);
         SAMPLE_CHANNEL : IN  std_logic_vector(3 downto 0);
         CHANNEL : OUT  std_logic_vector(3 downto 0);
         SCL : INOUT  std_logic_vector(0 downto 0);
         SDA : INOUT  std_logic_vector(0 downto 0);
			SERVO_OUT : OUT std_logic_vector(6 downto 0);
			FAST_PWM : OUT std_logic_vector(1 downto 0);
			RX_IMU : IN std_logic;
			TX_IMU : OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal NEW_RX_DATA : std_logic := '0';
   signal RX_DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal TX_BUSY : std_logic := '0';
   signal NEW_SAMPLE : std_logic := '0';
   signal SAMPLE : std_logic_vector(9 downto 0) := (others => '0');
   signal SAMPLE_CHANNEL : std_logic_vector(3 downto 0) := (others => '0');

	--BiDirs
   signal SCL : std_logic_vector(0 downto 0);
   signal SDA : std_logic_vector(0 downto 0);

 	--Outputs
   signal TX_DATA : std_logic_vector(7 downto 0);
   signal NEW_TX_DATA : std_logic;
   signal CHANNEL : std_logic_vector(3 downto 0);
	signal SERVO : std_logic_vector(6 downto 0);
	signal FAST_PWM : std_logic_vector(1 downto 0);
   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
	signal RX_IMU : std_logic;
	signal TX_IMU : std_logic:='0';
BEGIN
 SDA <= "H";
	-- Instantiate the Unit Under Test (UUT)
   uut: Controller PORT MAP (
          CLK => CLK,
          RST => RST,
          NEW_RX_DATA => NEW_RX_DATA,
          RX_DATA => RX_DATA,
          TX_BUSY => TX_BUSY,
			 TX_BLOCK => '0',
          TX_DATA => TX_DATA,
          NEW_TX_DATA => NEW_TX_DATA,
          NEW_SAMPLE => NEW_SAMPLE,
          SAMPLE => SAMPLE,
          SAMPLE_CHANNEL => SAMPLE_CHANNEL,
          CHANNEL => CHANNEL,
          SCL => SCL,
          SDA => SDA,
			 SERVO_OUT => SERVO,
			 FAST_PWM => FAST_PWM,
			 RX_IMU => RX_IMU,
			 TX_IMU => TX_IMU
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
	RST <= '1';
      wait for 100 ns;
RST <= '0';		
	RX_DATA <= "11111111";
	NEW_RX_DATA <= '1';
		wait for CLK_period*4;
		NEW_RX_DATA <= '0';
      wait for CLK_period*10;
      -- insert stimulus here 
	--RST <= '1';
	wait for 100 ns;
	RST <= '0';
      wait;
   end process;

END;
