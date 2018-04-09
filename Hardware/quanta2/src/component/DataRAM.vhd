LIBRARY ieee;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

USE WORK.types.ALL;

ENTITY data_ram IS 
    GENERIC
    (
      g_address_width : POSITIVE := 10
    );
    PORT
    (
		in_clk      : IN  STD_LOGIC;
		------------------------------------------------------
      in_data  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
      in_address     : IN  STD_LOGIC_VECTOR(g_address_width - 1 DOWNTO 0);
		------------------------------------------------------
      in_we       : IN  STD_LOGIC;      
      ------------------------------------------------------
      out_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END data_ram;

ARCHITECTURE behavioral OF data_ram IS 
	-- Memory signal
   SIGNAL memory : bus_array(2**g_address_width - 1 DOWNTO 0);
	
	 ----------------------------------------------------------------------
    -- RAM initialization with data file                                --
      ATTRIBUTE ram_init_file : string;                                 --
      ATTRIBUTE ram_init_file OF memory: SIGNAL IS "quanta2data.mif"; -- 
    ----------------------------------------------------------------------

BEGIN
    PROCESS(in_clk)
    BEGIN
        -- Read/Write to memory on rising edge if enabled
        IF RISING_EDGE(in_clk) THEN
            IF(in_we = '1') THEN
               -- Write input word to memory at in_address
               memory(CONV_INTEGER(in_address)) <= in_data;
            ELSE
               -- Read output word from memory at in_address
					-- Wire read world to output
               out_data <= memory(CONV_INTEGER(in_address));
            END IF;
        END IF;
    END PROCESS;
END behavioral;