// imem_tb.v -- Testbench for imem module

`include "imem.v"

module imem_tb;

  // Parameters
  parameter memory_size_bytes = 4096;
  parameter memory_size_words = memory_size_bytes / 4;
  parameter address_width = $clog2(memory_size_words);

  // Inputs
  reg clk;
  reg [address_width-1:0] addr;
  reg reset;

  // Outputs
  wire [31:0] instr;

  // Instantiate the imem module
  imem uut (
  .clk(clk),     // Corrected: .clk(clk)
  .addr(addr),   // Corrected: .addr(addr)
  .reset(reset), // Corrected: .reset(reset)
  .instr(instr)  // Corrected: .instr(instr)
    );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Period of 10 time units
  end

  // Test sequence
  initial begin
    reset = 1;
    addr = 0;
    #10;
    reset = 0;
    #10;
    addr = 0; #10;
    addr = 1; #10;
    addr = 2; #10;
    addr = 3; #10;
    addr = 4; #10;
    addr = 5; #10;
    addr = 6; #10;
    addr = 7; #10;
    reset = 1; #10;
    reset = 0; #10;
    $finish;
  end

  // Monitor the outputs
  initial begin
    $monitor("Time=%0t, addr=%h, reset=%b, instr=%h", $time, addr, reset, instr);
  end

endmodule