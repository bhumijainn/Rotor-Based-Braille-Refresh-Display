module braille_LUT(
    input [7:0] ascii_char,    // ASCII input character
    output reg [7:0] braille_data  // Corresponding 8-bit Braille code
);

    always @(*) begin
        case(ascii_char)
            // Uppercase Letters (A-Z)
            8'h41: braille_data = 8'b10000000; // A
            8'h42: braille_data = 8'b10100000; // B
            8'h43: braille_data = 8'b11000000; // C
            8'h44: braille_data = 8'b11010000; // D
            8'h45: braille_data = 8'b10010000; // E
            8'h46: braille_data = 8'b11100000; // F
            8'h47: braille_data = 8'b11110000; // G
            8'h48: braille_data = 8'b10110000; // H
            8'h49: braille_data = 8'b01100000; // I
            8'h4A: braille_data = 8'b01110000; // J
            8'h4B: braille_data = 8'b10001000; // K
            8'h4C: braille_data = 8'b10101000; // L
            8'h4D: braille_data = 8'b11001000; // M
            8'h4E: braille_data = 8'b11011000; // N
            8'h4F: braille_data = 8'b10011000; // O
            8'h50: braille_data = 8'b11101000; // P
            8'h51: braille_data = 8'b11111000; // Q
            8'h52: braille_data = 8'b10111000; // R
            8'h53: braille_data = 8'b01101000; // S
            8'h54: braille_data = 8'b01111000; // T
            8'h55: braille_data = 8'b10001100; // U
            8'h56: braille_data = 8'b10101100; // V
            8'h57: braille_data = 8'b01110100; // W
            8'h58: braille_data = 8'b11001100; // X
            8'h59: braille_data = 8'b11011100; // Y
            8'h5A: braille_data = 8'b10011100; // Z
            
            // Digits (1-9)
            8'h31: braille_data = 8'b10000000; // 1
            8'h32: braille_data = 8'b10100000; // 2
            8'h33: braille_data = 8'b11000000; // 3
            8'h34: braille_data = 8'b11010000; // 4
            8'h35: braille_data = 8'b10010000; // 5
            8'h36: braille_data = 8'b11100000; // 6
            8'h37: braille_data = 8'b11110000; // 7
            8'h38: braille_data = 8'b10110000; // 8
            8'h39: braille_data = 8'b01100000; // 9
            
            // Punctuation
            8'h2E: braille_data = 8'b00001000; // Period (.)
            8'h2C: braille_data = 8'b00000100; // Comma (,)
            8'h21: braille_data = 8'b01000100; // Exclamation mark (!)
            8'h3F: braille_data = 8'b01100100; // Question mark (?)
            8'h3A: braille_data = 8'b00101000; // Colon (:)
            8'h3B: braille_data = 8'b00100100; // Semicolon (;)
            8'h27: braille_data = 8'b00000110; // Apostrophe (')
            8'h22: braille_data = 8'b00010110; // Quotation mark (")
            8'h2D: braille_data = 8'b00101010; // Hyphen (-)
            
            default: braille_data = 8'b00000000; // Default (if unknown character)
        endcase
    end

endmodule
