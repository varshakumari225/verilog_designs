module tb;
  reg [2:0]a;
  wire [7:0]y;
  integer i;
  decoder u(.a(a),.y(y));
  initial begin
  for(i=0;i<=7;i=i+1) begin
    a=i;
    #10
    $display("output of a=%b y=%b",a,y);
  end
  $finish;
  end
endmodule
