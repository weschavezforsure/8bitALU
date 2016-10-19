// alu.v, a module to perform various 8-bit operations
//
// Developed by Wesley Chavez & Antonio Guzman
// 5/14/16
//
// Inputs:
// clk: 200 MHz clock input
// sel: 5-bit operation selector
// a: First 8-bit operand
// b: Second 8-bit operand
// carry_in: 1-bit carry-in signal
//
// Outputs:
// y: 8-bit result of operation


module alu (
input clk,
input [4:0] sel,
input [7:0] a,
input [7:0] b,
input carry_in,
output reg [7:0] y

);
 reg [7:0] ad, bd;  //Registers to capture input operands as soon as they arrive into the module
 reg [4:0] seld;    //Register to capture input operation selector as soon as they arrive into the module
 reg carry_ind;     //Same with carry_in

//8-bit wires that capture results of operations.  Remember, we're going for speed, not size
wire [7:0] transfera, addwithcarry, addnocarry, transferb, aandb, aorb, axorb, abar, shla, shra, zeros;

//Assign statements for aforementioned wires
assign transfera = ad;
assign addwithcarry = ad+bd+carry_ind;
assign addnocarry = ad+bd;
assign transferb = bd;
assign aandb = ad&bd;
assign aorb = ad|bd;
assign axorb = ad^bd;
assign abar = ~ad;
assign shla = ad << 1;
assign shra = ad >> 1;
assign zeros = 8'b00000000;

always @ (posedge clk) begin //At the rising edge of the clock

    //Store inputs into input ffs
    ad <= a;
    bd <= b;
    carry_ind <= carry_in;
    seld <= sel;
    
    //Based on sel, which operation to send to output register y
    case (sel)
    5'b00000 : y <= transfera;   
    5'b00001 : y <= addwithcarry;
    5'b00010 : y <= addnocarry;
    5'b00011 : y <= transferb;
    5'b00100 : y <= aandb;
    5'b00101 : y <= aorb;
    5'b00110 : y <= axorb;
    5'b00111 : y <= abar;
    5'b01000 : y <= shla;
    5'b10000 : y <= shra;
    5'b11000 : y <= zeros;
    default  : y <= y;
    endcase
    end
endmodule
