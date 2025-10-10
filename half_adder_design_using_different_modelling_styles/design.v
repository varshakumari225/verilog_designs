module half_adder(input a,b,output df_s,df_c,st_s,st_c,output reg be_s,be_c);
  //sum=a^b carry=ab
  //data flow
  assign df_s=(a^b);
  assign df_c=a&b;
  //structural
  xor(st_s,a,b);
  and(st_c,a,b);
  //behavioural
  always@(*) begin //*is implication operator
    be_s=a^b;
    be_c=a&b;
  end
endmodule
