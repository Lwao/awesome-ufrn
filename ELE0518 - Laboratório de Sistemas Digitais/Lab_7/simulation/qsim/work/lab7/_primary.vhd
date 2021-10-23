library verilog;
use verilog.vl_types.all;
entity lab7 is
    port(
        h               : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        a               : out    vl_logic_vector(4 downto 0)
    );
end lab7;
