library verilog;
use verilog.vl_types.all;
entity quanta2 is
    port(
        ALUResult       : out    vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        debug           : out    vl_logic_vector(31 downto 0);
        immediate       : out    vl_logic_vector(31 downto 0);
        instruction     : out    vl_logic_vector(31 downto 0);
        opcode          : out    vl_logic_vector(7 downto 0);
        pc              : out    vl_logic_vector(31 downto 0);
        regA            : out    vl_logic_vector(31 downto 0);
        regB            : out    vl_logic_vector(31 downto 0)
    );
end quanta2;
