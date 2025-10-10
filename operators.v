`timescale 1ns / 1ps
module operators;
reg [3:0] a,b;
reg [3:0]add,sub,mul,div;
reg [3:0] la,lo,ln;
reg g,ge,l,le,eq,neq,ceq,cneq;
reg [3:0] ba,bo,bn,bxor,bxnor;
reg [3:0] ra,rna,ro,rno,rxor,rxnor;
reg [3:0] sr,sl,ars,als;
initial begin
a=4'b1000;
b=4'b0001;
  
//arithmatic operators
  
add=a+b;
$display("addition of a=%b and b=%b is %b",a,b,add);
sub=a-b;
$display("subtraction of a=%b and b=%b is %b",a,b,sub);
mul=a*b;
$display("multiplication of a=%b and b=%b is %b",a,b,mul);
div=a/b;
$display("division of a=%b and b=%b is %b",a,b,div);
  
//logical operators
  
  la=a&&b;
  lo=a||b;
  ln=!a;
  $display("logical and=%b logical or=%b logical not=%b",la,lo,ln);
  
  //relational operators
  
  g=(a>b);
  ge=(a>=b);
  l=(a<b);
  le=(a<=b);
  eq=(a==b);
  neq=(a!=b);
  ceq=(a===b);
  cneq=(a!==b);
  $display("relational operators values g=%b ge=%b l=%b le=%b eq=%b neq=%b ceq=%b cneq=%b",g,ge,l,le,eq,neq,ceq,cneq);
  
  //Bitwise operators
  
  ba=(a&b);
  bo=(a|b);
  bn=~a;
  bxor=(a^b);
  bxnor=(a~^b);
  $display("Bitwise operators values ba=%b bo=%b bn=%b bxor=%b bxnor=%b",ba,bo,bn,bxor,bxnor);
  
  //reduction operators
  
  ra=&a;
  rna=~&a;
  ro=|b;
  rno=~|b;
  rxor=^a;
  rxnor=~^a;
  $display("reduction operators values ra=%b rna=%b ro=%b rno=%b rxor=%b rxnor=%b",ra,rna,ro,rno,rxor,rxnor);
  
  //shift operators
  
  sr=a>>1'b1;//right shit by onebit
  sl=b<<1'd2;//leftshift by 2bits
  ars=b>>>1'b1;//arithmatic rightshift
  als=a<<<1'd2;//arithmatic left shift by 2bits
  $display(" shift operators values sr=%b sl=%b ars=%b als=%b",sr,sl,ars,als);
  
end
endmodule
