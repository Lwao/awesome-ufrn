library verilog;
use verilog.vl_types.all;
entity parkOmeter_vlg_check_tst is
    port(
        ch              : in     vl_logic_vector(5 downto 0);
        estado          : in     vl_logic_vector(31 downto 0);
        go              : in     vl_logic_vector(5 downto 0);
        tch             : in     vl_logic_vector(7 downto 0);
        td              : in     vl_logic_vector(5 downto 0);
        tgo             : in     vl_logic_vector(7 downto 0);
        ts              : in     vl_logic_vector(5 downto 0);
        tt              : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end parkOmeter_vlg_check_tst;
