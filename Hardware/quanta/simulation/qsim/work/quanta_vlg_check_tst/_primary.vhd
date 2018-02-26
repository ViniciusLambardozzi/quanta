library verilog;
use verilog.vl_types.all;
entity quanta_vlg_check_tst is
    port(
        hex0            : in     vl_logic_vector(6 downto 0);
        hex1            : in     vl_logic_vector(6 downto 0);
        hex2            : in     vl_logic_vector(6 downto 0);
        hex3            : in     vl_logic_vector(6 downto 0);
        hex4            : in     vl_logic_vector(6 downto 0);
        hex5            : in     vl_logic_vector(6 downto 0);
        hex6            : in     vl_logic_vector(6 downto 0);
        hex7            : in     vl_logic_vector(6 downto 0);
        pc              : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end quanta_vlg_check_tst;
