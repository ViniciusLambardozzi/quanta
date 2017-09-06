library verilog;
use verilog.vl_types.all;
entity quanta is
    port(
        hex0            : out    vl_logic_vector(6 downto 0);
        sys_clock       : in     vl_logic;
        buttons         : in     vl_logic_vector(3 downto 0);
        switches        : in     vl_logic_vector(17 downto 0);
        hex1            : out    vl_logic_vector(6 downto 0);
        hex2            : out    vl_logic_vector(6 downto 0);
        hex3            : out    vl_logic_vector(6 downto 0);
        hex4            : out    vl_logic_vector(6 downto 0);
        hex5            : out    vl_logic_vector(6 downto 0);
        hex6            : out    vl_logic_vector(6 downto 0);
        hex7            : out    vl_logic_vector(6 downto 0);
        pc              : out    vl_logic_vector(31 downto 0);
        r31             : out    vl_logic_vector(31 downto 0)
    );
end quanta;
