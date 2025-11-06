module sipo(input din,clk,rst,output reg a,b,c,d);
  always @(posedge clk or posedge rst)begin
    if (rst)begin
      {a,b,c,d}='b0;
    end
      else begin
        a<=din;
        b<=a;
        c<=b;
        d<=c;
      end
  end
endmodule
