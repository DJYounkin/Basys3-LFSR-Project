`timescale 1ns / 1ps

module mux_4to1(
        input [3:0] A, B, C, D,
        input [1:0] SS,
        output reg [3:0] Y
    );
    
    always@(A or B or C or D or SS)
    begin
    case(SS)
        2'b00: Y <= A;
        2'b01: Y <= B;
        2'b10: Y <= C;
        2'b11: Y <= D;
        endcase
    end
endmodule
