--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:33:30 02/25/2016
-- Design Name:   
-- Module Name:   /home/raphael/Desktop/HARDWARE/vhdl/PWM/tb_pwm_mgr.vhd
-- Project Name:  PWM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pwm_mgr
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
 
ENTITY tb_pwm_mgr IS
END tb_pwm_mgr;
 
ARCHITECTURE behavior OF tb_pwm_mgr IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pwm_mgr
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         COM : IN  std_logic_vector(7 downto 0);
         PWM : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal COM : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal PWM : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pwm_mgr PORT MAP (
          CLK => CLK,
          RST => RST,
          COM => COM,
          PWM => PWM
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
      RST <= '1';-- hold reset state for 100 ns.
      wait for 100 ns;
		RST <= '0';
	
		COM <= "11111111";
      wait for CLK_period*2_000_000;
		
		COM <= "00000000";
      wait for CLK_period*2_000_000;

		COM <= "10000000";
		wait for CLK_period*2_000_000;
      wait;
   end process;

END;
