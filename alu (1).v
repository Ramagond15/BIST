module ALU_8bit (
  input wire [7:0] data_a,
  input wire [7:0] data_b,
  input wire [2:0] alu_op,
  output wire [7:0] alu_result
);
reg [7:0]alu_out;
always @(*) begin
  case (alu_op)
    3'b000: alu_out = data_a + data_b;
    3'b001: alu_out = data_a - data_b;
    3'b010: alu_out = data_a & data_b;
    3'b011: alu_out = data_a | data_b;
    3'b100: alu_out = data_a ^ data_b;
    default: alu_out= 8'b0; 
  endcase
 
end
assign alu_result = alu_out;
endmodule
