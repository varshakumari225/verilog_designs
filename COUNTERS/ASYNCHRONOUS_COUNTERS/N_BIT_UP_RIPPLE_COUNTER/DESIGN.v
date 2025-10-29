module ripple_counter #(parameter N=2)(input clk,rst,output reg [N-1:0]count);
  always @(posedge clk)begin
    if(rst)
      count<=0;
    else
      count<=count+1;
  end
endmodule
