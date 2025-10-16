module tb;
  reg clk,rst,load;
  reg [3:0]data;
  wire [3:0]count;
  counter c(.clk(clk),.rst(rst),.load(load),.data(data),.count(count));
 initial clk=1;
 always #5 clk=~clk;
 task reset;
    begin
      @(negedge clk)
      rst=1'b1;#5;
      rst=1'b0;
    end
 endtask
 task t0(input l,input [3:0]d);
    begin
      @(negedge clk)begin
      load=l;
      data=d;
      end
    end
 endtask
  initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0,tb);
    $monitor("at time %t rst=%b load=%b data=%b count=%b",$time,rst,load,data,count);
    reset;
    #5;
    t0(1,4'b0011);
    #5;
    t0(1,4'b1100);
    #5;
    t0(0,4'b1111);
    #5;
    t0(1,4'b1011);
    #10;
    $finish;
  end
endmodule
