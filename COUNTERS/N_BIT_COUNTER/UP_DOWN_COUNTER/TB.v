module tb;
  parameter N=2;
  reg [N-1:0]data;
  reg load,clk,rst,ud;
  wire [N-1:0]count;
  counters #(N)c(data,load,clk,rst,ud,count);
  integer i;
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $monitor("at time %t rst=%b load=%b data=%b up/down=%b count=%b",$time,rst,load,data,ud,count); 
    rst=1;#5;
    rst=0;
    
  /*load=1;
    for(i=0;i<=2;i=i+1)begin
      data=i;
      #10;
    end
    data=2'b10;#10;
   // data=3'b111;#10;
    load=0;#10;
    load=0;#10;
    load=1;#10;*/
    
    //RANDOM STIMULUS GENERATION
    
    repeat(10) begin
    data=$random;
    load=$random;
    ud=$random;   //ud MEANS UP_DOWN
    #10;
    end
    
    $finish;
  end
endmodule
