library verilog;
use verilog.vl_types.all;
entity project3_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(4 downto 0);
        b               : in     vl_logic_vector(4 downto 0);
        b_op            : in     vl_logic;
        b_rst           : in     vl_logic;
        clk             : in     vl_logic;
        op_in           : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end project3_vlg_sample_tst;
