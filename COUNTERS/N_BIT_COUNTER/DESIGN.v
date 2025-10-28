module counters  #(parameter N=3) (input [N-1:0] data,input load,clk,rst,output reg [N-1:0] count);
  always @ (posedge clk) begin
    if (rst)
      count=0;
    else if(load)
      count=data;
    else
      count=count+1;
  end
endmodule
