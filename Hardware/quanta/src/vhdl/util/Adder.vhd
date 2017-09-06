------------------------------------
-- 32 BIT CARRY LOOK AHEAD ADDER  --
-- PORT MAPPING                   --
-- A    : 32 bit input value      --
-- B    : 32 bit input value      --
-- CIN  : 1 bit input carry       --
------------------------------------
-- C    : 32 bit output value A+B --
-- COUT : 1 bit output carry      --
------------------------------------
 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder IS
	PORT
	(
		in_a     : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_b     : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_cin   : IN STD_LOGIC;
		---------------------------------------------
		out_c    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_cout : OUT STD_LOGIC
 	);
END adder;

ARCHITECTURE behavioral OF adder IS
	-- Sum values without carry                     
	SIGNAL s_sum       : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Carry generators                              
	SIGNAL s_generate  : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Carry propagators                             
	SIGNAL s_propagate : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Calculated carry values                       
	SIGNAL s_carry     : STD_LOGIC_VECTOR(31 DOWNTO 1);
	
BEGIN
	-- Calculate the sum a + b discarding carry      
	s_sum <= in_a XOR in_b;
	
	-- Calculate carry generators                    
	s_generate <= in_a AND in_b;
	
	-- Calculate carry propagators                   
	s_propagate <= in_a OR in_b;
	
	-- Pre calculate each carry                      
	PROCESS(s_generate, s_propagate, s_carry, in_cin)
	BEGIN
		-- C(i+1) = G(i) + (P(i)C(i))                            
		-- Calculate base case                                   
		s_carry(1) <= s_generate(0) OR (s_propagate(0) AND in_cin);		
		
		FOR i IN 1 TO 30 LOOP  
			-- Recursively calculate all intermediate carries                
			s_carry(i + 1) <= s_generate(i) OR (s_propagate(i) AND s_carry(i));
		END LOOP;
		
		-- Calculate carry out                                        --
		out_cout <= s_generate(31) OR (s_propagate(31) AND s_carry(31));		
	END PROCESS;
	
	-- Calculate final sum                                          --
	out_c(0) <= s_sum(0) XOR in_cin;
	out_c(31 DOWNTO 1) <= s_sum(31 DOWNTO 1) XOR s_carry(31 DOWNTO 1);	
END behavioral;