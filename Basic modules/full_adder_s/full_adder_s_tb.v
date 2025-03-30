`include "full_adder_s.v"
`timescale 1ns/1ps

module full_adder_s_tb;
    reg a, b, cin, clk;
    wire cout, sum;

    // Instantiate the full adder
    full_adder_s add1(a, b, cin, clk, sum, cout);

    // Clock generation: 10ns period (5ns high, 5ns low)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus and VCD generation
    initial begin
        // Create VCD file for waveform output
        $dumpfile("full_adder_s.vcd");
        $dumpvars(0, full_adder_s_tb);

        $display("starting tests....");
        // Apply test vectors
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        $display("midway....");
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;
        $display("tests done....");
        // End simulation
        $finish;
    end

endmodule
