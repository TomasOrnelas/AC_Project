library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PerifericoSaida is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           ESCR_P : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           POUT : out  STD_LOGIC_VECTOR (7 downto 0));
end PerifericoSaida;

architecture Behavioral of PerifericoSaida is

begin
	process(Operando1, ESCR_P, clock)
	begin
		if rising_edge(clock) then
			if (ESCR_P='1') then
				POUT<=Operando1;
			end if;
		end if;
	end process;

end Behavioral;

