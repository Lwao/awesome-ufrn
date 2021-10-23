library verilog;
use verilog.vl_types.all;
entity adder_4B_vlg_sample_tst is
    port(
        A0              : in     vl_logic;
        A1              : in     vl_logic;
        A2              : in     vl_logic;
        A3              : in     vl_logic;
        B0              : in     vl_logic;
        B1              : in     vl_logic;
        B2              : in     vl_logic;
        B3              : in     vl_logic;
        CI              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end adder_4B_vlg_sample_tst;
