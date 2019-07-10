module Debouncer (
  input i_clk,
  input i_bouncy_switch,
  output o_clean_switch
);

parameter clk_cycles_for_good_switch = 500000;

reg r_clean_switch = 1'b0;
reg [18:0] r_ctr = 0;

always @(posedge i_clk)
begin
  if(i_bouncy_switch !== r_clean_switch && r_ctr < clk_cycles_for_good_switch)
    r_ctr <= r_ctr + 1;
  else if(r_ctr >= clk_cycles_for_good_switch)
  begin
    r_ctr <= 0;
    r_clean_switch <= i_bouncy_switch;
  end
  else
    r_ctr <= 0;
end

assign o_clean_switch = r_clean_switch;