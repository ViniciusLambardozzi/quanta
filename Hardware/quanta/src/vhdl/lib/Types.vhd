-- Ram data types
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE ram_types IS 
    SUBTYPE ram_word IS STD_LOGIC_VECTOR(31 DOWNTO 0);
    TYPE ram_data IS ARRAY(NATURAL RANGE<>) OF ram_word;
END ram_types;

-- Multiplexer data types
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE mux_types IS 
    SUBTYPE mux_input_data IS STD_LOGIC_VECTOR(31 DOWNTO 0);
    TYPE mux_input IS ARRAY(NATURAL RANGE<>) OF mux_input_data;
END mux_types;