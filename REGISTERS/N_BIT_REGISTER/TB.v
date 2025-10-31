module tb;
  parameter N=6;
  reg clk,rst,write,read;
  reg [N-1:0]din;
  wire [N-1:0] mem,dout;
  registers #(N) u(clk,rst,write,read,din,mem,dout);
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    $monitor("at time %t rst=%b write=%b read=%b din=%b mem=%b dout=%b",$time,rst,write,read,din,mem,dout);
    $dumpfile("dump.vcd");
    $dumpvars;
    rst=1;#5;
    rst=0;
    repeat(10) begin
      write=$random;
      read=$random;
      din=$random;
      #10;
    end
     $finish;
  end
endmodule
