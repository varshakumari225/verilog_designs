module full_adder #(parameter N = 4) (   // Default: 4-bit
    input  [N-1:0] a, b,
    input           cin,
    output [N-1:0] s,
    output          cout
);

    assign {cout, s} = a + b + cin;  // Concatenation for sum & carry

endmodule
