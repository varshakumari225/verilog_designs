module d_ff(input clk,rst,d,output reg q,output qbar);
  assign qbar=~q;
  always @(posedge clk)begin
    if(rst)
      q<=0;
    else
      q<=d;
  end
endmodule

//JOHNSON'S COUNTER (OR) TWISTED RING COUNTER

module jc(input clk,clr,input [3:0] d,output reg [3:0] q,qbar);
  d_ff d0(clk,clr,qbar[3],q[0],qbar[0]);
  d_ff d1(clk,clr,q[0],q[1],qbar[1]);
  d_ff d2(clk,clr,q[1],q[2],qbar[2]);
  d_ff d3(clk,clr,q[2],q[3],qbar[3]);
endmodule
