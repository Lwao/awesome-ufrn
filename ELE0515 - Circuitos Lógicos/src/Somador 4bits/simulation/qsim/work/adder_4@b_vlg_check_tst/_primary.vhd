library verilog;
use verilog.vl_types.all;
entity adder_4B_vlg_check_tst is
    port(
        CO              : in     vl_logic;
        S0              : in     vl_logic;
        S1              : in     vl_logic;
        S2              : in     vl_logic;
        S3              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end adder_4B_vlg_check_tst;
