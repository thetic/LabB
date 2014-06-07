library verilog;
use verilog.vl_types.all;
entity PCAdder is
    port(
        I               : in     vl_logic_vector(4 downto 0);
        O               : out    vl_logic_vector(4 downto 0)
    );
end PCAdder;
