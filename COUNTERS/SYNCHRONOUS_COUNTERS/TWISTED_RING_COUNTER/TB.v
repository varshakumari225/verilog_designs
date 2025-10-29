module tb;
  reg clk,clr;
  reg [3:0] d;
  wire [3:0] q,qbar; //q[3]q[2]q[1]q[0]
  jc u(clk,clr,d,q,qbar);
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $monitor("at time %t clr=%b q=%b",$time,clr,q);
    clr=1;#10;
    clr=0;
    #100;
    $finish;
  end
endmodule
