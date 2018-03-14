-------------------------------------
-- SRAM                            --
-------------------------------------
--IN---------------------------------
-- DATA : input value              --
-- ADDR : address                  --
-- WE   : 1 bit write enable       --
-- CLK  : 1 bit RAM clock          --
-------------------------------------
--OUT--------------------------------
-- DATA : output value             --
-------------------------------------

LIBRARY ieee;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

USE WORK.types.ALL;

ENTITY data_ram IS 
    GENERIC
    (
      addr_width : POSITIVE := 10
    );
    PORT
    (
		clk      : IN  STD_LOGIC;
		------------------------------------------------------
      data_in  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
      addr     : IN  STD_LOGIC_VECTOR(addr_width - 1 DOWNTO 0);
		------------------------------------------------------
      we       : IN  STD_LOGIC;      
      ------------------------------------------------------
      data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END data_ram;

ARCHITECTURE behavioral OF data_ram IS 
	-- Memory signal
   SIGNAL memory : bus_array(2**addr_width - 1 DOWNTO 0);

BEGIN
    PROCESS(clk)
    BEGIN
        -- Read/Write to memory on rising edge if enabled
        IF RISING_EDGE(clk) THEN
            IF(we = '1') THEN
               -- Write input word to memory at addr
               memory(CONV_INTEGER(addr)) <= data_in;
            ELSE
               -- Read output word from memory at addr
					-- Wire read world to output
               data_out <= memory(CONV_INTEGER(addr));
            END IF;
        END IF;
    END PROCESS;
END behavioral;