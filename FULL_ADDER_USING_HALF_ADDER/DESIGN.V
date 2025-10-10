module half_adder(input a,b,output s,c);
  assign s=a^b;
  assign c=a&b;
endmodule
module full_adder(input a,b,cin,output sum,cout);
  wire w0,w1,w2;
  half_adder ha1(.a(a),.b(b),.s(w0),.c(w1));
  half_adder ha2(.a(cin),.b(w0),.s(sum),.c(w2));
  or(cout,w1,w2);
endmodule
