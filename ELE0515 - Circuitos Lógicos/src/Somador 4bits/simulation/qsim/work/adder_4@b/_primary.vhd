library verilog;
use verilog.vl_types.all;
entity adder_4B is
    port(
        S0              : out    vl_logic;
        CI              : in     vl_logic;
        A0              : in     vl_logic;
        B0              : in     vl_logic;
        S1              : out    vl_logic;
        A1              : in     vl_logic;
        B1              : in     vl_logic;
        S2              : out    vl_logic;
        A2              : in     vl_logic;
        B2              : in     vl_logic;
        S3              : out    vl_logic;
        A3              : in     vl_logic;
        B3              : in     vl_logic;
        CO              : out    vl_logic
    );
end adder_4B;
