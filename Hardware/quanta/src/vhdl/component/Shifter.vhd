----------------------------------------
-- ?g BIT SHIFTER                     --
-- PORT MAPPING                       --
-- A: ?g bit input value              --
-- FUN: 3 bit input function selector --
--      0 - PASS                      --
--      1 - LEFT                      --
--      2 - RIGHT                     --
--      3 - ARITHMETIC LEFT           --
--      4 - ARITHMETIC RIGHT          --
--      5 - ROTATE LEFT               --
--      6 - ROTATE RIGHT              --
--      7 -                           --
--      8 -                           --
----------------------------------------
-- C: ?g bit output value             --
-- STATUS: 4 bit status output        --
--         0 - ZERO                   --
--         1 - NOOP                   -- 
--         2 - SIGN                   --
--         3 - OVERFLOW               --
----------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY shifter IS
	PORT
	(
		in_a       : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		in_fun     : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		---------------------------------------------------------------
		out_c      : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_status : OUT    STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END shifter;

ARCHITECTURE behavioral OF shifter IS
	SIGNAL s_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL s_status : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
	PROCESS(in_fun, in_a, s_out)
	BEGIN
		CASE(in_fun) IS
			-- PASS 
			WHEN "000" =>
				s_out <= in_a;	
				s_status <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, s_status'LENGTH));				
					
			-- LEFT 
			WHEN "001" =>
				s_out <= STD_LOGIC_VECTOR(SHIFT_LEFT(UNSIGNED(in_a), 1));
				
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';

				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= '0';
				s_status(2) <= s_out(31);
				
				IF(in_a(31) = '1') THEN
					s_status(3) <= '1';

				ELSE
					s_status(3) <= '0';
				END IF;	
				
			-- RIGHT
			WHEN "010" =>
				s_out <= STD_LOGIC_VECTOR(SHIFT_RIGHT(UNSIGNED(in_a), 1));
				
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';

				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= '0';
				s_status(2) <= s_out(31);
				s_status(3) <= '0';
				
			-- A LEFT 
			WHEN "011" =>
				s_out <= STD_LOGIC_VECTOR(SHIFT_LEFT(SIGNED(in_a), 1));
				
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';

				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= '0';
				s_status(2) <= s_out(31);
				
				IF(in_a(31) = '1') THEN
					s_status(3) <= '1';

				ELSE
					s_status(3) <= '0';
				END IF;
			-- A RIGHT
			WHEN "100" =>
				s_out <= STD_LOGIC_VECTOR(SHIFT_RIGHT(SIGNED(in_a), 1));
				
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';

				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= '0';
				s_status(2) <= s_out(31);
				s_status(3) <= '0';
				
			-- R LEFT 
			WHEN "101" =>
				s_out <= STD_LOGIC_VECTOR(ROTATE_LEFT(UNSIGNED(in_a), 1));
				
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';

				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= '0';
				s_status(2) <= s_out(31);
				s_status(3) <= '0';

			-- R RIGHT
			WHEN "110" =>
				s_out <= STD_LOGIC_VECTOR(ROTATE_LEFT(UNSIGNED(in_a), 1));
				
				IF(TO_INTEGER(UNSIGNED(s_out)) = 0) THEN
					s_status(0) <= '1';

				ELSE
					s_status(0) <= '0';
				END IF;
				
				s_status(1) <= '0';
				s_status(2) <= s_out(31);
				s_status(3) <= '0';
				
			WHEN OTHERS =>
				s_out <= in_a;	
				s_status <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, s_status'LENGTH));	
				
		END CASE;
	END PROCESS;
	out_c <= s_out;
	out_status <= s_status;
END behavioral;