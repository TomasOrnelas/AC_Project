library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_R is
    Port ( Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_M : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           Resultado : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_R : in  STD_LOGIC_VECTOR (1 downto 0);
           Dados_R : out  STD_LOGIC_VECTOR (7 downto 0));
end MUX_R;

architecture Behavioral of MUX_R is

begin
process(Constante, Dados_M, Dados_IN,Resultado, SEL_R )
		begin
			case SEL_R is  
				when "00" => Dados_R <= Constante;
				when "01" => Dados_R <= Dados_M;
				when "10" => Dados_R <= Dados_IN;		
				when "11" => Dados_R <= Resultado;				when others => Dados_R <= "XXXXXXXX";
			end case;
		end process;


end Behavioral;

