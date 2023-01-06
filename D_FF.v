`timescale 1ns / 1ps

module D_FF(input clk, reset,
            load, D,
            output reg Q
            );
            
    always @(posedge clk)
        begin
            if(reset)
            Q<= 1'b0;
            else if(load)
            Q<=D;
        end
    endmodule
            
    

