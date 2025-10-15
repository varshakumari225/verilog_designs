module tb;
  localparam N=6;//N value chaged from 4 to 6
  reg [N-1:0]a,b;//a,b are 6 bit length
  reg cin; //carry is propagated to next full adder.like the ripple carry adder
  wire [N-1:0]s;//sum is also 6bit length
  wire cout;
  full_adder #(.N(N)) fa(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
  initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0,tb);
    repeat(6) begin
      {a,b,cin}=$random;//APPLYING RANDOM TEST CASES
      #5;
      $display("a=%b b=%b cin=%b s=%b cout=%b",a,b,cin,s,cout);
    end
    $finish;
  end
endmodule
