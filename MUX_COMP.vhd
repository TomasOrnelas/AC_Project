library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX_COMP is
    Port ( SEL_F : in  STD_LOGIC_VECTOR (2 downto 0);
           R_FLAG : in  STD_LOGIC_VECTOR (4 downto 0);
           S_FLAG : out  STD_LOGIC);
end MUX_COMP;

architecture Behavioral of MUX_COMP is

begin
process(R_FLAG, SEL_F)
		begin
			case SEL_F is 
				when "000" => S_FLAG <= R_FLAG(0);
				when "001" => S_FLAG <= R_FLAG(1);
				when "010" => S_FLAG <= R_FLAG(2);		
				when "011" => S_FLAG <= R_FLAG(3);
				when "100" => S_FLAG <= R_FLAG(4);				when others =>S_FLAG <= 'X'; 
			end case;
		end process;


end Behavioral;

