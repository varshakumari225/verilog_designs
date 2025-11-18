module piso #(parameter width=4)(
input wire[width-1:0]data_i,
input wire valid_in,
input wire ready_in,
input wire clk_rx_in,
input wire rst,
input wire clk_tx_in,
output reg data_o,
output reg valid_out,
output reg ready_out
);
  
  //creating memory to store the data
  
  reg [width-1:0]temp;
  reg [$clog2(width):0]count;
  reg shift;
  
  //data in the memory
  
  initial begin
    $monitor("memory data %b %b %b %b",temp[0],temp[1],temp[2],temp[3]);
  end
 
  //WRITE OPERATION
  
  always @(posedge clk_rx_in or posedge rst)begin
    if(rst)begin
      temp<=0;
      ready_out<=0;
      shift<=0;
    end
    else begin 
      if(valid_in && ready_in)begin
        temp<=data_i;
        shift<=1'b1;
        count<=width;
        ready_out<=1'b1;
      end
      else ready_out<=1'b0;
    end
  end
  
  //READ OPERATION
  
  always @(posedge clk_tx_in or negedge clk_tx_in)begin
    if(rst)begin
      valid_out<=1'b0;
      data_o<='b0;
      count<='b0;
      shift<=1'b0;
    end
      else if(shift && count>0)begin
        data_o<=temp[width-1];//READING FROM MSB
          temp<=temp<<1;
          valid_out<=1'b1;
        count<=count-1;
       if(count==1)
        shift<=1'b0;
       else 
    	valid_out<=1'b0;
      end
  end

endmodule
        
        
