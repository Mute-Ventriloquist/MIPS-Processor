// mux that selects between three 32b values 

module imux (pc_next, ibranch, ijump, clk, sel, y); // y is the output
input clk;
input [31:0] pc_next, ibranch, ijump;
input [1:0] sel;
output [31:0] y;

assign y = (sel == 2'b00) ? pc_next :
           (sel == 2'b01) ? ibranch :
           (sel == 2'b10) ? ijump :
           pc_next;  // Fallback for invalid sel
endmodule