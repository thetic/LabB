library verilog;
use verilog.vl_types.all;
entity Processor is
    port(
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        IR_Out          : out    vl_logic_vector(15 downto 0);
        PC_Out          : out    vl_logic_vector(4 downto 0);
        StateO          : out    vl_logic_vector(3 downto 0);
        ALU_A           : out    vl_logic_vector(15 downto 0);
        ALU_B           : out    vl_logic_vector(15 downto 0);
        ALU_Out         : out    vl_logic_vector(15 downto 0);
        RQ0             : out    vl_logic_vector(15 downto 0);
        Mux_out         : out    vl_logic_vector(15 downto 0)
    );
end Processor;
