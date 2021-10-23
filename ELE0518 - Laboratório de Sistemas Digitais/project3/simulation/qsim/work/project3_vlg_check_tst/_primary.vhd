library verilog;
use verilog.vl_types.all;
entity project3_vlg_check_tst is
    port(
        csig            : in     vl_logic;
        dis_0           : in     vl_logic_vector(6 downto 0);
        dis_1           : in     vl_logic_vector(6 downto 0);
        dis_2           : in     vl_logic_vector(6 downto 0);
        dis_3           : in     vl_logic_vector(6 downto 0);
        dis_4           : in     vl_logic_vector(6 downto 0);
        s               : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end project3_vlg_check_tst;
