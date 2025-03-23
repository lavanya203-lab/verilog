`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 03:32:10 PM
// Design Name: 
// Module Name: universal_shift_reg
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
module universal_shift_reg_dff(
    input clk,
    input clear,
    input [1:0] mode,
    input sin_right,
    input sin_left,
    input [3:0] d_in,
    output reg [3:0] q_out
    );
    
    // Internal registers for flip-flop outputs
    reg [3:0] d;
   // reg [3:0] d_out;  
    // Internal data storage
    wire [1:0] mux_select;
    wire mux_out;
    
    assign mux_select = mode;
    
    mux4to1_fredkin mux_inst (.s(mode),
        .i0(q_out[0]), .i1(q_out[1]), .i2(q_out[2]), .i3(q_out[3]),.y(mux_out));
    
    //dff
   //always@(posedge clk)begin
   //if(clear)
    //d_out <=4'b0000;
   //else
   //d_out <= d;
    //end
     
    always @(posedge clk)begin
    if (clear) 
   q_out <= 4'b0000;
   // end
   else begin
    case (mode)
            2'b00: q_out <= q_out;                  // No Change
            2'b01: q_out <= {sin_right, q_out[3:1]}; // Shift Right
            2'b10: q_out <= {q_out[2:0], sin_left};  // Shift Left
            2'b11: q_out <= d_in;                // Parallel Load
            //default: q_out <= q_out;
        endcase
            end
            //assign q_out = d_out;   // Output the current register value
           end 
          
endmodule
*/

module universal_shift_reg_dff(
    input clk, clear,
    input [1:0] mode,
    input sin_right, sin_left,
    input [3:0] d_in,
    output reg [3:0] q_out
);
    wire mux_out;
    
    mux4to1_fredkin mux(
        .s(mode[1:0]),
        .i0(q_out[0]),      // Shift Right
        .i1(q_out[3]),      // Shift Left
        .i2(sin_right),     // Serial Right Input
        .i3(sin_left),      // Serial Left Input
        .y(mux_out)
    );

    always @(posedge clk) begin
        if (clear) q_out <= 4'b0000;
        else case(mode)
            2'b11: q_out <= d_in;       // Parallel Load
            default: q_out <= {mux_out, q_out[3:1]}; // Shift Operations
        endcase
    end
endmodule