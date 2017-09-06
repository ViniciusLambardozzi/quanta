LIBRARY ieee;
USE ieee.numeric_std.ALL;

PACKAGE range_util IS
    FUNCTION range_start(base, size : POSITIVE) return POSITIVE;
END PACKAGE;

PACKAGE BODY range_util IS
    FUNCTION range_start(base, size : POSITIVE) return POSITIVE IS 
        BEGIN
            RETURN base + size - 1;
    END FUNCTION;
END PACKAGE BODY;