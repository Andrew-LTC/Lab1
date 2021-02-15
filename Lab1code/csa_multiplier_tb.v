`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2021 09:29:51 PM
// Design Name: 
// Module Name: csa_multiplier_tb
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


module csa_multiplier_tb(

    );
    reg [3:0] m;
    reg [3:0] q;
    wire [7:0] p;
    
    csa_multiplier uut (
        .m(m),
        .q(q),
        .p(p)
    );
    
    initial
    begin
        #50 $finish;
    end
    
    initial
    begin
        m = 'd0;
        q = 'd10;
        
        #10
        m = 'd5;
        q = 'd5;
        
        #10
        m = 'd9;
        q = 'd5;
        
        #10
        m = 'd12;
        q = 'd13;
        
        #10
        m = 'd15;
        q = 'd10;
    end
        
endmodule
