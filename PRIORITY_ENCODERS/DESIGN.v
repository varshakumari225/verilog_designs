module priority_encoder(input [3:0]i,output [1:0]y);
  //4:1 Priority encoders
  assign y[0]=(~i[3]&~i[2]&i[1])|i[3];
  assign y[1]=(~i[3]&i[2])|i[3];
  
endmodule
