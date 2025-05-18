module modulo_reduction #(parameter N = 8)(
    input  signed [2*N-1:0] value_in,
    input  [1:0] mod_sel, // 00: no mod, 01: 2^N-1, 10: 2^N+1
    output reg signed [2*N-1:0] result
);

    wire [N:0] base_minus1 = (1 << N) - 1;
    wire [N:0] base_plus1  = (1 << N) + 1;

    function [N-1:0] mod_positive;
        input signed [2*N-1:0] val;
        input [N:0] modulus;
        reg signed [N:0] temp;
        begin
            temp = val % modulus;
            if (temp < 0)
                temp = temp + modulus;
            mod_positive = temp[N-1:0];
        end
    endfunction

    always @(*) begin
        case (mod_sel)
            2'b00: result = value_in;
            2'b01: result = $signed(mod_positive(value_in, base_minus1));
            2'b10: result = $signed(mod_positive(value_in, base_plus1));
            default: result = value_in;
        endcase
    end

endmodule
