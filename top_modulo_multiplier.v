module top_modulo_multiplier #(parameter N = 8)(
    input  clk,
    input  rst,
    input  start,
    input  signed [N-1:0] A,
    input  signed [N-1:0] B,
    input  signed [1:0] mod_sel,               // <-- Add this!
    output signed [2*N-1:0] P,
    output done
);
wire signed [2*N-1:0] product_booth;
    //wire [N-1:0] mod_result;
wire signed [2*N-1:0] mod_result;
    // Instantiate radix8_booth_multiplier (combinational)
    radix8_booth_multiplier #(N) booth_inst (
        .multiplicand(A),
        .multiplier(B),
        .product(product_booth)
    );
	 // Instantiate modulo_reduction
    modulo_reduction #(N) mod_reduction_inst (
        .value_in(product_booth),
        .mod_sel(mod_sel),
        .result(mod_result)
    );
	 assign P = mod_result;

    // done signal just indicates completion of combinational logic (can use start or ~rst)
    assign done = start; // Simplified assumption for testbench

endmodule
