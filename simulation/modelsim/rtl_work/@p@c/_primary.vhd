library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        O               : out    vl_logic_vector(4 downto 0);
        Clear           : in     vl_logic;
        Up              : in     vl_logic;
        Clock           : in     vl_logic
    );
end PC;
