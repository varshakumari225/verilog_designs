module sipo #(parameter WIDTH=4)(
    input  wire data_in,
    input  wire valid_in,
    input  wire ready_in,
    input  wire clk_rx_in,
    input  wire rst,
    input  wire clk_tx_in,
    output reg [WIDTH-1:0] data_out,
    output reg valid_out,
    output reg ready_out
);

    reg [WIDTH-1:0] shift_reg;
    reg [$clog2(WIDTH):0] count;
    reg full_flag;

    // Receive serial data
  
    always @(posedge clk_rx_in or posedge rst) begin
        if(rst) begin
            shift_reg <= 0;
            count <= 0;
            ready_out <= 1;
            full_flag <= 0;
        end else if(valid_in && ready_in && ready_out) begin
            shift_reg <= {shift_reg[WIDTH-2:0], data_in};
            count <= count + 1;
            if(count == WIDTH) begin
                ready_out <= 0;
                full_flag <= 1;
            end
        end
    end

    // Output parallel data
  
    always @(posedge clk_tx_in or posedge rst) begin
        if(rst) begin
            data_out <= 0;
            valid_out <= 0;
            count <= 0;
        end else if(full_flag) begin
            data_out <= shift_reg;
            valid_out <= 1;
            full_flag <= 0;
            ready_out <= 1;
            count <= 0;
        end else begin
            valid_out <= 0;
        end
    end

endmodule
