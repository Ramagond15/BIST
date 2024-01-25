module Toggle_or_Hold (
  input wire alu_output_equal_ref_model, // Signal indicating ALU output equal to Reference Model output
  input wire lfsr_current_equal_next,   // Signal indicating the current and next pattern of the LFSR are equal
  output wire send_next_pattern          // Signal to send the next pattern to ALU and Reference Model
);

assign send_next_pattern = (alu_output_equal_ref_model && !lfsr_current_equal_next);

endmodule
