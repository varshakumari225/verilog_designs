module full_adder (input [2:0]a,output s,c);
  assign s=a[0]^a[1]^a[2];
  assign c=(a[0]&a[1])|(a[1]&a[2])|(a[2]&a[0]);
endmodule
