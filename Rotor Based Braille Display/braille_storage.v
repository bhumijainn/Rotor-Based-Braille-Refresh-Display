module braille_storage (
    input [7:0] ascii_char,  // ASCII character input
    input clk,                // Clock signal
    input reset,              // Reset signal
    output reg [7:0] braille_data  // Corresponding Braille data
);
    // Define the 2D array to store Braille data (32 characters max)
    reg [7:0] storage_array [31:0];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Clear storage array on reset
            integer i;
            for (i = 0; i < 32; i = i + 1) begin
                storage_array[i] <= 8'b00000000; // Clear all data
            end
        end else begin
            // Store Braille data in the array (assuming ASCII value used as index)
            storage_array[ascii_char] <= braille_data;
        end
    end

    always @(*) begin
        braille_data = storage_array[ascii_char]; // Output the Braille data
    end
endmodule
