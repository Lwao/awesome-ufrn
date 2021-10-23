library verilog;
use verilog.vl_types.all;
entity lab7_vlg_check_tst is
    port(
        a               : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab7_vlg_check_tst;
