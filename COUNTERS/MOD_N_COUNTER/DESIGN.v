module mod_n #(parameter n=10,parameter width=4)(input clk,rst,output reg [width-1:0] count);
  always @(posedge clk)begin
    if(rst)
      count<=0;
    else if(count==n-1)
      count<=0;
    else
      count<=count+1;
  end
endmodule
