library verilog;
use verilog.vl_types.all;
entity RegisterOEN is
    generic(
        N               : integer := 16
    );
    port(
        Clk             : in     vl_logic;
        Rst             : in     vl_logic;
        Ld              : in     vl_logic;
        I               : in     vl_logic_vector;
        Oe0             : in     vl_logic;
        Oe1             : in     vl_logic;
        Qz0             : out    vl_logic_vector;
        Qz1             : out    vl_logic_vector;
        RQ              : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end RegisterOEN;
