library verilog;
use verilog.vl_types.all;
entity parkOmeter_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(2 downto 0);
        b               : in     vl_logic;
        c               : in     vl_logic;
        clk             : in     vl_logic;
        d               : in     vl_logic;
        f               : in     vl_logic;
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end parkOmeter_vlg_sample_tst;
