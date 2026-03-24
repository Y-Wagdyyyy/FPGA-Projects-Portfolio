`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2026 10:20:45 AM
// Design Name: 
// Module Name: tb
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


module fsm_tb;

    // Inputs
    reg clk;
    reg rst;
    reg din;

    // Output
    wire dout;

    // Instantiate the DUT (Device Under Test)
    fsm uut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .dout(dout)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        din = 0;

        // Apply reset
        #10;
        rst = 0;

        // Test sequence: 0 1 1 1 → should detect "111"
        #10 din = 0;
        #10 din = 1;
        #10 din = 1;
        #10 din = 1; // dout should be 1 here

        // More patterns
        #10 din = 0;
        #10 din = 1;
        #10 din = 0; // reset sequence

        #10 din = 1;
        #10 din = 1;
        #10 din = 1; // detect again

        // Continuous 1s
        #10 din = 1;
        #10 din = 1;

        // End simulation
        #20;
        $finish;
    end

endmodule