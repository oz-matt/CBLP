module CinnaBoNFPGA
  (input i_clk,
  output wire o_led1,
  output wire o_led2,
  output wire o_led3,
  output wire o_led4,
  output wire o_led5
  );

  wire r_leds1;
  wire r_leds2;
  wire r_leds3;
  wire r_leds4;
  wire r_leds5;
  
  SeqBlinker sq
    (.i_clk(i_clk),
	 .outreg1(r_leds1),
	 .outreg2(r_leds2),
	 .outreg3(r_leds3),
	 .outreg4(r_leds4),
	 .outreg5(r_leds5)
	 );
	 
  assign o_led1 = r_leds1;
  assign o_led2 = r_leds2;
  assign o_led3 = r_leds3;
  assign o_led4 = r_leds4;
  assign o_led5 = r_leds5;

endmodule


/*module CinnaBoNFPGA (
  input wire i_clk,
  input wire i_btn1,
  output wire o_led1,
  output wire sevled1,
  output wire sevled2,
  output wire sevled3,
  output wire sevled4,
  output wire sevled5,
  output wire sevled6
);

reg r_led1 = 1'b0;
wire w_clean_switch;

reg[3:0] ledcode;
wire outcode1;
wire outcode2;
wire outcode3;
wire outcode4;
wire outcode5;
wire outcode6;

Debouncer d(
  .i_clk(i_clk),
  .i_bouncy_switch(i_btn1),
  .o_clean_switch(w_clean_switch)
);

SevLedDecoder sev(
  .i_clk(i_clk),
  .i_code(ledcode),
  .o_code1(outcode1),
  .o_code2(outcode2),
  .o_code3(outcode3),
  .o_code4(outcode4),
  .o_code5(outcode5),
  .o_code6(outcode6)
);

always @(posedge i_clk)
begin
  if(w_clean_switch == 1'b1)
    r_led1 <= 1'b1;
	 //ledcode <= ledcode + 1;
	 //if(ledcode > 6) ledcode <= 0;
  else
    r_led1 <= 1'b0;
end

always @(posedge w_clean_switch)
begin
	ledcode <= ledcode + 1;
	if(ledcode > 6) ledcode <= 0;
end

assign o_led1 = r_led1;

assign sevled1 = outcode1;
assign sevled2 = outcode2;
assign sevled3 = outcode3;
assign sevled4 = outcode4;
assign sevled5 = outcode5;
assign sevled6 = outcode6;


endmodule


*/






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