--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:26:36 05/12/2016
-- Design Name:   
-- Module Name:   C:/Users/Raf/Desktop/RobLip6/proj/rob/robLip6/LOW_LEVEL/FPGA/Mojo-Base-VHDL/ise_files/tb_IMU.vhd
-- Project Name:  Mojo-Base-VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IMU
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
 
ENTITY tb_IMU IS
END tb_IMU;
 
ARCHITECTURE behavior OF tb_IMU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IMU
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         YAW : OUT  std_logic_vector(31 downto 0);
         PITCH : OUT  std_logic_vector(31 downto 0);
         ROLL : OUT  std_logic_vector(31 downto 0);
         NEW_DATAS : OUT  std_logic;
         RX_IMU : IN  std_logic;
         TX_IMU : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal RX_IMU : std_logic := '0';

 	--Outputs
   signal YAW : std_logic_vector(31 downto 0);
   signal PITCH : std_logic_vector(31 downto 0);
   signal ROLL : std_logic_vector(31 downto 0);
   signal NEW_DATAS : std_logic;
   signal TX_IMU : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IMU PORT MAP (
          CLK => CLK,
          RST => RST,
          YAW => YAW,
          PITCH => PITCH,
          ROLL => ROLL,
          NEW_DATAS => NEW_DATAS,
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
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
