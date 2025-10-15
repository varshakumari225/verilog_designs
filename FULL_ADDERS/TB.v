module tb;
  reg [2:0]a;
  wire s,c;
  integer i;
  full_adder fa(.a(a),.s(s),.c(c));
  initial begin
    for(i=0;i<=7;i=i+1) begin
      a=i;
      #10
      $display("a[2]=%b a[1]=%b a[0]=%b s=%b c=%b",a[2],a[1],a[0],s,c); 
    end
    $finish;
  end
endmodule
