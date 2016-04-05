----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:38:34 04/02/2016 
-- Design Name: 
-- Module Name:    CapteursController - Behavioral 
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

entity CapteursController is
	Generic ( 
					NB_CAPTEURS 	: INTEGER := 1;
					NB_BUS_I2C 		: INTEGER := 1
				);
    Port ( 
				CLK : in  STD_LOGIC;
				RST : in STD_LOGIC;
				DATA : out  STD_LOGIC_VECTOR (15 downto 0);
				ADDR : in STD_LOGIC_VECTOR(7 downto 0);
				-- I2C
				SCL_v : inout STD_LOGIC_VECTOR(NB_BUS_I2C - 1 downto 0);
				SDA_v : inout STD_LOGIC_VECTOR(NB_BUS_I2C - 1 downto 0);
				-- ANALOG
				NEW_SAMPLE : in STD_LOGIC;						-- signal de nouvelle valeur analogique
				SAMPLE : in STD_LOGIC_VECTOR(9 downto 0); -- valeur analogique
				SAMPLE_CHANNEL : in STD_LOGIC_VECTOR(3 downto 0);-- Entrée de la nouvelle valuer analogique
				CHANNEL: out STD_LOGIC_VECTOR(3 downto 0)-- Entrée ADC à lire
			);
end CapteursController;

architecture Behavioral of CapteursController is
	type mem_capt is array(NB_CAPTEURS - 1 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
	signal memoire_d, memoire_q: mem_capt:=(others=>(others=>'0'));
	signal data_q,data_d: std_logic_vector(15 downto 0) := (others=>'0');
	type unused_ana is array(7 downto 0) of STD_LOGIC_VECTOR(9 downto 0);
	signal unused_analog: unused_ana;
	signal new_data_lidar: std_logic;
	signal new_data_d, new_data_q :std_logic:='0';
begin
DATA <= data_q;
--------------------------------------------------------------------------
------------------	Entrées analogiques	--------------------------------
--------------------------------------------------------------------------
analogValues: entity work.Analog_in
	port map(
			clk => clk,
			rst => rst,
			new_sample => new_sample,
			sample => sample,
			sample_channel => sample_channel,
			channel => channel,
			analog_0 => memoire_d(0)(9 downto 0),
			analog_1 => unused_analog(0),
			analog_2 => unused_analog(1),
			analog_3 => unused_analog(2),
			analog_4 => unused_analog(3),
			analog_5 => unused_analog(4),
			analog_6 => unused_analog(5),
			analog_7 => unused_analog(6)
		);
-----------------------------------------------------------------------------
----------------- LIDAR -----------------------------------------------------
-----------------------------------------------------------------------------
lidar_i2c: entity work.lidar
	port map(
			clk => clk,
			rst => rst,
			scl => SCL_v(0),
			sda => SDA_v(0),
			data => memoire_d(1),
			new_data => new_data_lidar
		);


comb:process(CLK,RST,ADDR,memoire_d)
begin
	data_d <= memoire_q(to_integer(unsigned(ADDR)));
end process;

seq: process(CLK)
begin
	if(RST='1') then
		memoire_q <= (others=>(others=>'0'));
		data_q <= (others=>'0');
	elsif(CLK='1' and CLK'event) then
		memoire_q <= memoire_d;
		data_q <= data_d;
	end if;
end process;

end Behavioral;

