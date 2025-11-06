module tb;
  reg e,clk,rst;
  wire a;
  sr_4b u(e,clk,rst,a);
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    $monitor("at time %t input=%b rst=%b output=%b",$time,e,rst,a);
    $dumpfile("dump.vcd");
    $dumpvars;
  	rst=1;#5;
    rst=0;
    e=1;#10;
    e=0;#10;
    e=1;
    #80;
    $finish;
  end
endmodule
