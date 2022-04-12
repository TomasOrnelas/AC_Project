library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MemriaDeDadosRAM is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           WR : in  STD_LOGIC;
           Dados_M : out  STD_LOGIC_VECTOR (7 downto 0);
           clock : in  STD_LOGIC);
end MemriaDeDadosRAM;

architecture Behavioral of MemriaDeDadosRAM is

begin
	process ( Operando1, Constante, WR, clock)
		
		type memoria is array (0 to 255) of STD_LOGIC_VECTOR (7 downto 0);
		variable memoria_endereco 	: memoria;
		begin
			
			if WR='0' then
				Dados_M <= memoria_endereco( TO_INTEGER(unsigned (Constante)));
			else
				if rising_edge (clock) then
					memoria_endereco(TO_INTEGER(unsigned (Constante))):= Operando1;
				end if;
			end if;
		end process;
end Behavioral;

