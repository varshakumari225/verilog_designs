module tb;
  reg din,clk,rst;
  wire a,b,c,d;
  sipo u(din,clk,rst,a,b,c,d);
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    $monitor("at time %0t data input=%b rst=%b a=%b b=%b c=%b d=%b",$time,din,rst,a,b,c,d);
    $dumpfile("dump.vcd");
    $dumpvars;
    rst=1;#5;
    rst=0;
    din=1;#10;
    din=0;#10;
    din=1;#10;
    din=1;#15;
    $finish;
  end
endmodule
