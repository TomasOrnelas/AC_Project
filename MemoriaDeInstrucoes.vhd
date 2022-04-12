library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MemoriaDeInstrucoes is
    Port ( Endereco : in  STD_LOGIC_VECTOR (7 downto 0);
           opcode : out  STD_LOGIC_VECTOR (4 downto 0);
           Constante : out  STD_LOGIC_VECTOR (7 downto 0);
           Registo_1 : out  STD_LOGIC_VECTOR (2 downto 0);
           Registo_2 : out  STD_LOGIC_VECTOR (2 downto 0));
end MemoriaDeInstrucoes;

architecture Behavioral of MemoriaDeInstrucoes is

begin
process(Endereco)
	begin
		case(Endereco) is 
			when "00000000"=>opcode<="00010"; Registo_1<="000"; Registo_2<="XXX"; constante<="00011110";--0
			when "00000001"=>opcode<="00010"; Registo_1<="001"; Registo_2<="XXX"; constante<="11111111";--1
			when "00000010"=>opcode<="00010"; Registo_1<="010"; Registo_2<="XXX"; constante<="00010001";--2
			when "00000011"=>opcode<="00010"; Registo_1<="011"; Registo_2<="XXX"; constante<="00000101";--3
			
			when "00000100"=>opcode<="00000"; Registo_1<="100"; Registo_2<="XXX"; constante<="XXXXXXXX";--4
			when "00000101"=>opcode<="00010"; Registo_1<="101"; Registo_2<="XXX"; constante<="00000000";--5
			when "00000110"=>opcode<="00101"; Registo_1<="101"; Registo_2<="100"; constante<="XXXXXXXX";--6
			when "00000111"=>opcode<="10100"; Registo_1<="100"; Registo_2<="XXX"; constante<="00010011";--7
			when "00001000"=>opcode<="10101"; Registo_1<="100"; Registo_2<="XXX"; constante<="00010101";--8
			
			when "00001001"=>opcode<="01101"; Registo_1<="100"; Registo_2<="000"; constante<="XXXXXXXX";--9
			when "00001010"=>opcode<="10010"; Registo_1<="XXX"; Registo_2<="XXX"; constante<="00001111";--10
			when "00001011"=>opcode<="00101"; Registo_1<="101"; Registo_2<="100"; constante<="XXXXXXXX";--11
			when "00001100"=>opcode<="00101"; Registo_1<="011"; Registo_2<="001"; constante<="XXXXXXXX";--12
			when "00001101"=>opcode<="10100"; Registo_1<="011"; Registo_2<="XXX"; constante<="00001111";--13
			when "00001110"=>opcode<="10011"; Registo_1<="XXX"; Registo_2<="XXX"; constante<="00001011";--14
			when "00001111"=>opcode<="00110"; Registo_1<="101"; Registo_2<="010"; constante<="XXXXXXXX";--15
			when "00010000"=>opcode<="00100"; Registo_1<="101"; Registo_2<="XXX"; constante<="00000111";--16
			when "00010001"=>opcode<="00011"; Registo_1<="100"; Registo_2<="XXX"; constante<="00000111";--17
			when "00010010"=>opcode<="10011"; Registo_1<="XXX"; Registo_2<="XXX"; constante<="00011000";--18
			when "00010011"=>opcode<="00101"; Registo_1<="100"; Registo_2<="001"; constante<="XXXXXXXX";--19
			when "00010100"=>opcode<="10011"; Registo_1<="XXX"; Registo_2<="XXX"; constante<="00011000";--20
			when "00010101"=>opcode<="01011"; Registo_1<="100"; Registo_2<="001"; constante<="XXXXXXXX";--21
			when "00010110"=>opcode<="00110"; Registo_1<="100"; Registo_2<="001"; constante<="XXXXXXXX";--22
			when "00010111"=>opcode<="00110"; Registo_1<="100"; Registo_2<="000"; constante<="XXXXXXXX";--23
			when "00011000"=>opcode<="00001"; Registo_1<="100"; Registo_2<="XXX"; constante<="XXXXXXXX";--24
			when "00011001"=>opcode<="10011"; Registo_1<="XXX"; Registo_2<="XXX"; constante<="00011001";--25
			when others => opcode<="XXXXX"; Registo_1<="XXX"; Registo_2<="XXX"; Constante<="XXXXXXXX";
		end case;
	end process;
			

end Behavioral;

