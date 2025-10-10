module fa_tb;
  reg a,b,cin;
  wire sum,cout;
  integer i;
  full_adder fa(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
  initial begin
    for(i=0;i<=7;i=i+1) begin
      {a,b,cin}=i;
      #10;
      $display("a=%b b=%b cin=%b sum=%b cout=%b",a,b,cin,sum,cout);
    end
    $finish;
  end
endmodule
