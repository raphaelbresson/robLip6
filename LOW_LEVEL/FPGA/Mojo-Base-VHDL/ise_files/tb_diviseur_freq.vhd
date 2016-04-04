--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:22:27 03/04/2016
-- Design Name:   
-- Module Name:   /home/raphael/Desktop/Mojo-Base-VHDL/ise_files/tb_diviseur_freq.vhd
-- Project Name:  Mojo-Base-VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Diviseur_Freq
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
 
ENTITY tb_diviseur_freq IS
END tb_diviseur_freq;
 
ARCHITECTURE behavior OF tb_diviseur_freq IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Diviseur_Freq
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         OUT_CLK : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal OUT_CLK : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
   constant OUT_CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Diviseur_Freq PORT MAP (
          CLK => CLK,
          RST => RST,
          OUT_CLK => OUT_CLK
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
		RST <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		RST <= '0';
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
