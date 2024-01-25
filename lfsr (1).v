module LFSR_8bit (
  input wire clk,
  input wire rst,
  output wire [7:0]lfsr_output
);

reg [7:0]lfsr_reg;

always @(posedge clk or posedge rst) begin
  if (rst) begin
    lfsr_reg <= 8'b1; // Initial seed value (you can change this)
  end else begin
    lfsr_reg <= {lfsr_reg[6:0], lfsr_reg[7] ^ lfsr_reg[2]}; // XOR taps for an 8-bit LFSR
  end
end

assign lfsr_output = lfsr_reg;

endmodule
