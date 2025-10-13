module mx_tb;
  localparam N=4;
  localparam SN=$clog2(N);
  reg din;
  reg [SN-1:0]s;
  wire [N-1:0]y;
  integer i;
  demux #(.N(N)) m(.din(din),.s(s),.y(y));
  initial begin
    din=1'b1;#10;
    for(i=0;i<=N-1;i=i+1) begin
      s=i;
      #10;
      $display("s1=%b s0=s%b y=%b",s[1],s[0],y); //This will be adjusted based on input
    end
    $finish;
  end
endmodule
