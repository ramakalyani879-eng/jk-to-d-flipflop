// JK Flip-Flop to D Flip-Flop Conversion
//
// Conversion equations:
// J = D
// K = ~D
//
// D Flip-Flop:
// D = 0 -> Q(next) = 0
// D = 1 -> Q(next) = 1

module d_from_jk (
    input  wire clk,
    input  wire D,
    output reg Q,
    output wire Qbar
);

    wire J;
    wire K;

    // Conversion equations
    assign J = D;
    assign K = ~D;

    // Complementary output
    assign Qbar = ~Q;

    // JK Flip-Flop
    always @(posedge clk) begin
        case ({J, K})
            2'b00: Q <= Q;       // No Change
            2'b01: Q <= 1'b0;   // Reset
            2'b10: Q <= 1'b1;   // Set
            2'b11: Q <= ~Q;     // Toggle
        endcase
    end

endmodule