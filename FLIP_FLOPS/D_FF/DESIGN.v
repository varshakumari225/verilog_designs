module d_ff(input rst,clk,d,output reg q);
  //Behavioural logic
  //synchronous reset
  //always @(posedge clk) begin
 /* When reset = 1 → circuit resets
  When reset = 0 → circuit works normally*/
  //asynchronous reset
    always @(posedge clk or posedge rst)begin
    if (rst) 
      q<=0;
    else
      q<=d;
  end
  //Gate level 
  wire w1,w2,w3,w4;
  not(w4,d);
  nand(q,w2,w1);
  nand(w1,w3,q);
  nand(w2,d,clk);
  nand(w3,w4,clk);
endmodule
