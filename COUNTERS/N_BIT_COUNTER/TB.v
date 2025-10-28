module tb;
  parameter N=2;
  reg [N-1:0]data;
  reg load,clk,rst;
  wire [N-1:0]count;
  counters #(N)c(data,load,clk,rst,count);
  integer i;
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $monitor("at time %t rst=%b load=%b data=%b count=%b",$time,rst,load,data,count); 
    rst=1;#5;
    rst=0;
    load=1;
    for(i=0;i<=2;i=i+1)begin
      data=i;
      #10;
    end
    data=2'b01;#10;
   // data=3'b111;#10;
    load=0;#10;
    //When load = 0 → it works like a normal counter, counting each clock pulse.
    //When load = 1 → it jumps to whatever value you give in data and then starts counting from there.

    //RANDOM STIMULUS GENERATION
    
   /* repeat(6) begin
    data=$random;
    load=$random;
    #10;
    end*/
    
    $finish;
  end
endmodule
