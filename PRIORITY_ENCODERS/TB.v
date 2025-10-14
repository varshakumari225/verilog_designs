module tb;
  reg [3:0]i;
  wire [1:0]y;
  priority_encoder u(.i(i),.y(y));
  initial begin
    i=4'b0001;#10;
    $display("output of i=%b is y=%b",i,y);
    i=4'b0010;#10;
    $display("output of i=%b is y=%b",i,y);
    i=4'b01xx;#10;
    $display("output of i=%b is y=%b",i,y);
    repeat(3) begin
      i=$random;#10;
    $display("output of i=%b is y=%b",i,y);
    end
  end
endmodule
