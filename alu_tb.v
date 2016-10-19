// alu_tb.v, a module to instantiate an ALU that performs various 8-bit operations, and tests the accuracy of the operations
//
// Developed by Wesley Chavez & Antonio Guzman
// 5/14/16
//
// Inputs:
// clk: 200 MHz clock input

module alu_tb(input clk);

//Declare input and output variables for the ALU
reg [7:0] a, b;
wire [7:0] y;
reg [4:0] sel;
reg carry_in;

//Instantiate the alu
alu ALU(
.clk(clk),
.sel(sel),
.a(a),
.b(b),
.carry_in(carry_in),
.y(y) );

initial begin

//test values for a and b (ALU operands)
a = 8'b11110000;
b = 8'b00111100;
sel = 5'b00000;  //Transfer a
#50
sel = 5'b00001;  //a + b + carry_in
#50
sel = 5'b00010;  //a + b
#50
sel = 5'b00011;  //Transfer b
#50
sel = 5'b00100;  //a and b
#50
sel = 5'b00101;  //a or b
#50
sel = 5'b00110;  //a xor b
#50
sel = 5'b00111;  //bitwise-not a
#50
sel = 5'b01000;  //shift a left by 1
#50
sel = 5'b10000;  //shift a right by 1
#50
sel = 5'b11000;  //output 8-bit zero
end
endmodule
