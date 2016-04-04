--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:54:18 03/05/2016
-- Design Name:   
-- Module Name:   /home/raphael/Desktop/Mojo-Base-VHDL/ise_files/tb_i2c_master.vhd
-- Project Name:  Mojo-Base-VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: i2C_master
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
 
ENTITY tb_i2c_master IS
END tb_i2c_master;
 
ARCHITECTURE behavior OF tb_i2c_master IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT i2C
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         ENABLE : IN  std_logic;
         ADDR : IN  std_logic_vector(6 downto 0);
         RW_CMD : IN  std_logic;
         Data_TX : IN  std_logic_vector(7 downto 0);
         Data_RX : OUT  std_logic_vector(7 downto 0);
         error_ack : OUT  std_logic;
         busy : OUT  std_logic;
         SCL : INOUT  std_logic;
         SDA : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal ENABLE : std_logic := '0';
   signal ADDR : std_logic_vector(6 downto 0) := (others => '0');
   signal RW : std_logic := '0';
   signal Data_wr : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal SCL : std_logic;
   signal SDA : std_logic;

 	--Outputs
   signal Data_rd : std_logic_vector(7 downto 0);
   signal ack_error : std_logic;
   signal busy : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 SDA <= 'H';
 SCL <= 'H';
	-- Instantiate the Unit Under Test (UUT)
   uut: i2C PORT MAP (
          CLK => CLK,
          RST => RST,
          ENABLE => ENABLE,
          ADDR => ADDR,
          RW_CMD => RW,
          Data_TX => Data_wr,
          Data_RX => Data_rd,
          error_ack => ack_error,
          busy => busy,
          SCL => SCL,
          SDA => SDA
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
		ENABLE <= '1';
		rw<='1';
		ADDR <= "0111000";
		wait for 500 us;
		ENABLE <= '1';
		rw<='0';
		ADDR <= "0111000";
      -- insert stimulus here 
	wait for 500 us;
      wait;
   end process;

END;
