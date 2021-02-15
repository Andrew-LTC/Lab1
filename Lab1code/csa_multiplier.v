`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2021 05:20:44 PM
// Design Name: 
// Module Name: csa_multiplier
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


module csa_multiplier(
    input [3:0] m,
    input [3:0] q,
    output [7:0] p
    );
    
    //inputs for initial row of FA's
    //x inputs
    wire [3:0] z0;
    mq_4bit MQ0 (
        .m(m),
        .q(q[0]),
        .mq(z0)   
    );
    
    //y inputs
    wire [3:0] z1;
    mq_4bit MQ1 (
        .m(m),
        .q(q[1]),
        .mq(z1)   
    );
    
    //carry inputs
    wire [3:0] z2;
    mq_4bit MQ2 (
        .m(m),
        .q(q[2]),
        .mq(z2)
    );
    
    //outputs for intial row of FA's
    //wires for first row of FA's sums
    wire [3:0] sum0;
    //wires for first row of FA's carry outputs
    wire [3:0] carry0;
    
    //LSB independent of FA's
    assign p[0] = z0[0];
    
    //first row of FA's
    full_adder FA0 (
        .x(z0[1]),
        .y(z1[0]),
        .c_in(1'b0),
        .s(sum0[0]),
        .c_out(carry0[0])
    );
    //P1 is computed after first row of FA's
    assign p[1] = sum0[0];
    
    full_adder FA1 (
        .x(z0[2]),
        .y(z1[1]),
        .c_in(z2[0]),
        .s(sum0[1]),
        .c_out(carry0[1])
    );  
    full_adder FA2 (
        .x(z0[3]),
        .y(z1[2]),
        .c_in(z2[1]),
        .s(sum0[2]),
        .c_out(carry0[2])
    );
    full_adder FA3 (
        .x(1'b0),
        .y(z1[3]),
        .c_in(z2[2]),
        .s(sum0[3]),
        .c_out(carry0[3])
    ); 
    //end of first row
    
    //inputs for second row of FA's
    //x inputs
    wire [3:0] z3;
    mq_4bit MQ3 (
        .m(m),
        .q(q[3]),
        .mq(z3)
    );
    
    //outputs for second row of FA's
    //wires for second row of FA's sums
    wire [3:0] sum1;
    //wires for second row of FA's carries outputs
    wire [3:0] carry1;
    
    //second row of FA's
    full_adder FA4 (
        .x(sum0[1]),
        .y(1'b0),
        .c_in(carry0[0]),
        .s(sum1[0]),
        .c_out(carry1[0])
    );
    //P2 is computed after second row of FA's
    assign p[2] = sum1[0];
     
    full_adder FA5 (
        .x(sum0[2]),
        .y(z3[0]),
        .c_in(carry0[1]),
        .s(sum1[1]),
        .c_out(carry1[1])
    );
    full_adder FA6 (
        .x(sum0[3]),
        .y(z3[1]),
        .c_in(carry0[2]),
        .s(sum1[2]),
        .c_out(carry1[2])
    );
    full_adder FA7 (
        .x(z2[3]),
        .y(z3[2]),
        .c_in(carry0[3]),
        .s(sum1[3]),
        .c_out(carry1[3])
    );
    //end of second row
    
    //wires for second row of FA sums
    wire [3:0] sum2;
    //wires for second row of FA carries
    wire [3:0] carry2;
    
    //final row of FA's
     full_adder FA8 (
        .x(sum1[1]),
        .y(carry1[0]),
        .c_in(1'b0),
        .s(sum2[0]),
        .c_out(carry2[0])
    );
    assign p[3] = sum2[0];
    
    full_adder FA9 (
        .x(sum1[2]),
        .y(carry1[1]),
        .c_in(carry2[0]),
        .s(sum2[1]),
        .c_out(carry2[1])
    );
    assign p[4] = sum2[1];
    
    full_adder FA10 (
        .x(sum1[3]),
        .y(carry1[2]),
        .c_in(carry2[1]),
        .s(sum2[2]),
        .c_out(carry2[2])
    );
    assign p[5] = sum2[2];
    
    full_adder FA11 (
        .x(z3[3]),
        .y(carry1[3]),
        .c_in(carry2[2]),
        .s(sum2[3]),
        .c_out(carry2[3])
    );
    assign p[6] = sum2[3];
    assign p[7] = carry2[3];
    //end of final row
endmodule
