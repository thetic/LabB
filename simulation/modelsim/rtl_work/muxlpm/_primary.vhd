library verilog;
use verilog.vl_types.all;
entity muxlpm is
    port(
        data0x          : in     vl_logic_vector(4 downto 0);
        data1x          : in     vl_logic_vector(4 downto 0);
        sel             : in     vl_logic;
        result          : out    vl_logic_vector(4 downto 0)
    );
end muxlpm;
