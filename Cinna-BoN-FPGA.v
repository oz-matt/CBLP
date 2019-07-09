module CinnaBoNFPGA (
  input wire i_clk,
  input wire i_btn1,
  output wire o_led1
);

reg r_led1 = 1'b0;

always @(posedge i_clk)
begin
  if(i_btn1 == 1'b1)
    r_led1 = 1'b1;
  else
    r_led1 = 1'b0;
end

assign o_led1 = r_led1;

endmodule









/*


module sendChar(input[15:0] n);
	always @* begin
		case (n)
			0: GPIO3 = 1;
			1: GPIO3 = 0;
			2: GPIO3 = 1;
			3: GPIO3 = 1;
			4: GPIO3 = 0;
			5: GPIO3 = 0;
			6: GPIO3 = 1;
			7: GPIO3 = 1;
		endcase
	end
endmodule


	module CinnaBoNFPGA (
	input wire clk, // 50MHz input clock
	output wire LED, // LED ouput
	output wire GPIO1,
	output reg GPIO2,
	output reg GPIO3
	);

// create a binary counter
	reg [31:0] cnt; // 32-bit counter
	reg [11:0] clkdiv; // 12-bit counter
	reg [15:0] uartwait;

initial begin

cnt <= 32'h00000000; // start at zero

end

always @(posedge clk) begin

	cnt <= cnt + 1; // count up
	clkdiv <= clkdiv + 1;
	if(clkdiv >= 2604)
	begin
	    clkdiv <= 0;
	    GPIO2 = !GPIO2;
		 uartwait <= uartwait + 1;
		 if(uartwait >= 48000)
		 begin
			uartwait <= 0;
		 end
		 sendChar send_a(.n(uartwait));
	end
	
end


//assign LED to 25th bit of the counter to blink the LED at a few Hz
assign LED = cnt[10];
assign GPIO1 = clkdiv[3];
//assign GPIO2 = clk;

endmodule
*/