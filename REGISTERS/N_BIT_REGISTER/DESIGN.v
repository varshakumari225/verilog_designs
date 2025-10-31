module registers #(parameter N=3)(input clk,rst,write,read,input [N-1:0]din,output reg [N-1:0]mem,dout);
  always @(posedge clk or posedge rst)begin
    if(rst)
    dout<=0;
    else if (write)
      mem<=din;//writing data into the memory
    else if (read)
      dout<=mem;//reading data from the memory
      else
        dout<='bx;
  end
endmodule 
