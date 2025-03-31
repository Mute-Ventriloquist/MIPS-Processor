`include "imux.v"

module imux_tb;
reg[31:0] pc_next, ijump, ibranch;
reg[1:0] sel;
wire[31:0] y;

imux m1(
    .pc_next(pc_next),
    .ijump(ijump),
    .ibranch(ibranch),
    .sel(sel),
    .y(y)
);

initial begin
    pc_next = 32'h1234_ABCD;  // Underscore BETWEEN digits
    ijump   = 32'hABCD_1234;
    ibranch = 32'hEF34_5678;
    sel     = 2'b00;          // No underscore for binary
    #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;
end

initial begin
    $monitor("Time  : %0t, pc_next : %h, ibranch : %h, ijump : %h, sel : %h, y : %h", $time, pc_next, ibranch, ijump, sel, y);
end

endmodule