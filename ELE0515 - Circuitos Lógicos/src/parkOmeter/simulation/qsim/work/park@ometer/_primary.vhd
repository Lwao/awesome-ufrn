library verilog;
use verilog.vl_types.all;
entity parkOmeter is
    port(
        b               : in     vl_logic;
        c               : in     vl_logic;
        f               : in     vl_logic;
        rst             : in     vl_logic;
        d               : in     vl_logic;
        A               : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        estado          : out    vl_logic_vector(31 downto 0);
        ts              : out    vl_logic_vector(5 downto 0);
        go              : out    vl_logic_vector(5 downto 0);
        ch              : out    vl_logic_vector(5 downto 0);
        td              : out    vl_logic_vector(5 downto 0);
        tgo             : out    vl_logic_vector(7 downto 0);
        tch             : out    vl_logic_vector(7 downto 0);
        tt              : out    vl_logic_vector(3 downto 0)
    );
end parkOmeter;
