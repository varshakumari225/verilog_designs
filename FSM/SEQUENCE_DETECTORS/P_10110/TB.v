module tb;
reg clk,rst,in_bit;
wire p_det;
pattern_det p(clk,rst,in_bit,p_det);
  initial clk=0;
  always #5 clk=~clk;
  initial begin
      $monitor("at time %t reset=%b input bit=%b pattern detect=%b",$time,rst,in_bit,p_det);
    //When i write $monitor it will print values in the console.otherwise it won't print that value. 
    $dumpfile("dump.vcd");
    $dumpvars;
    rst=1;#5;
    rst=0;
    
    //Generating random data bit pattern for 100 iterations
    
    /*repeat(100) begin
    in_bit=$random;
    #5;
  end*/

  //input bit pattern 10110110110
    
  in_bit=1;#10;
  in_bit=0;#10;
  in_bit=1;#10;
  in_bit=1;#10;
  in_bit=0;#10;
  in_bit=1;#10;
  in_bit=1;#10;
  in_bit=0;#10;
  in_bit=1;#10;
  in_bit=1;#10;
  in_bit=0;#10;
    $finish;
end
endmodule
