`timescale 1ns / 1ps

module Slow_Clock(
        input clk_in,   //100mhz from board
        output clk_out  //slow clock at 100Hz freq

    );
    
    
    reg[20:0] count = 0;    //2^20 == 1048576
    reg clk_out;
    
    
    
    always @(posedge clk_in)    //whenever the positive edge of the clock arrives
    begin
    count <=count+1; //increment counter
    if(count == 50000)  //at 50k, count resets & clock flips
    begin
        count<=0;
        clk_out = ~clk_out;
    end
    end
endmodule
