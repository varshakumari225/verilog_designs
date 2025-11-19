`timescale 1ns/1ps
module sipo_tb;
    localparam WIDTH = 4;
    reg data_in;
    reg valid_in;
    reg ready_in;
    reg clk_rx_in;
    reg clk_tx_in;
    reg rst;
    wire [WIDTH-1:0] data_out;
    wire valid_out;
    wire ready_out;

  //module instantiation
  
    sipo #(WIDTH) dut (
        .data_in(data_in),
        .valid_in(valid_in),
        .ready_in(ready_in),
        .clk_rx_in(clk_rx_in),
        .rst(rst),
        .clk_tx_in(clk_tx_in),
        .data_out(data_out),
        .valid_out(valid_out),
        .ready_out(ready_out)
    );

    // Clock generation
  
    initial clk_rx_in = 0;
    always #20 clk_rx_in = ~clk_rx_in;

    initial clk_tx_in = 0;
    always #5 clk_tx_in = ~clk_tx_in;
  
     // Checker
  
  reg [WIDTH-1:0]expected=4'b1011;
    always @(posedge clk_tx_in) begin
      if(valid_out)begin
      	if(data_out==expected)
        	$display(" check passed Received parallel: %b", data_out);
      	else
       	 $display(" check failed Received parallel: %b", data_out);  
    	end
    end

    // Stimulus
  
    initial begin
        $dumpfile("sipo.vcd");
        $dumpvars(0, sipo_tb);

        rst = 1; valid_in = 0; ready_in = 1; data_in = 0;
        #50 rst = 0;

        // Send serial word: 1011
        valid_in = 1;
        ready_in = 1;
        @(posedge clk_rx_in); data_in = 1;
        @(posedge clk_rx_in); data_in = 0;
        @(posedge clk_rx_in); data_in = 1;
        @(posedge clk_rx_in); data_in = 1;
      @(posedge clk_rx_in) valid_in = 0;

        repeat(10) @(posedge clk_tx_in);
      #80; 
      $finish;
    end
endmodule
