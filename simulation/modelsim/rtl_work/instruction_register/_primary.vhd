library verilog;
use verilog.vl_types.all;
entity instruction_register is
    generic(
        N               : integer := 16
    );
    port(
        clk             : in     vl_logic;
        d               : in     vl_logic_vector;
        q               : out    vl_logic_vector;
        ir_ld           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end instruction_register;
