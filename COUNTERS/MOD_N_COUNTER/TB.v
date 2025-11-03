module tb;
  localparam n=6;
  localparam width=3;
  reg clk,rst;
  wire [width-1:0] count;
  mod_n #(n,width) m(clk,rst,count);
  initial clk=0;
  always#5 clk=~clk;
  initial begin
    rst=1;#10;
    rst=0;
    $monitor("at time %t clk=%b rst=%b count=%b",$time,clk,rst,count);
    #80;
    $finish;
  end
endmodule
