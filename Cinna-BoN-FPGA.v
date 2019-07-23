module CinnaBoNFPGA
  (input i_clk,
  input i_adc_miso,
  output o_adc_convst,
  output o_adc_sck,
  output o_adc_mosi,
  output reg o_led1 = 0,
  output o_uarttxline
  );
  
  reg[5:0] r_bits_to_send_to_adc = 6'b100000;
  reg r_request_conversion = 0;

  wire w_adc_dv;
  
  wire[11:0] w_adc_data;
  reg[11:0] r_adc_data = 12'b101010110011;
  
  wire w_conv_in_process;
  reg r_conv_in_process = 0;
  
  reg[29:0] sec_ctr = 0;
  
  AdcReceiver #(50) AdcInstance
  (.i_clk(i_clk),
  .i_tx_bits(r_bits_to_send_to_adc),
  .i_request_conversion(r_request_conversion),
  .o_rx_dv(w_adc_dv),
  .o_rx_data(w_adc_data),
  .o_conv_in_process(w_conv_in_process),
  .i_serial_rx(i_adc_miso),
  .o_convst(o_adc_convst),
  .o_sck(o_adc_sck),
  .o_serial_tx(o_adc_mosi)
  );
  
  reg[7:0] r_byte_to_send = 0;
  reg r_data_valid = 0;
  
  wire w_good_to_reset_dv;
  wire w_send_complete;
  
  UartTxr #(434) TXR_Instance
    (.i_clk(i_clk),
    .i_byte_to_send(r_byte_to_send),
    .i_data_valid(r_data_valid),
    .o_dataline(o_uarttxline),
	 .o_good_to_reset_dv(w_good_to_reset_dv),
	 .o_send_complete(w_send_complete)
	 );
	 
  reg[3:0] adcbit = 0;

  always @(posedge i_clk)
  begin
    sec_ctr <= sec_ctr + 1;
	 
	 if (sec_ctr == 1)
	 begin
	   r_byte_to_send <= 8'h30 + r_adc_data[0];
		r_data_valid <= 1;
		adcbit <= 1;
	 end
	 
	 if (sec_ctr == 5000 || sec_ctr == 10000 ||
	 sec_ctr == 15000 || sec_ctr == 20000 || sec_ctr == 25000 ||
	 sec_ctr == 30000 || sec_ctr == 35000 || sec_ctr == 40000 ||
	 sec_ctr == 45000 || sec_ctr == 50000 || sec_ctr == 55000)
	 begin
	   r_byte_to_send <= 8'h30 + r_adc_data[adcbit];
		r_data_valid <= 1;
	   adcbit <= adcbit + 1;
	 end
	 
	 if (sec_ctr == 60000)
	 begin
	   r_byte_to_send <= 8'h0A;
		r_data_valid <= 1;
	 end
	 if (sec_ctr == 65000)
	 begin
	   r_byte_to_send <= 8'h0D;
		r_data_valid <= 1;
	 end
	 
	 if (sec_ctr > 100000000)
	 begin
	   o_led1 <= ~o_led1;
	   sec_ctr <= 0;
	 end
	 if(w_conv_in_process == 1) 
	   r_request_conversion <= 0;
	 if(w_good_to_reset_dv == 1) 
	   r_data_valid <= 0;
  end

  
endmodule


/*
module CinnaBoNFPGA
  (input i_clk,
  input i_uartrxline,
  output o_uarttxline
  );
  
  reg[7:0] r_byte_to_send = 8'h31;
  reg r_data_valid = 0;
  
  wire w_good_to_reset_dv;
  wire w_send_complete;
  wire w_uarttxline;
  wire w_data_ready;
  
  wire[7:0] w_data_byte;
  

  reg[29:0] sec_ctr = 0;
  
  UartTxr #(434) TXR_Instance
    (.i_clk(i_clk),
    .i_byte_to_send(r_byte_to_send),
    .i_data_valid(r_data_valid),
    .o_dataline(w_uarttxline),
	 .o_good_to_reset_dv(w_good_to_reset_dv),
	 .o_send_complete(w_send_complete));
	 
  UartRxr #(434) RXR_Instance
  (.i_clk(i_clk),
  .i_rx_data_line(i_uartrxline),
  .o_data_ready(w_data_ready),
  .o_data_byte_out(w_data_byte));
  
  always @(posedge i_clk)
  begin
    if(w_data_ready == 1)
	 begin
      r_byte_to_send <= w_data_byte;
	   r_data_valid <= 1;
    end
  
    if(w_good_to_reset_dv == 1)
	   r_data_valid <= 0;
  end

  assign o_uarttxline = w_uarttxline;
  
endmodule
*/
/*module CinnaBoNFPGA
  (input i_clk,
  output wire o_led1,
  output wire o_led2,
  output wire o_led3,
  output wire o_led4,
  output wire o_led5
  );
  
  wire r_leds[4:0];
  
  SeqBlinker
    #(
	 50000000, 
	 25000000, 
	 12500000, 
	 10000000, 
	 5000000
	 ) sq
    (.i_clk(i_clk),
	 .outreg1(r_leds[0]),
	 .outreg2(r_leds[1]),
	 .outreg3(r_leds[2]),
	 .outreg4(r_leds[3]),
	 .outreg5(r_leds[4])
	 );
	 
  assign o_led1 = r_leds[0];
  assign o_led2 = r_leds[1];
  assign o_led3 = r_leds[2];
  assign o_led4 = r_leds[3];
  assign o_led5 = r_leds[4];

endmodule
*/

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