module encoder(input [3:0]i,output reg [1:0]y);
 // or(y[0],i[1],i[3]);
  //or(y[1],i[2],i[3]);
  always @(*) begin
    case(i)
      4'b0001:y=2'b00;
      4'b0010:y=2'b01;
      4'b0100:y=2'b10;
      4'b1000:y=2'b11;
      default :y=2'bxx;
    endcase
  end
endmodule
