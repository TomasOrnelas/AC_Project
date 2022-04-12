library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;


entity ALU is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Operando2 : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_ALU : in  STD_LOGIC_VECTOR (3 downto 0);
           COMP_FLAG : out  STD_LOGIC_VECTOR (4 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

	process(Operando1, Operando2, SEL_ALU)
		begin
			case SEL_ALU is 
				when "0000" => Resultado <= Operando1 + Operando2;
				when "0001" => Resultado <= Operando1 - Operando2;
				when "0010" => Resultado <= Operando1 AND Operando2;
				when "0011" => Resultado <= Operando1 NAND Operando2;
				when "0100" => Resultado <= Operando1 OR Operando2;
				when "0101" => Resultado <= Operando1 NOR Operando2;
				when "0110" => Resultado <= Operando1 XOR Operando2;
				when "0111" => Resultado <= Operando1 XNOR Operando2;
				
				
				when "1000" =>
									COMP_FLAG<="00000";
									if (Operando1 = Operando2) then
										COMP_FLAG(0)<='1';
									end if;
									if (Operando1 < Operando2) then
										COMP_FLAG(1)<='1';
									end if;
									if (Operando1 <= Operando2) then
										COMP_FLAG(2)<='1';
									end if;
									if (Operando1 >= Operando2) then
										COMP_FLAG(3)<='1';
									end if;
									if (Operando1 > Operando2) then
										COMP_FLAG(4)<='1';
									end if;
				when others => Resultado <= (others => 'X');
			end case;
		end process;

end Behavioral;

