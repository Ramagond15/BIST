module Testbench;

  reg clk;
  reg rst;
  wire [7:0] alu_output;
  wire alu_output_equal_ref_model;
  wire lfsr_current_equal_next;

  // Instantiate the top module
  Topmodule top (
    .clk(clk),
    .rst(rst),
    .alu_output(alu_output),
    .alu_output_equal_ref_model(alu_output_equal_ref_model),
    .lfsr_current_equal_next(lfsr_current_equal_next)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Reset initialization
  initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0; 
    #1000 $finish;
  end
//always@(posedge clk)begin
//$display("lfsr_output=%0b",lfsr_output);
//end
  // Display results
  initial begin

$monitor("Time=%0t | ALU Output=%b | lfsr_outputALU Output Equals Ref Model=%b", $time, alu_output, alu_output_equal_ref_model);
  end

endmodule
