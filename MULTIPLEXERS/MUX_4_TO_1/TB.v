module mux_tb;
  reg a,b,c,d;
  reg[1:0]sel;
  wire y,by;
  integer i;
  mux m(.a(a),.b(b),.c(c),.d(d),.sel(sel),.y(y),.by(by));
  initial begin 
    a=0;b=1;c=0;d=1;#10;
    for(i=0;i<=3;i=i+1)begin
      sel=i;
    #10;
      $display("sel=%b sel=%b by=%b",sel[1],sel[0],by);
	end
    $finish;
  end
endmodule
