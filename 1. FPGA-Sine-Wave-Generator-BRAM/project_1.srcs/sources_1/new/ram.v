`timescale 1ns / 1ps
 
///64 x 8
module ram(
    input clk,
    input we,
    input rst,
    input [5:0] addr,
    input [7:0] din,
    output [7:0] dout
    );
    
    blk_mem_gen_0 b1(clk, we, addr, din, dout);
endmodule
