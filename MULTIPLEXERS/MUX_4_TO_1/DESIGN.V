module mux(input a,b,c,d,input [1:0]sel,output y,output reg by);
  wire w0,w1,w2,w3,w4,w5;
  //Using conditional operator
  
 assign y=(sel==2'b00)?a:(sel==2'b01)?b:(sel==2'b10)?c:d;
  
  //structural and gate level modelling
  
  not(w0,sel[1]);
  not(w1,sel[0]);
  and(w2,w0,w1,a);
  and(w3,w0,sel[0],b);
  and(w4,sel[1],w1,c);
  and(w5,sel[1],sel[0],d);
  or(y,w2,w3,w4,w5);
  
  //behavioural model
  always @(*) begin
    case(sel)
      2'b00:by=a;//by Behavioural output
      2'b01:by=b;
      2'b10:by=c;
      2'b11:by=d;
    endcase
  end  
endmodule
