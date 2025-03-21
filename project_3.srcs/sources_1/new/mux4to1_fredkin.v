`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 06:13:02 PM
// Design Name: 
// Module Name: mux4to1_fredkin
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
/*

module mux4to1_fredkin(
 input [1:0]s,  //2-bit select input MUX SELECT
    input i0,
    input i1,
    input i2,
    input i3,
    output reg y    //mux output
    );
    
    wire p1,q1,r1;
    wire p2,q2,r2;
    wire p3,q3,r3;
    
    //first stage Select between D0-D1 and D2-D3 using S0
    fredkin_gate fg1 (.a(s[0]), .b(i0), .c(i1), .p(p1), .q(q1), .r(r1));
    fredkin_gate fg2 (.a(s[0]), .b(i2), .c(i3), .p(p2), .q(q2), .r(r2));
    
     // Second stage: Select between outputs of previous stage using S1
    fredkin_gate fg3 (.a(s[1]), .b(q1), .c(q2), .p(p3), .q(q3), .r(r3));
    
    //assign y <= q3;
    
    always @(*) begin
    case (s)
        2'b00: y <= i0;
        2'b01: y <= i1;
        2'b10: y <= i2;
        2'b11: y <= i3;
        default: y <= 1'b0; // Ensure y is not undefined
    endcase
end
//endmodule
    */
 
module mux4to1_fredkin(
    input [1:0] s,
    input i0, i1, i2, i3,
    output y
);
    wire stage1_out0, stage1_out1;
    
    // First stage: s[0] selects between input pairs
    fredkin_gate fg1(.a(s[0]), .b(i0), .c(i1), .q(stage1_out0));
    fredkin_gate fg2(.a(s[0]), .b(i2), .c(i3), .q(stage1_out1));
    
    // Second stage: s[1] selects final output
    fredkin_gate fg3(.a(s[1]), .b(stage1_out0), .c(stage1_out1), .q(y));
endmodule







