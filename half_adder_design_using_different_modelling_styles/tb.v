module ha_tb;
  reg a,b;
  wire df_s,df_c,st_s,st_c,be_s,be_c;
  integer i;
  half_adder ha(.a(a),.b(b),.df_s(df_s),.df_c(df_c),.st_s(st_s),.st_c(st_c),.be_s(be_s),.be_c(be_c));
  initial begin
    for(i=0;i<=3;i=i+1) begin
      {a,b}=i;
      #10;
$display("a=%b b=%b df_s=%b df_c=%b st_%b st_c=%b be_s=%b be_c=%b",a,b,df_s,df_c,st_s,st_c,be_s,be_c);
    end
 $finish;
  end
endmodule
