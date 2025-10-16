module d_latch(input d,e,output q,qb);
  wire w0,s,r;
  not(w0,d);
  and(s,d,e);
  and(r,w0,e);
  nor(q,r,qb);
  nor(qb,s,q);
endmodule
