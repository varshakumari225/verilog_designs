module counters  #(parameter N=3) (input [N-1:0] data,input load,clk,rst,ud,output reg [N-1:0] count);
  always @ (posedge clk) begin
    if (rst)
      count=0;
    else if(load)
      count=data;
    
    //ud=1 works as up counter otherwise down counter
    
    else if(ud)
      count=count+1;
    else
      count=count-1;
  end
endmodule
