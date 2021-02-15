`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2021 10:04:54 PM
// Design Name: 
// Module Name: mux_2x1_8bit
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


module mux_2x1_8bit(
    input [7:0] x,
    input [7:0] y,
    input s,
    output [7:0] f
    );
    
    //need 8 instances of simple mux for 8bit inputs and outputs
    mux_2x1_simple H0(
        .x(x[0]),
        .y(y[0]),
        .s(s),
        .f(f[0])
    );
    mux_2x1_simple H1(
        .x(x[1]),
        .y(y[1]),
        .s(s),
        .f(f[1])
    );
    mux_2x1_simple H2(
        .x(x[2]),
        .y(y[2]),
        .s(s),
        .f(f[2])
    );
    mux_2x1_simple H3(
        .x(x[3]),
        .y(y[3]),
        .s(s),
        .f(f[3])
    );
    mux_2x1_simple H4(
        .x(x[4]),
        .y(y[4]),
        .s(s),
        .f(f[4])
    );
    mux_2x1_simple H5(
        .x(x[5]),
        .y(y[5]),
        .s(s),
        .f(f[5])
    );
    mux_2x1_simple H6(
        .x(x[6]),
        .y(y[6]),
        .s(s),
        .f(f[6])
    );
    mux_2x1_simple H7(
        .x(x[7]),
        .y(y[7]),
        .s(s),
        .f(f[7])
    );
    
endmodule
