
//MOORE OVERLAPPING

module seq_det(input clk,rst,in_bit,output reg p_det);
  localparam s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b100;
  reg [2:0]state,n_state;
  always@(posedge clk or negedge clk or posedge rst)begin
    if(rst)
      state<=s0;
    else
      state<=n_state;
  end
  always @(*) begin
    p_det<=1'b0;
    case(state)
      s0:begin
        if(in_bit)
          n_state<=s1;
        else
          n_state<=s0;
      end
      s1:begin
        if(in_bit)
          n_state<=s1;
        else
          n_state<=s2;
      end
      s2:begin
        if(in_bit)begin
          n_state<=s3;
          p_det<=1;
        end
        else
          n_state<=s0;
      end
      s3:begin
        if(in_bit)
          n_state<=s1;
        else
          n_state<=s2;
      end
      default:n_state<=s0;
    endcase
  end
endmodule




//MOORE NON OVERLAPPING



module seq_det(input clk,rst,in_bit,output reg p_det);
  localparam s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b100;
  reg [2:0]state,n_state;
  always@(posedge clk or posedge rst)begin
    if(rst)
      state<=s0;
    else
      state<=n_state;
  end
  always @(*) begin
    p_det<=1'b0;
    case(state)
      s0:begin
        if(in_bit)
          n_state<=s1;
        else
          n_state<=s0;
      end
      s1:begin
        if(in_bit)
          n_state<=s1;
        else
          n_state<=s2;
      end
      s2:begin
        if(in_bit)begin
          n_state<=s3;
          p_det<=1;
        end
        else
          n_state<=s0;
      end
      s3:begin
        if(in_bit)
          n_state<=s1;
        else
          n_state<=s0;
      end
      default:n_state<=s0;
    endcase
  end
endmodule
