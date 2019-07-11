module SevLedDecoder (
  input i_clk,
  input[3:0] i_code,
  output o_code1,
  output o_code2,
  output o_code3,
  output o_code4,
  output o_code5,
  output o_code6
);

reg[5:0] r_code;

always @(posedge i_clk)
begin
  case (i_code)
  4'b0000 : r_code <= 6'h3E;
  4'b0001 : r_code <= 6'h10;
  4'b0010 : r_code <= 6'h0F;
  4'b0011 : r_code <= 6'h15;
  4'b0100 : r_code <= 6'h3A;
  4'b0101 : r_code <= 6'h21;
  4'b0110 : r_code <= 6'h0D;
  endcase

end

assign o_code1 = r_code[0];
assign o_code2 = r_code[1];
assign o_code3 = r_code[2];
assign o_code4 = r_code[3];
assign o_code5 = r_code[4];
assign o_code6 = r_code[5];

endmodule