module sr_4b(input e,input clk,rst,output reg a);
  reg b,c,d;
  always @(posedge clk or posedge rst)begin
    if(rst)begin
      {a,b,c,d}='b0;
    end
    else begin
      a=b;
      b=c;
      c=d;
      d=e;
    end
  end
endmodule
