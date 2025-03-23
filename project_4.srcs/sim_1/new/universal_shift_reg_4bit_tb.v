`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 03:45:51 PM
// Design Name: 
// Module Name: universal_shift_reg_4bit_tb
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
module mux_shift_reg_tb;

reg clk, clear;
    reg [1:0] mode;
    reg [3:0] d_in;
    reg sin_left, sin_right;
    reg [1:0] s;
    reg i0, i1, i2, i3;
    wire [3:0] q_out;
    wire y;

universal_shift_reg_dff uut(
 .clk(clk),
    .clear(clear),
    .mode(mode),
    .sin_right(sin_right),
    .sin_left(sin_left),
    .d_in(d_in),
    .q_out(q_out));
    
     //mux4to1_fredkin inst (
      //  .s(s), .i0(i0), .i1(i1), .i2(i2), .i3(i3), .y(y));
        
    always #5 clk = ~clk;
    
    initial begin
   $dumpfile("mux_shift_reg_tb.vcd");  // VCD file for waveform analysis
   $dumpvars(0, mux_shift_reg_tb);
        
    clk = 0;
    clear = 1;
    mode = 2'b00;
    sin_right = 0;
    sin_left = 0;
    d_in = 4'b0000; 
     s = 2'b00; i0 = 1; i1 = 0; i2 = 1; i3 = 0;

 #5  clear = 0;    // Release reset

    // Test Shift Right
    #10 mode = 2'b01; sin_right = 1; // Set sin_right for shift right
    #10 mode = 2'b00;                  // Reset signals
    
    // Test Shift Left
    #10 mode = 2'b10; sin_left = 1;   // Set sin_left for shift left
    #10 mode = 2'b00;
    
    // Test Parallel Load
    #10 mode = 2'b11; d_in = 4'b1010;
    #10 mode = 2'b00;
    
    // Test MUX Selection
    #10 s = 2'b01;
    #10 s = 2'b10;
    #10 s = 2'b11;     
    
    #50 $finish;    
        // Parallel Load Operation
        //#20 s = 2'b11; d_in = 4'b1010;
        
        // No Change
       // #20 s = 2'b00;
        
        // Shift Right
        //#20 s = 2'b01; sin_right = 1;
        
        // Shift Left
        //#20 s = 2'b10; sin_left = 0;
        
        // Shift Right again
        //#20 s = 2'b01; sin_right = 0;
    end
    
    initial begin
      $monitor("Time = %0t | clk=%b | clear=%b | mode=%b | sin_right=%b | sin_left=%b | d_in=%b | s=%b | q_out=%b | i0=%b | i1=%b | i2=%b | i3=%b | y=%b", 
    $time, clk, clear, mode, sin_right, sin_left, d_in, s, q_out, i0, i1, i2, i3, y);
    end
endmodule
*/

module mux_shift_reg_tb;
    reg clk = 0;
    reg clear;
    reg [1:0] mode;
    reg sin_left, sin_right;
    reg [3:0] d_in;
    wire [3:0] q_out;

    universal_shift_reg_dff uut(
        .clk(clk),
        .clear(clear),
        .mode(mode),
        .sin_right(sin_right),
        .sin_left(sin_left),
        .d_in(d_in),
        .q_out(q_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Signal monitoring
    always @(posedge clk) begin
        $display("[%0t] Mode: %b | Q_OUT: %4b | ShiftIn: R=%b L=%b",
                 $time, mode, q_out, sin_right, sin_left);
    end

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, mux_shift_reg_tb);
        
        // Initialize
        clear = 1;
        mode = 2'b00;
        sin_right = 0;
        sin_left = 0;
        d_in = 4'b0000;
        
        // Reset sequence
        #10 clear = 0;
        
        // Test sequence
        // 1. Parallel Load
        #10 mode = 2'b11; d_in = 4'b1101;
        #10 mode = 2'b00;  // Maintain value
        
        // 2. Shift Right (3 times)
        #10 mode = 2'b00; sin_right = 1;
        #10 sin_right = 0;
        #10 sin_right = 1;
        #10 sin_right = 0;
        
        // 3. Shift Left (2 times)
        #10 mode = 2'b01; sin_left = 1;
        #10 sin_left = 0;
        
        #50 $finish;
    end
endmodule
