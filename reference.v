module Reference_Model (
  input wire [7:0] input_data_a,
  input wire [7:0] input_data_b,
  input wire [2:0] operation,
  output wire [7:0] output_data
);
reg [7:0]ref_out;
always @(*) begin
  case (operation)
    3'b000:ref_out  = input_data_a + input_data_b;
    3'b001:ref_out = input_data_a - input_data_b;
    3'b010:ref_out= input_data_a & input_data_b;
    3'b011:ref_out = input_data_a | input_data_b;
    3'b100:ref_out= input_data_a ^ input_data_b;
    default:ref_out = 8'b0; // Handle other cases as needed
  endcase
end
assign output_data = ref_out;
endmodule
