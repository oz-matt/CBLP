	component embedded_system is
		port (
			ad9833_io_readdata : out std_logic_vector(31 downto 0);        -- readdata
			clk_clk            : in  std_logic                     := 'X'  -- clk
		);
	end component embedded_system;

	u0 : component embedded_system
		port map (
			ad9833_io_readdata => CONNECTED_TO_ad9833_io_readdata, -- ad9833_io.readdata
			clk_clk            => CONNECTED_TO_clk_clk             --       clk.clk
		);

