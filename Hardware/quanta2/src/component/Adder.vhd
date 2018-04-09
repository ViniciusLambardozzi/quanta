LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder IS
	PORT
	(
		in_a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_cin : IN STD_LOGIC;
		
		
		out_c : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_cout : OUT STD_LOGIC
 	);
END adder;

ARCHITECTURE behavioral OF adder IS
	-- Sum values without carry                     
	SIGNAL s_sum : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Carry generators                              
	SIGNAL s_carry_generate : STD_LOGIC_VECTOR(31 DOWNTO 0);	
	-- Carry propagators                             
	SIGNAL s_carry_propagate : STD_LOGIC_VECTOR(31 DOWNTO 0);	
	-- Calculated carry values                       
	SIGNAL s_carry : STD_LOGIC_VECTOR(31 DOWNTO 1);
	
BEGIN
	-- Calculate the sum a + b discarding carry      
	s_sum <= in_a XOR in_b;
	
	-- Calculate carry generators                    
	s_carry_generate <= in_a AND in_b;
	
	-- Calculate carry propagators                   
	s_carry_propagate <= in_a OR in_b;
	
	-- Pre calculate each carry                      
	PROCESS(s_carry_generate, s_carry_propagate, s_carry, in_cin)
	BEGIN
		-- C(i+1) = G(i) + (P(i)C(i))                            
		-- Calculate base case                                   
		s_carry(1) <= s_carry_generate(0) OR (s_carry_propagate(0) AND in_cin);		
		
		FOR i IN 1 TO 30 LOOP  
			-- Calculate all intermediate carries
			s_carry(i + 1) <= s_carry_generate(i) OR (s_carry_propagate(i) AND s_carry(i));
		END LOOP;
		
		-- Calculate carry out
		out_cout <= s_carry_generate(31) OR (s_carry_propagate(31) AND s_carry(31));		
	END PROCESS;
	
	-- Calculate final sum
	out_c(0) <= s_sum(0) XOR in_cin;
	out_c(31 DOWNTO 1) <= s_sum(31 DOWNTO 1) XOR s_carry(31 DOWNTO 1);	
END behavioral;