library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ProgramCounter is
    Port ( constante : in  STD_LOGIC_VECTOR (7 downto 0);
           ESCR_PC : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           endereco : out  STD_LOGIC_VECTOR (7 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin
	process(constante, ESCR_PC, clock ,reset)
	variable conta : STD_LOGIC_VECTOR (7 downto 0);
	begin
	
	if rising_edge (clock) then 
		if reset = '0' then
			if ESCR_PC = '0' then
				conta := conta + 1;
			else
				conta := constante;
			end if;
		else 
			conta := "00000000";
		end if;
	end if;
		
	endereco <= conta;
	end process;
	
end Behavioral;
