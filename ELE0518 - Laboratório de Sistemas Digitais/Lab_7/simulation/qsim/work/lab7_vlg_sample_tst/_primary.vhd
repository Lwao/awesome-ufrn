library verilog;
use verilog.vl_types.all;
entity lab7_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        h               : in     vl_logic;
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab7_vlg_sample_tst;
