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

ENTITY ram IS 
    GENERIC
    (
      addr_width : POSITIVE := 10
    );
    PORT
    (
		clk      : IN  STD_LOGIC;
		------------------------------------------------------
      addr     : IN  STD_LOGIC_VECTOR(addr_width - 1 DOWNTO 0);   
      ------------------------------------------------------
      data_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END ram;

ARCHITECTURE behavioral OF ram IS 
	-- Memory signal
   SIGNAL memory : bus_array(2**addr_width - 1 DOWNTO 0);

    ------------------------------------------------------------------
    -- RAM initialization with data file                            --
      ATTRIBUTE ram_init_file : string;                             --
      ATTRIBUTE ram_init_file OF memory: SIGNAL IS "quanta.mif";    -- 
    ------------------------------------------------------------------
BEGIN
    PROCESS(clk)
    BEGIN
        -- Read/Write to memory on rising edge if enabled
        IF RISING_EDGE(clk) THEN
               -- Read output word from memory at addr
					-- Wire read world to output
               data_out <= memory(CONV_INTEGER(addr));
        END IF;
    END PROCESS;
END behavioral;