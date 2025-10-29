module tb;
  parameter N=4;
  reg clk,rst;
  wire [N-1:0]count;
  ripple_counter #(N) c(clk,rst,count);
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    $monitor("at time %t reset=%b count=%b",$time,rst,count);
    $dumpfile("dump.vcd");
    $dumpvars;
    rst=1;#10;
    rst=0;#10;
    #80;
    $finish;
  end
endmodule
