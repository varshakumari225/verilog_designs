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

//test bench by using the tasks

module jk_tb;
  reg clk,j,k;
  wire q;
  jk u(.clk(clk),.j(j),.k(k),.q(q));
  initial clk=0;
  always #5 clk=~clk;
  task in(input t,input u);
    begin
    #10;
    j=t;
    k=u;
    end
  endtask
  initial begin
    $monitor("at time %t the value of j=%b k=%b q=%b",$time,j,k,q);
    in(0,0);//Calling the task by name and passing the values
    in(0,1);
    in(1,0);
    in(1,1);
    #10;
    $finish;
  end
endmodule
