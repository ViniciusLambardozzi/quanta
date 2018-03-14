------------------------------------
-- CARRY LOOK AHEAD ADDER         --
------------------------------------
--IN--------------------------------
-- A    : input value             --
-- B    : input value             --
-- CIN  : carry in                --
------------------------------------
--OUT-------------------------------
-- C    : output value            --
-- COUT : carry out               --
------------------------------------
 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder IS
	PORT
	(
		a     : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		b     : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		cin   : IN  STD_LOGIC;
		------------------------------------------
		c     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		cout  : OUT STD_LOGIC
 	);
END adder;

ARCHITECTURE behavioral OF adder IS
	-- Sum values without carry                     
	SIGNAL sum       : STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	-- Carry generators                              
	SIGNAL carry_generate  : STD_LOGIC_VECTOR(31 DOWNTO 0);	
	-- Carry propagators                             
	SIGNAL carry_propagate : STD_LOGIC_VECTOR(31 DOWNTO 0);	
	-- Calculated carry values                       
	SIGNAL carry     : STD_LOGIC_VECTOR(31 DOWNTO 1);
	
BEGIN
	-- Calculate the sum a + b discarding carry      
	sum <= a XOR b;
	
	-- Calculate carry generators                    
	carry_generate <= a AND b;
	
	-- Calculate carry propagators                   
	carry_propagate <= a OR b;
	
	-- Pre calculate each carry                      
	PROCESS(carry_generate, carry_propagate, carry, cin)
	BEGIN
		-- C(i+1) = G(i) + (P(i)C(i))                            
		-- Calculate base case                                   
		carry(1) <= carry_generate(0) OR (carry_propagate(0) AND cin);		
		
		FOR i IN 1 TO 30 LOOP  
			-- Calculate all intermediate carries
			carry(i + 1) <= carry_generate(i) OR (carry_propagate(i) AND carry(i));
		END LOOP;
		
		-- Calculate carry out
		cout <= carry_generate(31) OR (carry_propagate(31) AND carry(31));		
	END PROCESS;
	
	-- Calculate final sum
	c(0) <= sum(0) XOR cin;
	c(31 DOWNTO 1) <= sum(31 DOWNTO 1) XOR carry(31 DOWNTO 1);	
END behavioral;