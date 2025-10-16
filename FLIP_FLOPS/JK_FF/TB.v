module tb;
  reg clk,j,k;
  wire q;
  integer i;
  jk_ff u(.clk(clk),.j(j),.k(k),.q(q));
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    $dumpfile("jk_ff.vcd");
    $dumpvars(0,tb);
    $monitor("at time %t j=%b k=%b q=%b",$time,j,k,q);
    for(i=0;i<=3;i=i+1) begin
      {j,k}=i;
      #10;
    end
    $finish;
  end
endmodule
