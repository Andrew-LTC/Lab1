`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2021 11:19:28 PM
// Design Name: 
// Module Name: mq_4bit_tb
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


module mq_4bit_tb(

    );
    reg [3:0] m;
    reg q;
    wire [3:0] mq;
    
    mq_4bit uut (
    .m(m),
    .q(q),
    .mq(mq)
    );
    
    initial
    begin
        #40 $finish;
    end
    
    initial
    begin
        m = 4'b0110;
        q = 1'b1;
        
        #10
        m = 4'b1010;
        
        #10
        q = 1'b0;
    end
    
endmodule
