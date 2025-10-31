
//MEALY OVERLAPPING 

module pattern_det(input clk,rst,in_bit,output reg p_det);
  localparam s0=3'b000,
  s1=3'b001,
  s2=3'b010,
  s3=3'b011,
  s4=3'b100;
  reg[2:0]p_state,n_state;
  always@(posedge clk or posedge rst)begin
    if(rst)
      p_state<=s0;
    else
      p_state<=n_state;
  end
  always@(*)begin
    p_det<=1'b0;
    case(p_state)
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
        if(in_bit)
          n_state<=s3;
        else
          n_state<=s0;
      end
      s3:begin
        if(in_bit)
          n_state<=s4;
        else
          n_state<=s2;
      end
      s4:begin
        if(in_bit)
          n_state<=s1;
        else begin
          n_state<=s2;
          p_det<=1;
        end
      end
        default:n_state<=s0;
        endcase
      end
endmodule



//MEALY NON-OVERLAPPING



module pattern_det(input clk,rst,in_bit,output reg p_det);
  localparam s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b100,s4=3'b101;
  reg [2:0]state,n_state;
  always@(posedge clk or posedge rst)begin
    if(rst)
      state<=s0;
    else
      state<=n_state;
  end
  always @(*)begin
    p_det<=0;
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
        if(in_bit)
          n_state<=s3;
        else
          n_state<=s0;
      end
      s3:begin
        if(in_bit)
          n_state<=s4;
        else
          n_state<=s2;
      end
      s4:begin
        if(in_bit)
          n_state<=s0;
        else
          n_state<=s0;
        p_det<=1'b1;
      end
      default:n_state<=s0;
    endcase
  end
endmodule
