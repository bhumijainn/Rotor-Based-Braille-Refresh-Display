module top_module (
    input [7:0] ascii_input,  // ASCII input from USB or Bluetooth
    input clk,                // Clock signal
    input reset,              // Reset signal
    input usb_bluetooth_select, // Selector for USB/Bluetooth input
    output reg [7:0] braille_data, // Output Braille data
    output [31:0] motor_outputs  // 32 motor outputs (for motor control)
);

    wire [7:0] braille_LUT_output; // Braille output from the LUT
    wire [7:0] angle_data;         // Angle data for motor control
    
    // Braille LUT: Convert ASCII to Braille
    braille_LUT braille_LUT_inst (
        .ascii_char(ascii_input),
        .braille_data(braille_LUT_output)
    );
    
    // Storage array to keep ASCII data for up to 32 characters
    braille_storage braille_storage_inst (
        .ascii_char(ascii_input),
        .clk(clk),
        .reset(reset),
        .braille_data(braille_LUT_output)
    );
    
    // Angle LUT for rotor positioning based on stored ASCII/Braille data
    angle_LUT angle_LUT_inst (
        .current_state(braille_LUT_output),
        .next_state(braille_LUT_output),  // Simplified assumption
        .angle(angle_data)
    );
    
    // Motor control: Convert angle data to motor signals
    motor_driver motor_driver_inst (
        .angle_data(angle_data),
        .clk(clk),
        .reset(reset),
        .motor_outputs(motor_outputs)
    );

    // Assign Braille data output
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            braille_data <= 8'b0;
        end else begin
            braille_data <= braille_LUT_output;
        end
    end

endmodule
