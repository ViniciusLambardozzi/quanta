LIBRARY ieee;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

USE WORK.constants.ALL;
USE WORK.types.ALL;

ENTITY instruction_ram IS 
    GENERIC
    (
      g_addr_width : POSITIVE := INSTRUCTION_RAM_ADDR_WIDTH
    );
    PORT
    (
		in_clk : IN STD_LOGIC;
		
      in_addr : IN STD_LOGIC_VECTOR(g_addr_width - 1 DOWNTO 0);
		
		
      out_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END instruction_ram;

ARCHITECTURE behavioral OF instruction_ram IS 
	-- Memory signal
   SIGNAL memory : bus_array(2**g_addr_width - 1 DOWNTO 0);

    ----------------------------------------------------------------------
    -- RAM initialization with data file                                --
      ATTRIBUTE ram_init_file : string;                                 --
      ATTRIBUTE ram_init_file OF memory: SIGNAL IS "quanta2inst.mif"; -- 
    ----------------------------------------------------------------------
BEGIN
    PROCESS(in_clk)
    BEGIN
        -- Read/Write to memory on rising edge if enabled
        IF RISING_EDGE(in_clk) THEN
               -- Read output word from memory at addr
					-- Wire read world to output
               out_data <= memory(CONV_INTEGER(in_addr));
        END IF;
    END PROCESS;
END behavioral;