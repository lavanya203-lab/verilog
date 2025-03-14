`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2025 01:42:31 PM
// Design Name: 
// Module Name: rg_tb
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


module rg_tb;
    reg d, clk, c1, c2;
    wire d_bar, clk_bar, p1, q1, p2, q2, r2, p3, q, q_bar;
    
    rg uut(.d(d),
        .clk(clk),
        .c1(c1),
        .c2(c2),
        .d_bar(d_bar),
        .clk_bar(clk_bar),
        .p1(p1),
        .q1(q1),
        .p2(p2),
        .q2(q2),
        .r2(r2),
        .p3(p3),
        .q(q),
        .q_bar(q_bar));
        
        always #5 clk = ~clk;  // Toggle clock every 5 time units
initial begin
clk = 0; d = 0; c1 = 0; c2 = 0;
      #10 d = 0; c1 = 0; c2 = 1;
      #10 d = 0; c1 = 1; c2 = 0;
      #10 d = 1; c1 = 1; c2 = 0;
      #10 d = 0; c1 = 0; c2 = 1;
      #10 d = 1; c1 = 0; c2 = 1; 
      #10 d = 0; c1 = 1; c2 = 1;
      #10 d = 1; c1 = 1; c2 = 1;
      #10 $finish;
      end
      
      initial begin
      $monitor ("Time=%0t | d=%b, clk=%b, c1=%b, c2=%b -> d_bar=%b, clk_bar=%b, p1=%b, q1=%b, p2=%b, q2=%b, r2=%b, p3=%b, q=%b, q_bar=%b",
                 $time, d, clk, c1, c2, d_bar, clk_bar, p1, q1, p2, q2, r2, p3, q, q_bar);
                 end 
                 

endmodule
