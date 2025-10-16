module tb;
  reg d,e;
  wire q,qb;
  d_latch u(.d(d),.e(e),.q(q),.qb(qb));
  initial begin
    $dumpfile("d_latch.vcd");
    $dumpvars(0,tb);
    $display("e=%b d=%b q=%b qb=%b",e,d,q,qb);
    e=0;d=1;#10;
    $display("e=%b d=%b q=%b qb=%b",e,d,q,qb);
    e=1;d=0;#5;
    $display("e=%b d=%b q=%b qb=%b",e,d,q,qb);
    e=1;d=1;#5;
    $display("e=%b d=%b q=%b qb=%b",e,d,q,qb);
    e=0;d=0;#5;
    $display("e=%b d=%b q=%b qb=%b",e,d,q,qb);
    $finish;
  end
endmodule
