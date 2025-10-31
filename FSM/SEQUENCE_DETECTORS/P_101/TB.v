module tb;
  reg clk,rst,in_bit;
  wire p_det;
  seq_det s(clk,rst,in_bit,p_det);
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    //$monitor("at time %t rst=%b input bit=%b p_det=%b",$time,rst,in_bit,p_det);
    $dumpfile("dump.vcd");
    $dumpvars;
    rst=1;#5;
    rst=0;
    repeat (100) begin
      in_bit=$random;
      $display("at time %t rst=%b input bit=%b p_det=%b",$time,rst,in_bit,p_det);
      #5;
    end
    $finish;
  end
endmodule
