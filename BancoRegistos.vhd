library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity BancoRegistos is
    Port ( Dados_R : in  STD_LOGIC_VECTOR (7 downto 0);
           Registo_1 : in  STD_LOGIC_VECTOR (2 downto 0);
           Registo_2 : in  STD_LOGIC_VECTOR (2 downto 0);
           ESCR_R : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           Operando1 : out  STD_LOGIC_VECTOR (7 downto 0);
           Operando2 : out  STD_LOGIC_VECTOR (7 downto 0));
end BancoRegistos;

architecture Behavioral of BancoRegistos is
	
begin
	process (Dados_R,Registo_1,Registo_2,ESCR_R,clock)
	variable R0: STD_LOGIC_VECTOR (7 downto 0);
	variable R1: STD_LOGIC_VECTOR (7 downto 0);
	variable R2: STD_LOGIC_VECTOR (7 downto 0);
	variable R3: STD_LOGIC_VECTOR (7 downto 0);
	variable R4: STD_LOGIC_VECTOR (7 downto 0);
	variable R5: STD_LOGIC_VECTOR (7 downto 0);
		begin
			if rising_edge(clock)
				then
					if (ESCR_R='1')
						then 
							case (Registo_1) is
								when "000" =>
										R0 := DADOS_R;
								when "001" =>
										R1 := DADOS_R;
								when "010" =>
										R2 := DADOS_R;
								when "011" =>
										R3 := DADOS_R;
								when "100" =>
										R4 := DADOS_R;
								when "101" =>
										R5 := DADOS_R;
								when others =>
									NULL;
							end case;
					end if;
			end if;
					case (Registo_1) is
								when "000" =>
										Operando1 <= R0;
								when "001" =>
										Operando1 <= R1;
								when "010" =>
										Operando1 <= R2;
								when "011" =>
										Operando1 <= R3;
								when "100" =>
										Operando1 <= R4;
								when "101" =>
										Operando1 <= R5;
								when others =>
									NULL;
					end case;
					case (Registo_2) is
								when "000" =>
										Operando2 <= R0;
								when "001" =>
										Operando2 <= R1;
								when "010" =>
										Operando2 <= R2;
								when "011" =>
										Operando2 <= R3;
								when "100" =>
										Operando2 <= R4;
								when "101" =>
										Operando2 <= R5;
								when others =>
									NULL;
					end case;
	end process;							
end Behavioral;

