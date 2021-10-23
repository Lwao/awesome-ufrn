library verilog;
use verilog.vl_types.all;
entity project3 is
    port(
        a               : in     vl_logic_vector(4 downto 0);
        b               : in     vl_logic_vector(4 downto 0);
        b_op            : in     vl_logic;
        b_rst           : in     vl_logic;
        op_in           : in     vl_logic_vector(2 downto 0);
        s               : out    vl_logic_vector(4 downto 0);
        csig            : out    vl_logic;
        clk             : in     vl_logic;
        dis_0           : out    vl_logic_vector(6 downto 0);
        dis_1           : out    vl_logic_vector(6 downto 0);
        dis_2           : out    vl_logic_vector(6 downto 0);
        dis_3           : out    vl_logic_vector(6 downto 0);
        dis_4           : out    vl_logic_vector(6 downto 0)
    );
end project3;
