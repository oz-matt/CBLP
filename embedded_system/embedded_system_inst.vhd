	component embedded_system is
		port (
			clk_clk            : in  std_logic                     := 'X'; -- clk
			ad9833_io_readdata : out std_logic_vector(31 downto 0)         -- readdata
		);
	end component embedded_system;

	u0 : component embedded_system
		port map (
			clk_clk            => CONNECTED_TO_clk_clk,            --       clk.clk
			ad9833_io_readdata => CONNECTED_TO_ad9833_io_readdata  -- ad9833_io.readdata
		);

