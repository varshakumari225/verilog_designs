module tb;
  reg a,b;
  wire y0,y1,y2,y3,y4,y5;
  integer i;
  logic_gates_using_mux u(.a(a),.b(b),.yand(y0),.yor(y1),.ynand(y2),.ynor(y3),.yxor(y4),.yxnor(y5));
  initial begin
    $dumpfile("logic_gates_using_mux.vcd");
    $dumpvars(0,tb);
    for(i=0;i<=3;i=i+1) begin
      {a,b}=i;
      #10;
      $display("a=%b b=%b yand=%b yor=%b ynand=%b ynor=%b yxor=%b yxnor=%b",a,b,y0,y1,y2,y3,y4,y5);
    end
  end
endmodule
