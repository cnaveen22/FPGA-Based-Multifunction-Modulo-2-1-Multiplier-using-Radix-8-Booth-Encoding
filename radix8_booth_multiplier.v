module radix8_booth_multiplier #(parameter N = 8)(
    input  signed [N-1:0] multiplicand,
    input  signed [N-1:0] multiplier,
    output signed [2*N-1:0] product
);

    // Number of groups = ceil(N / 3)
    localparam G = (N + 2) / 3;

    wire signed [2*N+2:0] partial_products [0:G-1];
    //wire [N:0] y_ext = {multiplier[N-1], multiplier, 1'b0}; // Extended multiplier
	 wire [N+1:0] y_ext = {multiplier[N-1], multiplier, 1'b0};

	 genvar i;
    generate
        for (i = 0; i < G; i = i + 1) begin : booth_block
            wire [3:0] y_segment = y_ext[3*i +: 4];
            reg signed [2*N+2:0] booth_out;
 always @(*) begin
                case (y_segment)
                    4'b0000, 4'b1111: booth_out = 0;
                    4'b0001, 4'b0010: booth_out = multiplicand;
                    4'b0011, 4'b0100: booth_out = multiplicand <<< 1;
                    4'b0101, 4'b0110: booth_out = multiplicand + (multiplicand <<< 1); // +3X
                    4'b0111:          booth_out = multiplicand <<< 2; // +4X
						   4'b1000:          booth_out = -(multiplicand <<< 2); // -4X
                    4'b1001, 4'b1010: booth_out = -(multiplicand + (multiplicand <<< 1)); // -3X
                    4'b1011, 4'b1100: booth_out = -(multiplicand <<< 1); // -2X
                    4'b1101, 4'b1110: booth_out = -multiplicand;
                    default:          booth_out = 0;
                endcase
            end
				assign partial_products[i] = booth_out <<< (3*i); // shift left
        end
    endgenerate

    // Summing all partial products
    reg signed [2*N-1:0] final_sum;
    integer k;
    always @(*) begin
        final_sum = 0;
        for (k = 0; k < G; k = k + 1)
            final_sum = final_sum + partial_products[k][2*N-1:0]; // trim excess bits
    end

    assign product = final_sum;

endmodule
