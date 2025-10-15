module d_ff(input rst,clk,d,output reg q);
  always @(posedge clk) begin
  //When reset = 1 → circuit resets
  //When reset = 0 → circuit works normally
    if (rst) 
      q<=0;
    else
      q<=d;
  end
endmodule
