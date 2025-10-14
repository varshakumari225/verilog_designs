module mux(input i0,i1,input s,output y);
  assign y=(~s&i0)|(s&i1);
endmodule
module decoder_using_mux(input a,b,output [3:0]out);
  wire w0;
  mux m0(.i0(1),.i1(0),.s(a),.y(w0));       //Not gate
  mux m1(.i0(w0),.i1(0),.s(b),.y(out[0]));  //(~a)&(~b)
  mux m2(.i0(b),.i1(0),.s(a),.y(out[1]));   //(~a)&b
  mux m3(.i0(a),.i1(0),.s(b),.y(out[2]));   //a&(~b)
  mux m4(.i0(0),.i1(a),.s(b),.y(out[3]));   //a&b
endmodule
