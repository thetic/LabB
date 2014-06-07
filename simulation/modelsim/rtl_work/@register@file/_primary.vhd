library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    port(
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        W_data          : in     vl_logic_vector(15 downto 0);
        W_addr          : in     vl_logic_vector(3 downto 0);
        W_en            : in     vl_logic;
        R_addr0         : in     vl_logic_vector(3 downto 0);
        R_addr1         : in     vl_logic_vector(3 downto 0);
        R_en0           : in     vl_logic;
        R_en1           : in     vl_logic;
        R_data0         : out    vl_logic_vector(15 downto 0);
        R_data1         : out    vl_logic_vector(15 downto 0);
        RQ              : out    vl_logic_vector(15 downto 0)
    );
end RegisterFile;
