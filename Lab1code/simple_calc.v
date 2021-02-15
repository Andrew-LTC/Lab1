`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2021 10:08:06 PM
// Design Name: 
// Module Name: simple_calc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module simple_calc(
    input [3:0] X,
    input [3:0] Y,
    input [1:0] op_sel,
    output [7:0] result,
    output c_out,
    output overflow
    );
    //Instantiate the 3 previous modules
    //create wires for mux inputs
    wire [3:0] mux_x;       //mux_x needs to be 3:0 so we can add another 4'b0 to make it 7:0
    wire [7:0] mux_y;

    adder_subtractor  AS0 (
        .x(X),
        .y(Y),
        .add_n(op_sel[0]),
        .s(mux_x),       
        .c_out(c_out),
        .overflow(overflow)
    );
    csa_multiplier M0 (
        .m(X),
        .q(Y),
        .p(mux_y)
    );
    mux_2x1_8bit S0(
        .x({4'b0,mux_x}),      //concenate to produce a 7:0 out of two 3:0's
        .y(mux_y),
        .s(op_sel[1]),
        .f(result)
    ); 
endmodule
