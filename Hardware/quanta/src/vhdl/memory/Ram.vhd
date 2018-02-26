-------------------------------------
-- ?g word 32 bit SRAM             --
-- PORT MAPPING                    --
-- DATA: 32 bit input value        --
-- ADDR: ceil(log2(?g)) bit address--
-- WE  :  1 bit write enable       --
-- EN  :  1 bit enable             --
-- CLK :  1 bit RAM clock          --
-------------------------------------
-- OUT: 32 bit output value        --
-------------------------------------

USE WORK.ram_types.ALL;

LIBRARY ieee;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY ram IS 
    GENERIC
    (
        g_addr_width : POSITIVE := 10
    );
    PORT
    (
        in_data  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        in_addr  : IN STD_LOGIC_VECTOR(g_addr_width - 1 DOWNTO 0);
        in_we    : IN STD_LOGIC;
        in_en    : IN STD_LOGIC;
        in_clk   : IN STD_LOGIC;
        ----------------------------------------------------------
        out_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END ram;

ARCHITECTURE behavioral OF ram IS 
    SIGNAL s_memory : ram_data(2**g_addr_width - 1 DOWNTO 0);

    ------------------------------------------------------------------
    -- RAM initialization with data file                            --
       ATTRIBUTE ram_init_file : string;                            --
       ATTRIBUTE ram_init_file OF s_memory: SIGNAL IS "quanta.mif"; -- 
    ------------------------------------------------------------------
BEGIN
    PROCESS(in_en, in_clk)
    BEGIN
        -- Read/Write to memory on rising edge if enabled
        IF(in_en = '1' AND RISING_EDGE(in_clk)) THEN
            IF(in_we = '1') THEN
                -- Write input word to addr
                s_memory(CONV_INTEGER(in_addr)) <= in_data;
            ELSE
                -- Read output word from addr
                out_data <= s_memory(CONV_INTEGER(in_addr));
            END IF;
        END IF;
    END PROCESS;
END behavioral;