library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        Sel             : in     vl_logic_vector(2 downto 0);
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        Q               : out    vl_logic_vector(15 downto 0)
    );
end ALU;
