library verilog;
use verilog.vl_types.all;
entity reg_mult_vlg_sample_tst is
    port(
        CLOCK           : in     vl_logic;
        I0              : in     vl_logic;
        I1              : in     vl_logic;
        I2              : in     vl_logic;
        I3              : in     vl_logic;
        LD_CTRL         : in     vl_logic;
        SL_CTRL         : in     vl_logic;
        SL_IN           : in     vl_logic;
        SR_CTRL         : in     vl_logic;
        SR_IN           : in     vl_logic;
        VCC             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end reg_mult_vlg_sample_tst;
