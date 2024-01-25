module Topmodule (
  input  clk,
  input  rst,
  output wire [7:0] alu_output,
  output wire alu_output_equal_ref_model,
  output wire lfsr_current_equal_next
);

wire [7:0] lfsr_output;
wire [7:0] alu_operand_a;
wire [7:0] alu_operand_b;
wire [7:0] ref_model_output;
wire send_next_pattern_toggle;
wire send_next_pattern_compressor;

LFSR_8bit lfsr (
  .clk(clk),
  .rst(rst),
  .lfsr_output(lfsr_output)
);

assign alu_operand_a = lfsr_output;
assign alu_operand_b = {8'b0, 8'b1}; 
ALU_8bit alu (
  .data_a(alu_operand_a),
  .data_b(alu_operand_b),
  .alu_op(3'b000), 
  .alu_result(alu_output)
);

Reference_Model ref_model (
  .input_data_a(alu_operand_a),
  .input_data_b(alu_operand_b),
  .operation(3'b000), 
  .output_data(ref_model_output)
);

Toggle_or_Hold toggle_or_hold (
  .alu_output_equal_ref_model(alu_output == ref_model_output),
  .lfsr_current_equal_next(lfsr_output == lfsr_output), 
  .send_next_pattern(send_next_pattern_toggle)
);

Compressor_Logic compressor (
  .lfsr_current_equal_next(lfsr_output == lfsr_output),
  .send_next_pattern(send_next_pattern_compressor)
);

assign alu_output_equal_ref_model = (alu_output == ref_model_output);
assign lfsr_current_equal_next = (lfsr_output == lfsr_output); 
endmodule
