module ad9833_avalon (
  input clock,
  input resetn,
  input chipselect,
  input[3:0] byteenable,
  input[31:0] writedata, 
  input write,
  
  output[31:0] Q_export
  );
  
  wire good_to_reset_go;
  wire send_complete;
  wire fsync;
  wire sclk;
  wire sdata;

ad9833if aif ( 
  .clk(clock),
  .resetn(resetn),
  .go(write),
  .datain(writedata),
  .byteenable(byteenable),
  .good_to_reset_go(good_to_reset_go),
  .send_complete(send_complete),
  .fsync(fsync),
  .sclk(sclk),
  .sdata(sdata)
  );
  
  assign Q_export[0] = good_to_reset_go;
  assign Q_export[1] = send_complete;
  assign Q_export[2] = fsync;
  assign Q_export[3] = sclk;
  assign Q_export[4] = sdata;

endmodule
