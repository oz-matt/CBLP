`ifndef UART_V
`define UART_V


module uart(input wire clk2, output wire GPIO3);

	reg[31:0] n = 0;

	always @(posedge clk2) n <= n+1;

	assign GPIO3 = n[22];

endmodule

`endif