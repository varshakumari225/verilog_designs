module tb;
  reg a,b;
  wire [3:0]out;
  integer i;
  decoder_using_mux u(.a(a),.b(b),.out(out));
  initial begin
    for (i=0;i<=3;i=i+1) begin
      {a,b}=i;
      #10;
      $display("a=%b b=%b out=%b",a,b,out);
    end
    //Giving stimulus using system task $random
   /* repeat(6) begin
      {a,b}=$random;#10;
      $display("a=%b b=%b out=%b",a,b,out);
    end*/
  end
endmodule
