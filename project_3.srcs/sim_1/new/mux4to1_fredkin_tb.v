`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 06:50:10 PM
// Design Name: 
// Module Name: mux4to1_fredkin_tb
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


module mux4to1_fredkin_tb;

reg [1:0]s;
reg i0,i1,i2,i3;
wire y;

mux4to1_fredkin uut(.s(s),
.i0(i0),
.i1(i1),
.i2(i2),
.i3(i3),
.y(y)
);

initial begin 
// Test Case 1: S=00, should output i0
s= 2'b00;i0=1;i1=0;i2=0;i3=0;
//test case 2: s=01, output is i1
#10  s= 2'b01; i0=0; i1=1; i2=0; i3=0;
//test case 3: 
#10  s= 2'b10;  i0 = 0; i1 = 0; i2 = 1; i3 = 0;
//test case 4: 
#10  s = 2'b11; i0 = 0; i1 = 0; i2 = 0; i3 = 1;
//#5 $finish;

// Additional tests
     #10  s = 2'b00; i0 = 0;   // Expect Y=0
     #10  s = 2'b01; i1 = 1;   // Expect Y=1
     #10  s = 2'b10; i2 = 0;   // Expect Y=0
     #10  s = 2'b11; i3 = 1;   // Expect Y=1
#10 $finish;
end

initial begin
$monitor("time= %0t| s1 s0= %b | i0=%b; i1=%b; i2=%b; i3=%b| y=%b", $time,s, i0, i1, i2, i3, y); 
          end

endmodule
