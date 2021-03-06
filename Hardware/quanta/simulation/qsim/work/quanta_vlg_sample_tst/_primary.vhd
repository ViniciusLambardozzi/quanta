library verilog;
use verilog.vl_types.all;
entity quanta_vlg_sample_tst is
    port(
        buttons         : in     vl_logic_vector(3 downto 0);
        switches        : in     vl_logic_vector(17 downto 0);
        sys_clock       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end quanta_vlg_sample_tst;
