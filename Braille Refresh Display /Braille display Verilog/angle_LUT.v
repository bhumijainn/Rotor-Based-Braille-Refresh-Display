module angle_LUT(
    input [7:0] current_state, // Current state of the rotor
    input [7:0] next_state,    // Next state of the rotor
    output reg [7:0] angle     // Angle to rotate the rotor
);
    always @(*) begin
        case({current_state, next_state})
            16'b1100000000000000: angle = 8'b11110111; // -90 degrees
            16'b1100000100000000: angle = 8'b11110110; // -45 degrees
            16'b1100001000000000: angle = 8'b11110101; // +45 degrees
            16'b1100001100000000: angle = 8'b11110100; // 0 degrees
            // Add more cases based on your application
            default: angle = 8'b00000000; // Default angle (no rotation)
        endcase
    end
endmodule
