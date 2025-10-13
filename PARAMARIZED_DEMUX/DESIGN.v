module demux # (parameter N=4,parameter SN=$clog2(N)) (input din, input [SN-1:0]s,output reg [N-1:0]y);
  always @(*) begin
    y = {N{1'b0}}; //y=N times 0
    case (s)
      default: y[s] = din; //inserting the din based on the selection line
    endcase
  end
endmodule
