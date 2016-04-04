--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:13:18 03/20/2016
-- Design Name:   
-- Module Name:   /home/raphael/Desktop/Mojo-Base-VHDL/ise_files/tb_lidar.vhd
-- Project Name:  Mojo-Base-VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lidar
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
 
ENTITY tb_lidar IS
END tb_lidar;
 
ARCHITECTURE behavior OF tb_lidar IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lidar
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         SCL : INOUT  std_logic;
         SDA : INOUT  std_logic;
         DATA : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

	--BiDirs
   signal SCL : std_logic;
   signal SDA : std_logic;

 	--Outputs
   signal DATA : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 SDA <= 'H';
 SCL <= 'H';
	-- Instantiate the Unit Under Test (UUT)
   uut: Lidar PORT MAP (
          CLK => CLK,
          RST => RST,
          SCL => SCL,
          SDA => SDA,
          DATA => DATA
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
