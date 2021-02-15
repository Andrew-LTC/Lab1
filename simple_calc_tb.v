`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 09:58:33 PM
// Design Name: 
// Module Name: simple_calc_tb
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


module simple_calc_tb(

    );
    reg [3:0] X;
    reg [3:0] Y;
    reg [1:0] op_sel;
    wire [7:0] result;
    wire c_out;
    wire overflow;
    
    simple_calc uut (
        .X(X),
        .Y(Y),
        .op_sel(op_sel),
        .result(result),
        .c_out(c_out),
        .overflow(overflow)
    );
    
    initial
    begin
        #120 $finish;
    end
    
    initial
    begin        
        //addition
        X = 4'd6;        
        Y = 4'd0;        
        op_sel = 2'b00;
        
        #10
        X = 4'd6;        
        Y = 4'd3;        
        op_sel = 2'b00;
        
        #10
        X = 4'd10;        
        Y = 4'd15;         
        op_sel = 2'b00;
        
        #10
        X = 4'd14;        
        Y = 4'd10;         
        op_sel = 2'b00;
        
        //subtraction
        #10
        X = 4'd6;        
        Y = 4'd0;        
        op_sel = 2'b01;
        
        #10
        X = 4'd6;        
        Y = 4'd3;        
        op_sel = 2'b01;
        
        #10
        X = 4'd14;        
        Y = 4'd10;         
        op_sel = 2'b01;
        
        //multiplication matching orignial csa_multiplier tb
        #10
        X = 4'd0;           
        Y = 4'd10;        
        op_sel = 2'b10;
        
        #10
        X = 4'd5;        
        Y = 4'd5;        
        op_sel = 2'b11;
        
        #10
        X = 4'd9;        
        Y = 4'd5;        
        op_sel = 2'b10;
        
        #10
        X = 4'd12;        
        Y = 4'd13;        
        op_sel = 2'b11;
        
        #10
        X = 4'd15;        
        Y = 4'd10;        
        op_sel = 2'b10;
    end
endmodule
