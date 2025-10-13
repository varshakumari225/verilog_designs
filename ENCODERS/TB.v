module tb;
  reg [3:0]i;
  wire [1:0]y;
  encoder u(.i(i),.y(y));
  initial begin
    i=4'b0001;#10;
    $display("output %b %b",y[1],y[0]);
    i=4'b0010;#10;
    $display("output %b %b",y[1],y[0]);
    i=4'b0100;#10;
    $display("output %b %b",y[1],y[0]);
    i=4'b1000;#10;
    $display("output %b %b",y[1],y[0]);
    i=4'b1001;#10;
    $display("output %b %b",y[1],y[0]);
    $finish;
  end
endmodule
