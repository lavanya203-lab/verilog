`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2025 01:31:11 PM
// Design Name: 
// Module Name: rg
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


module rg(
    input d,
    input clk,
    input c1,
    input c2,
    output d_bar,
    output clk_bar,
    output p1,
    output q1,
    output p2,
    output q2,
    output r2,
    output p3,
    output q,
    output q_bar
    );
    
    //feynman gate
    assign p1=d;
    assign q1=d;
    
    //fredkin gate-1
    assign p2=clk;
    assign q2= (clk_bar & d) | (clk & d);
    assign r2= (clk & d) | (clk_bar & d);
    
    //fredkin gate-2
    assign p3= (clk & d)| (clk_bar & d);
    assign q = (c1 & d_bar) | (c2 & d);
    assign q_bar = (c1 & d) | (c2 & d_bar);
    
endmodule
