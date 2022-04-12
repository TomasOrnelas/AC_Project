library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Motherboard is
    Port ( reset : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           PIN : in  STD_LOGIC_VECTOR (7 downto 0);
           POUT : out  STD_LOGIC_VECTOR (7 downto 0));
end Motherboard;

architecture Struct of Motherboard is

component Processador is
    Port ( reset : in  STD_LOGIC;
	        clock: in STD_LOGIC;
           Endereco : out  STD_LOGIC_VECTOR (7 downto 0);
           opcode : in  STD_LOGIC_VECTOR (4 downto 0);
			  Operando1OUT: out  STD_LOGIC_VECTOR (7 downto 0);
           Registo_1 : in  STD_LOGIC_VECTOR (2 downto 0);
           Registo_2 : in  STD_LOGIC_VECTOR (2 downto 0);
           Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           ConstanteOUT : out  STD_LOGIC_VECTOR (7 downto 0);
           WR : out  STD_LOGIC;
           Dados_M : in  STD_LOGIC_VECTOR (7 downto 0);
           PIN : in  STD_LOGIC_VECTOR (7 downto 0);
           POUT : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

Component MemriaDeDadosRAM is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           WR : in  STD_LOGIC;
           Dados_M : out  STD_LOGIC_VECTOR (7 downto 0);
           clock : in  STD_LOGIC);
end Component;

Component MemoriaDeInstrucoes is
    Port ( Endereco : in  STD_LOGIC_VECTOR (7 downto 0);
           opcode : out  STD_LOGIC_VECTOR (4 downto 0);
           Constante : out  STD_LOGIC_VECTOR (7 downto 0);
           Registo_1 : out  STD_LOGIC_VECTOR (2 downto 0);
           Registo_2 : out  STD_LOGIC_VECTOR (2 downto 0));
end Component;

signal S_WR: STD_LOGIC;
signal S_Registo_1, S_Registo_2 : STD_LOGIC_VECTOR (2 downto 0);
signal S_opcode  : STD_LOGIC_VECTOR (4 downto 0);
signal S_Endereco, S_Constante, S_ConstanteOUT, S_Dados_M, S_Operando1, S_Operando1OUT: STD_LOGIC_VECTOR (7 downto 0);

begin


S1:Processador port map( reset , clock, S_Endereco , S_opcode, S_Operando1, S_Registo_1, S_Registo_2, S_Constante, S_ConstanteOUT, S_WR, S_Dados_M , PIN ,POUT);
S2:MemriaDeDadosRAM port map( S_Operando1, S_ConstanteOUT, S_WR , S_Dados_M, clock );
S3:MemoriaDeInstrucoes port map(S_Endereco, S_opcode, S_Constante, S_Registo_1, S_Registo_2);

end Struct;

