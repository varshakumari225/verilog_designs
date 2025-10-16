module tb;
  reg rst,clk,d;
  wire q;
  d_ff u(.rst(rst),.clk(clk),.d(d),.q(q));
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    $monitor("at time %t rst=%b d=%b q=%b",$time,rst,d,q);
    $dumpfile("d_ff.vcd");
    $dumpvars(0,tb);
      rst=1;d=1;#5;
      rst=0;d=0;#5; //for Asynchronous reset change delay to 6 means the rst change after 6ns of delay.
      d=1;#5;
      d=1;#5;
    $finish;
  end
endmodule
