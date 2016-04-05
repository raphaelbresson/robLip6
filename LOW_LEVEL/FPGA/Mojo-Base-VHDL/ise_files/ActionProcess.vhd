----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:39:39 04/03/2016 
-- Design Name: 
-- Module Name:    ActionProcess - Behavioral 
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

entity ActionProcess is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           NEW_DATA : in  STD_LOGIC
			  ADDR : out STD_LOGIC_VECTOR(7 downto 0);
			  );
end ActionProcess;

architecture Behavioral of ActionProcess is
	signal adresse_int_d, adresse_int_q: INTEGER := 0;
	signal data_q
begin


end Behavioral;

