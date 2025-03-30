// Code for a sequential full adder circuit

module full_adder_s (a, b, cin, clk, sum, cout);
input a, b, cin, clk;
output reg cout, sum;
always @(posedge clk) begin
    sum = a ^ b ^ cin;
    cout = (a & b) | (b & cin) | (a & cin);
end
endmodule