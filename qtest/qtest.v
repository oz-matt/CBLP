
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module qtest(

	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,

	//////////// LED (High Active) //////////
	output		     [8:0]		LEDG,
	output		    [17:0]		LEDR,

	//////////// KEY (Active Low) //////////
	input 		     [3:0]		KEY,

	//////////// SW //////////
	input 		    [17:0]		SW,

	//////////// SEG7 (Low Active) //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,
	output		     [6:0]		HEX6,
	output		     [6:0]		HEX7,

	//////////// LCD //////////
	inout 		     [7:0]		LCD_DATA,
	output		          		LCD_EN,
	output		          		LCD_ON,
	output		          		LCD_RS,
	output		          		LCD_RW,

	//////////// Fan Control //////////
	inout 		          		FAN_CTRL
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

reg[6:0] testseg = 7'b1111000;


//=======================================================
//  Structural coding
//=======================================================

assign HEX0 = testseg;


reg [25:0] cnt;
reg led = 0;
reg addy = 0;

always @ (posedge CLOCK_50)
begin
	cnt <= cnt + 1;
	if (cnt >= 50000000)
	begin
	  cnt <= 0;
	  led <= !led;
	  addy <= !addy;
	end  
end

assign LEDR[0] = led;

assign PCIE_WAKE_N = 1'b1;	 // 07/30/2013, pull-high to avoid system reboot after power off


	//////////// FAN Control //////////
assign FAN_CTRL = 1'bz; // turn on FAN

wire reset_n;
assign reset_n = 1'b1;

wire[7:0] readdata;
wire[7:0] readdata2;

reg[7:0] r_readdata = 0;
reg[7:0] r_readdata2 = 0;


reg[7:0] wdata = 8'hDD;
reg[7:0] wdata2 = 8'hFF;


reg wbit = 0;

  reg[7:0] addy1 = 0;
  reg[7:0] addybuff = 0;

  reg [31:0] clk_ctr = 0;


  /*always @(posedge CLOCK_50)
  begin
  
    r_readdata <= readdata;
    
    if (clk_ctr >= 50000012)
    begin
      //addy1 <= 0;
      wbit <= 0;
    end
    else
    if (clk_ctr == 50000010)
    begin
      addybuff <= addybuff + 1;
      addy1 <= addybuff + 1;
      wbit <= 1;
    end
    
    if (clk_ctr >= 50000014)
    begin
      clk_ctr <= 0;
    end
    else
      clk_ctr <= clk_ctr + 1;
  end*/
  
  // controls for M10K block just below
wire [63:0] M10K_read_data ;
reg [63:0] M10K_data_buffer, M10K_write_data ;
reg [6:0] M10K_read_address, M10K_write_address ; 
reg M10K_write ;

// make the M10K block
/*single_clk_ram M10K1( 
    .q(M10K_read_data),
    .d(M10K_write_data),
    .write_address(M10K_write_address), 
	 .read_address(M10K_read_address),
    .we(M10K_write), 
	 .clk(CLOCK_50)
);*/


always @(posedge CLOCK_50)
begin
  
  if (clk_ctr >= 20)
  begin
    M10K_write <= 0;
  end
  else 
  if (clk_ctr >= 15)
  begin
    M10K_write_address <= 2;
  end
  else 
  if (clk_ctr >= 10)
  begin
    M10K_write_address <= 1;
  end
  else  
  if (clk_ctr >= 5)
  begin
    M10K_write <= 1;
  end
  else
  if (clk_ctr >= 0)
  begin
    M10K_write_data <= 64'h11111111111111CC;
	 M10K_write_address <= 0;
	 M10K_read_address <= 0;
	 M10K_write <= 0;
  end
  

  if (clk_ctr >= 40)
  begin
    M10K_data_buffer <= M10K_read_data;
  end
  else
  if (clk_ctr >= 35)
  begin
    M10K_read_address <= 1;
	 M10K_write_address <= 0;
  end
  else
  if (clk_ctr >= 30)
  begin
    M10K_data_buffer <= M10K_read_data;
  end
  else
  if (clk_ctr >= 25)
  begin
	 M10K_read_address <= 0;
	 M10K_write_address <= 0;
	 M10K_write <= 0;
  end
  
  
  
  
  
  if (clk_ctr >= 50000000)
  begin
    clk_ctr <= 25;
  end
  else
    clk_ctr <= clk_ctr + 1;
  
end  
  


  
  
  
/*
  always @(posedge CLOCK_50)
  begin
  
    
    case (r_current_state)
      
      READ_STATE:
      begin
        clk_ctr <= clk_ctr + 1;
        cs1 <= 1;
		  //addy1 <= 2;
        if(clk_ctr >= 10)
          r_current_state <= IDLE_STATE_1;
      end
      
      IDLE_STATE_1:
      begin
        clk_ctr <= clk_ctr + 1;
        cs1 <= 0;
		  //addy1 <= 0;
        if(clk_ctr >= 20)
          r_current_state <= WRITE_STATE;
      end
      
      WRITE_STATE:
      begin
        clk_ctr <= clk_ctr + 1;
        cs2 <= 1;
		  //addy2 <= 2;
        if(clk_ctr >= 30)
          r_current_state <= IDLE_STATE_2;
      end
      
      IDLE_STATE_2:
      begin
        clk_ctr <= clk_ctr + 1;
        cs2 <= 0;
		  //addy2 <= 0;
        if(clk_ctr >= 40)
        begin
          r_current_state <= READ_STATE;
          clk_ctr <= 0;
        end
      end
    endcase
  end
*/

    qtestpd u0 (
        .clk_clk                        (CLOCK_50),                        //                 clk.clk
		  
        .onchip_memory2_0_s1_address    (M10K_write_address),    // onchip_memory2_0_s1.address
        .onchip_memory2_0_s1_clken      (1),      //                    .clken
        .onchip_memory2_0_s1_chipselect (1), //                    .chipselect
        .onchip_memory2_0_s1_write      (1),      //                    .write
        .onchip_memory2_0_s1_readdata   (),   //                    .readdata
        .onchip_memory2_0_s1_writedata  (M10K_write_data),  //                    .writedata
        .onchip_memory2_0_s1_byteenable (8'hFF), //                    .byteenable
		  
		  
		  .onchip_memory2_0_s2_address    (M10K_read_address),    // onchip_memory2_0_s2.address
        .onchip_memory2_0_s2_chipselect (1), //                    .chipselect
        .onchip_memory2_0_s2_clken      (1),      //                    .clken
        .onchip_memory2_0_s2_write      (0),      //                    .write
        .onchip_memory2_0_s2_readdata   (M10K_read_data),   //                    .readda
        .onchip_memory2_0_s2_writedata  (),  //                    .writedata
        .onchip_memory2_0_s2_byteenable (8'hFF), //                    .byteenable
        .reset_reset_n                  (reset_n)                   //               reset.reset_n
    );

 
	 assign LEDG[7:0] = M10K_data_buffer[15:8];
    //assign LEDR[15:8] = r_readdata[15:8];
	 

endmodule

/*module single_clk_ram(
output reg [7:0] q,
input [7:0] d,
input [6:0] write_address, read_address,
input we, clk
);
reg [7:0] mem [127:0];
always @ (posedge clk) begin
if (we)
mem[write_address] <= d;
q <= mem[read_address]; // q doesn't get d in this clock cycle
end
endmodule
*/