module Compressor_Logic (
  input wire lfsr_current_equal_next, // Signal indicating the current and next pattern of the LFSR are equal
  output wire send_next_pattern      // Signal to send the next pattern to ALU and Reference Model
);

assign send_next_pattern = !lfsr_current_equal_next;

endmodule
