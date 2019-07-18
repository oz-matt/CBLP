# inform quartus that the clk port brings a 50MHz clock into our design so
	# that timing closure on our design can be analyzed

create_clock -name clk -period "50MHz" [get_ports clk]
#create_clock -period 20 [get_ports FPGA_CLK1_50]
# inform quartus that the LED output port has no critical timing requirements
	# its a single output port driving an LED, there are no timing relationships
	# that are critical for this

set_false_path -from * -to [get_ports LED]