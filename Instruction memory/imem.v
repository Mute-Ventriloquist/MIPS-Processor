// 4kb => 1024 words => 10 bit addresses

module imem(addr, clk, reset, instr);

  parameter memory_size_bytes = 4096;
  parameter memory_size_words = memory_size_bytes / 4;
  parameter address_width = $clog2(memory_size_words);

  input [address_width-1:0] addr;
  input clk, reset;
  output reg [31:0] instr;
  reg [31:0] mem [memory_size_words-1:0];

initial begin
    $readmemh("instructions.hex", mem);
    #10; // Wait for initialization to complete
    $display("mem[0] = %h", mem[0]);
    $display("mem[4] = %h", mem[4]);
end

  always @(posedge clk) begin
    if (reset) begin
      instr <= 32'h00000000; // Reset instruction to NOP (or any default)
    end else begin
      instr <= mem[addr];
    end
  end

endmodule