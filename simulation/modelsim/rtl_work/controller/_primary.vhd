library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        instruction     : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        Reset           : in     vl_logic;
        D_addr          : out    vl_logic_vector(7 downto 0);
        D_wr            : out    vl_logic;
        PC_clr          : out    vl_logic;
        PC_up           : out    vl_logic;
        IR_ld           : out    vl_logic;
        RF_s            : out    vl_logic;
        RF_W_addr       : out    vl_logic_vector(3 downto 0);
        RF_W_wr         : out    vl_logic;
        RF_Ra_addr      : out    vl_logic_vector(3 downto 0);
        RF_Ra_rd        : out    vl_logic;
        RF_Rb_addr      : out    vl_logic_vector(3 downto 0);
        RF_Rb_rd        : out    vl_logic;
        Alu_s0          : out    vl_logic_vector(2 downto 0);
        State           : out    vl_logic_vector(3 downto 0)
    );
end controller;
