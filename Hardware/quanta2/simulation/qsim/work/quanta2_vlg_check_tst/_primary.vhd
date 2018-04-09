library verilog;
use verilog.vl_types.all;
entity quanta2_vlg_check_tst is
    port(
        ALUResult       : in     vl_logic_vector(31 downto 0);
        debug           : in     vl_logic_vector(31 downto 0);
        immediate       : in     vl_logic_vector(31 downto 0);
        instruction     : in     vl_logic_vector(31 downto 0);
        opcode          : in     vl_logic_vector(7 downto 0);
        pc              : in     vl_logic_vector(31 downto 0);
        regA            : in     vl_logic_vector(31 downto 0);
        regB            : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end quanta2_vlg_check_tst;
