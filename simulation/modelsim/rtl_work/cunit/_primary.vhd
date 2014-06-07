library verilog;
use verilog.vl_types.all;
entity cunit is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        D_addr          : out    vl_logic_vector(7 downto 0);
        D_wr            : out    vl_logic;
        RF_s            : out    vl_logic;
        RF_W_addr       : out    vl_logic_vector(3 downto 0);
        RF_W_wr         : out    vl_logic;
        RF_Ra_addr      : out    vl_logic_vector(3 downto 0);
        RF_Ra_rd        : out    vl_logic;
        RF_Rb_addr      : out    vl_logic_vector(3 downto 0);
        RF_Rb_rd        : out    vl_logic;
        Alu_s0          : out    vl_logic_vector(2 downto 0);
        IR_Out          : out    vl_logic_vector(15 downto 0);
        PC_Out          : out    vl_logic_vector(4 downto 0);
        StateO          : out    vl_logic_vector(3 downto 0)
    );
end cunit;
