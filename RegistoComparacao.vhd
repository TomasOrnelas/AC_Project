library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegistoComparacao is
    Port ( ESCR_F : in  STD_LOGIC;
           COMP_FLAG : in  STD_LOGIC_VECTOR (4 downto 0);
           clock : in  STD_LOGIC;
           R_FLAG : out  STD_LOGIC_VECTOR (4 downto 0));
end RegistoComparacao;

architecture Behavioral of RegistoComparacao is

begin
	process(ESCR_F, COMP_FLAG, clock)
	begin
		if rising_edge(clock) then
			if (ESCR_F='1') then
				R_FLAG<=COMP_FLAG;
			end if;
		end if;
	end process;	

end Behavioral;

