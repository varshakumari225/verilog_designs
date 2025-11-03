module tb;
  localparam N=4;
  reg clk,rst;
  reg [N-1:0]binary;
  wire [N-1:0]count;
  gray_counter u(binary,clk,rst,count);
  initial clk=0;
  always #5clk=~clk;
  integer i;
  initial begin
    rst=1;#10;
    rst=0;
    $dumpfile("dump.vcd");
    $dumpvars;
    for(i=0;i<=15;i=i+1)begin
      binary=i;
      #10;
      $display("gray count=%b",count);
    end
    $finish;
  end
endmodule
