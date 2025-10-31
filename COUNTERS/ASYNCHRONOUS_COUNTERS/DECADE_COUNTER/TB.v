module tb;
  reg clk,rst;
  wire [3:0]count;
  bcd_counter c(clk,rst,count);
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    $monitor("at time %t reset=%b count=%b",$time,rst,count);
    $dumpfile("dump.vcd");
    $dumpvars;
    rst=1;#10;
    rst=0;#10;
    #110;
    $finish;
  end
endmodule
