library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Processador is
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
end Processador;

architecture Struct of Processador is

Component ALU is --
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Operando2 : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_ALU : in  STD_LOGIC_VECTOR (3 downto 0);
           COMP_FLAG : out  STD_LOGIC_VECTOR (4 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

Component BancoRegistos is
    Port ( Dados_R : in  STD_LOGIC_VECTOR (7 downto 0);
           Registo_1 : in  STD_LOGIC_VECTOR (2 downto 0);
           Registo_2 : in  STD_LOGIC_VECTOR (2 downto 0);
           ESCR_R : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           Operando1 : out  STD_LOGIC_VECTOR (7 downto 0);
           Operando2 : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

Component MUX_COMP is
    Port ( SEL_F : in  STD_LOGIC_VECTOR (2 downto 0);
           R_FLAG : in  STD_LOGIC_VECTOR (4 downto 0);
           S_FLAG : out  STD_LOGIC);
end Component;

Component MUX_PC is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_PC : in  STD_LOGIC_VECTOR (2 downto 0);
           S_FLAG : in  STD_LOGIC;
           ESCR_PC : out  STD_LOGIC);
end Component;

Component MUX_R is
    Port ( Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_M : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           Resultado : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_R : in  STD_LOGIC_VECTOR (1 downto 0);
           Dados_R : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

Component PerifericoEntrada is
    Port ( ESCR_P : in  STD_LOGIC;
           PIN : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_IN : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

Component PerifericoSaida is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           ESCR_P : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           POUT : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

Component ProgramCounter is
    Port ( constante : in  STD_LOGIC_VECTOR (7 downto 0);
           ESCR_PC : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           endereco : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

Component ROM_descod is
    Port ( opcode : in  STD_LOGIC_VECTOR (4 downto 0);
           SEL_ALU : out  STD_LOGIC_VECTOR (3 downto 0);--
           ESCR_P : out  STD_LOGIC;
           SEL_R : out  STD_LOGIC_VECTOR (1 downto 0);--
           ESCR_R : out  STD_LOGIC;--	
           WR : out  STD_LOGIC;
           SEL_PC : out  STD_LOGIC_VECTOR (2 downto 0);--
           ESCR_F : out  STD_LOGIC;--
           SEL_F : out  STD_LOGIC_VECTOR (2 downto 0));--
end Component;

Component RegistoComparacao is
    Port ( ESCR_F : in  STD_LOGIC;
           COMP_FLAG : in  STD_LOGIC_VECTOR (4 downto 0);
           clock : in  STD_LOGIC;
           R_FLAG : out  STD_LOGIC_VECTOR (4 downto 0));
end Component;

signal S_ESCR_R, S_ESCR_PC, S_ESCR_P, S_ESCR_F, S_S_FLAG :STD_LOGIC;                              --Sinais de 1 bit
signal S_SEL_R:STD_LOGIC_VECTOR (1 downto 0);                                                     --Sinais de 2 bits
signal S_SEL_PC, S_SEL_F:STD_LOGIC_VECTOR (2 downto 0);                                           --Sinais de 3 bits
signal S_SEL_ALU:STD_LOGIC_VECTOR (3 downto 0);                                                   --Sinais de 4 bits
signal S_COMP_FLAG, S_R_FLAG:STD_LOGIC_VECTOR (4 downto 0);                                       --Sinais de 5 bits
signal S_Operando1, S_Operando2, S_Resultado, S_Dados_IN, S_Dados_R:STD_LOGIC_VECTOR (7 downto 0);--Sinais de 8 bits


begin
	ConstanteOUT <= Constante;
	Operando1OUT<= S_Operando1;
	
	S1:ALU port map(S_Operando1,S_Operando2, S_SEL_ALU, S_COMP_FLAG, S_Resultado);
	S2:BancoRegistos port map( S_Dados_R, Registo_1, Registo_2, S_ESCR_R, clock, S_Operando1 ,S_Operando2);
	S3:MUX_COMP port map( S_SEL_F, S_R_FLAG, S_S_FLAG);
	S4:MUX_PC port map( S_Operando1,S_SEL_PC, S_S_FLAG, S_ESCR_PC);
	S5:MUX_R port map( constante, Dados_M, S_Dados_IN, S_Resultado, S_SEL_R, S_Dados_R);
	S6:PerifericoEntrada port map( S_ESCR_P ,PIN ,S_Dados_IN);
	S7:PerifericoSaida port map( S_Operando1, S_ESCR_P, clock,POUT );
	S8:ProgramCounter port map(constante, S_ESCR_PC,clock,reset,endereco );
	S9:ROM_descod port map( opcode, S_SEL_ALU, S_ESCR_P, S_SEL_R , S_ESCR_R, WR, S_SEL_PC, S_ESCR_F, S_SEL_F);
	S10:RegistoComparacao port map( S_ESCR_F, S_COMP_FLAG, clock, S_R_FLAG);
	
	
end Struct;

