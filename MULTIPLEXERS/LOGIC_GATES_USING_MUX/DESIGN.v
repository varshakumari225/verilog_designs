module mux(input i0,i1,s,output o);
  assign o=((~s)&i0)|s&i1;
endmodule
module logic_gates_using_mux(input a,b,output yand,yor,ynand,ynor,yxor,yxnor);
  wire w0;
  //NOT GATE
  mux m0(.i0(1),.i1(0),.s(b),.o(w0));
  //AND GATE
  mux m1(.i0(0),.i1(b),.s(a),.o(yand));
  //OR GATE
  mux m2(.i0(b),.i1(1),.s(a),.o(yor));
  //NAND GATE
  mux m3(.i0(1),.i1(w0),.s(a),.o(ynand));
  //NOR GATE
  mux m4(.i0(w0),.i1(0),.s(a),.o(ynor));
  //XOR GATE
  mux m5(.i0(b),.i1(w0),.s(a),.o(yxor));
  //XNOR GATE
  mux m6(.i0(w0),.i1(b),.s(a),.o(yxnor));
endmodule
