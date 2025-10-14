module swap();
  reg int a,b,temp; 
  reg clk;
  initial begin 
    clk=0;
    forever #1 clk=~clk;
  end
  initial begin
    $dumpfile("swap.vcd");
    $dumpvars(0,swap);
    a=8'd10;
    b=8'd20;
  end
  
  //Blocking assignments
  
  always @(posedge clk) begin
    #1;
    temp=a;
    a=b;
    b=temp;
    $display("a=%0d b=%0d temp=%0d",a,b,temp);
    #1;
    $display("a=%0d b=%0d temp=%0d",a,b,temp);
    $finish;
  end
  
  //Non blocking assignments
  
  /*always @(posedge clk)begin
    b<=a;
    a<=b;
    $display("a=%0d b=%0d",a,b);
    #10;
    $display("a=%0d b=%0d",a,b);
    $finish;
  end*/
endmodule
