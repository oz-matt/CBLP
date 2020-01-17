	component qtestpd is
		port (
			clk_clk                        : in  std_logic                    := 'X';             -- clk
			onchip_memory2_0_s1_address    : in  std_logic_vector(6 downto 0) := (others => 'X'); -- address
			onchip_memory2_0_s1_clken      : in  std_logic                    := 'X';             -- clken
			onchip_memory2_0_s1_chipselect : in  std_logic                    := 'X';             -- chipselect
			onchip_memory2_0_s1_write      : in  std_logic                    := 'X';             -- write
			onchip_memory2_0_s1_readdata   : out std_logic_vector(7 downto 0);                    -- readdata
			onchip_memory2_0_s1_writedata  : in  std_logic_vector(7 downto 0) := (others => 'X'); -- writedata
			reset_reset_n                  : in  std_logic                    := 'X'              -- reset_n
		);
	end component qtestpd;

	u0 : component qtestpd
		port map (
			clk_clk                        => CONNECTED_TO_clk_clk,                        --                 clk.clk
			onchip_memory2_0_s1_address    => CONNECTED_TO_onchip_memory2_0_s1_address,    -- onchip_memory2_0_s1.address
			onchip_memory2_0_s1_clken      => CONNECTED_TO_onchip_memory2_0_s1_clken,      --                    .clken
			onchip_memory2_0_s1_chipselect => CONNECTED_TO_onchip_memory2_0_s1_chipselect, --                    .chipselect
			onchip_memory2_0_s1_write      => CONNECTED_TO_onchip_memory2_0_s1_write,      --                    .write
			onchip_memory2_0_s1_readdata   => CONNECTED_TO_onchip_memory2_0_s1_readdata,   --                    .readdata
			onchip_memory2_0_s1_writedata  => CONNECTED_TO_onchip_memory2_0_s1_writedata,  --                    .writedata
			reset_reset_n                  => CONNECTED_TO_reset_reset_n                   --               reset.reset_n
		);

