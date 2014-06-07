library verilog;
use verilog.vl_types.all;
entity Hex7seg is
    port(
        C               : in     vl_logic_vector(3 downto 0);
        Display         : out    vl_logic_vector(0 to 6)
    );
end Hex7seg;
