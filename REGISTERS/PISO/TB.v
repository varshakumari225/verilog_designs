module piso_tb;

  localparam width = 4;

  reg [width-1:0] data_i;
  reg valid_in;
  reg ready_in;
  reg clk_rx_in;
  reg rst;
  reg clk_tx_in;
  wire data_o;
  wire valid_out;
  wire ready_out;

  // Instantiate the PISO module
  piso #(width) dut (
    .data_i(data_i),
    .valid_in(valid_in),
    .ready_in(ready_in),
    .clk_rx_in(clk_rx_in),
    .rst(rst),
    .clk_tx_in(clk_tx_in),
    .data_o(data_o),
    .valid_out(valid_out),
    .ready_out(ready_out)
  );

  // Clock generation
  
  initial clk_rx_in = 0;
  always #10 clk_rx_in = ~clk_rx_in;

  initial clk_tx_in = 0;
  always #5 clk_tx_in = ~clk_tx_in;

  // RX Monitor
  reg [width-1:0] rx_captured_data;
  always @(posedge clk_rx_in) begin
    if (valid_in && ready_in) begin
      rx_captured_data <= data_i;
      $display("[RX MONITOR] parallel data=%b at %0t", data_i, $time);
    end
  end

  // TX Monitor
  reg [width-1:0] tx_shift;
  integer count_t;

  initial begin
    tx_shift = 0;
    count_t = 0;
  end

  always @(posedge clk_tx_in) begin
    if (valid_out) begin
      tx_shift <= {tx_shift[width-2:0], data_o};
      count_t <= count_t + 1;
      $display("[TX MONITOR] bit=%b shift_reg=%b time=%0t",
                data_o, tx_shift, $time);
    end
  end

  // Checker: Compare TX with RX
  always @(posedge clk_tx_in) begin
    if (count_t == width) begin
      if (tx_shift == rx_captured_data)
        $display("CHECK PASSED: TX=%b RX=%b", tx_shift, rx_captured_data);
      else
        $display("CHECK FAILED: TX=%b RX=%b", tx_shift, rx_captured_data);

      // Reset for next word
      count_t <= 0;
      tx_shift <= 0;
    end
  end

  // Stimulus
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    // Reset
    rst = 1; valid_in = 0; ready_in = 0;
    #20 rst = 0;

    // Send data
    data_i = 4'b1011;
    valid_in = 1;
    ready_in = 1;

    @(posedge clk_rx_in);
    valid_in = 0;
    ready_in = 0;

    // Wait for all bits to be transmitted
    repeat(10) @(posedge clk_tx_in);

    #80 $finish;
  end

endmodule
