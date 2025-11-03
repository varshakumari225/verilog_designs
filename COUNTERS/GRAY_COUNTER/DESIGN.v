module gray_counter #(parameter N=4)(input [N-1:0]binary,input clk,rst,output reg [N-1:0]count);
  always@(posedge clk)begin
    if(rst)
    count<='b0;
  else
  /*count[3]=binary[3];
  count[2]=binary[3]^binary[2];
  count[1]=binary[2]^binary[1]; 
  count[0]=binary[1]^binary[0];*/
  count=binary^(binary>>1);
  end
endmodule
