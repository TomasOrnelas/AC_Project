
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY TestePROJETO1 IS
END TestePROJETO1;
 
ARCHITECTURE behavior OF TestePROJETO1 IS 
    COMPONENT Motherboard
    PORT(
         reset : IN  std_logic;
         clock : IN  std_logic;
         PIN : IN  std_logic_vector(7 downto 0);
         POUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   signal reset : std_logic := '0';
   signal clock : std_logic := '0';
   signal PIN : std_logic_vector(7 downto 0) := (others => '0');
   signal POUT : std_logic_vector(7 downto 0);
   constant clock_period : time := 10 ns;
 
BEGIN
   uut: Motherboard PORT MAP (
          reset => reset,
          clock => clock,
          PIN => PIN,
          POUT => POUT
        );

   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		reset <= '1'; PIN <= "00000000";
		wait for clock_period;
		reset <= '0';
		PIN<="00011110";
      -- insert stimulus here 
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
