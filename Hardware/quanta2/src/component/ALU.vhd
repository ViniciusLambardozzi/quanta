-----------------------------------------
-- 32 BIT ALU                          --
-----------------------------------------
--IN-------------------------------------
-- A   : 32 bit input value            --
-- B   : 32 bit input value            --
-- CIN : 1 bit input  carry            --
-- FUN : 4 bit input function selector --
--      0 - ZERO                       --
--      1 - ADD                        --
--      2 - SUBTRACT                   --
--      3 - PASS                       --
--      4 - NOT                        --
--      5 - AND                        --
--      6 - OR                         --
--      7 - XOR                        --
--      8 - XNOR                       --
--      9 - PASS B                     --
--     10 -                            --
--     11 -                            --
--     12 -                            --
--     13 -                            --
--     14 -                            --
--     15 -                            --
-----------------------------------------
--OUT------------------------------------
-- C      : 32 bit output value        --
-- STATUS : 4 bit status output        --
--         0 - ZERO                    --
--         1 - CARRY                   -- 
--         2 - SIGN                    --
--         3 - OVERFLOW                --
-----------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY alu IS
	PORT
	(
		in_a : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_b : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_cin : IN  STD_LOGIC;
		in_fun : IN  STD_LOGIC_VECTOR( 3 DOWNTO 0);
		-----------------------------------------------
		out_c : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_status : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0)	
	);
END alu;

ARCHITECTURE behavioral OF alu IS
	-- Adder result signals                     
	SIGNAL s_add : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_cout : STD_LOGIC;
	
	-- Subtractor result signals                
	SIGNAL s_sub : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_bout : STD_LOGIC;
	
	-- Output signals
	SIGNAL s_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_status : STD_LOGIC_VECTOR( 3 DOWNTO 0);
	
BEGIN 
	-- Adder module
	a: ENTITY WORK.adder(behavioral)
	PORT MAP
	(
		in_a,
		in_b,
		in_cin,
		s_add,
		s_cout
	);
	
	-- Instantiate 2's complement subtractor with adder module
	s: ENTITY WORK.adder(behavioral)
	PORT MAP
   (
		in_a,
		NOT(in_b),
		NOT(in_cin),
		s_sub,
		s_bout
	);
	
	-- Wire operation result to output
	out_c <= s_out;
	-- Wire status signal to output
	out_status <= s_status;
	
	-- Async operation changes on every signal
	PROCESS(in_a, in_b, in_cin, in_fun, s_out, s_status, s_add, s_cout, s_sub,	s_bout)
	BEGIN
		-- Multiplexer set outputs using function code
		CASE in_fun is
			-- ZERO     
			WHEN "0000" =>
				-- Set all outputs to 0                
				s_out <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, s_out'LENGTH));
				s_status <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, s_status'LENGTH));
			
			-- ADD      
			WHEN "0001" =>
				-- Set output to result of adder 
				s_out <= s_add;
				
				-- Set status values 
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';
				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= s_cout;
				s_status(2) <= s_out(31);
				s_status(3) <= s_cout;				
			
			-- SUBTRACT
			WHEN "0010" =>
				-- Set output to result of subtractor 
			s_out <= s_sub;
				
				-- Set status values
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';
				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= NOT(s_bout);
				s_status(2) <= s_out(31);
				s_status(3) <= NOT(s_bout);	
				
			-- PASS A
			WHEN "0011" =>
				-- Set output to input a 
				s_out <= in_a;
				
				-- Set status values 
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';
				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= '0';
				s_status(2) <= s_out(31);
				s_status(3) <= '0';
				
			-- NOT      
			WHEN "0100" =>
				-- Set output to not a
				s_out <= NOT(in_a);
				
				-- Set status values
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';
				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= '0';
				s_status(2) <= s_out(31);
				s_status(3) <= '0';	
				
			-- AND      --
			WHEN "0101" =>
				-- Set output to a and b
				s_out <= in_a AND in_b;
				
				-- Set status values
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';
				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= '0';
				s_status(2) <= s_out(31);
				s_status(3) <= '0';
			-- OR       --
			WHEN "0110" =>
				-- Set output to a or b
				s_out <= in_a OR in_b;
				
				-- Set status values 
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';
				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= '0';
				s_status(2) <= s_out(31);
				s_status(3) <= '0';
			
			-- XOR      
			WHEN "0111" =>
				-- Set output to a xor b 
				s_out <= in_a XOR in_b;
				
				-- Set status values 
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';
				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= '0';
				s_status(2) <= s_out(31);
				s_status(3) <= '0';
			
			-- XNOR 
			WHEN "1000" =>
				-- Set output to a xnor b 
				s_out <= NOT(in_a XOR in_b);
				
				-- Set status values 
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';
				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= '0';
				s_status(2) <= s_out(31);
				s_status(3) <= '0';
				
			-- PASS B 
			WHEN "1001" =>
				-- Set output to input b
				s_out <= in_b;
				
				-- Set status values 
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';
				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= '0';
				s_status(2) <= s_out(31);
				s_status(3) <= '0';

			-- NOOP OPCODES for future expansion
			WHEN OTHERS =>
				-- Set all outputs to 0                
				s_out <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, s_out'LENGTH));
				s_status <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, s_status'LENGTH));
		END CASE;	
	END PROCESS;
	
END behavioral;