`timescale 1ns / 1ps

module TopModule(
        input clk,
        input load_button,
        input reset,
        output[6:0] seg,
        output[3:0] an
    );
    
    parameter zero = 4'b0000;
    
    wire clk_out;
    wire[3:0]mux_out;
    wire[1:0]counter_out;
    wire[3:0]ones,tens;
    wire[1:0]hundreds;
    
    wire button_deb;
    debounce_mod U0(clk,load_button,button_deb);
    
    wire[7:0] Q;
    
    D_FF D0(clk, reset, button_deb, Q[1],Q[0]);
    D_FF D1(clk, reset, button_deb, Q[2],Q[1]);
    D_FF D2(clk, reset, button_deb, Q[3],Q[2]);
    D_FF D3(clk, reset, button_deb, Q[4],Q[3]);
    D_FF D4(clk, reset, button_deb, Q[5],Q[4]);
    D_FF D5(clk, reset, button_deb, Q[6],Q[5]);
    D_FF D6(clk, reset, button_deb, Q[7],Q[6]);
    D_FF D7(clk, reset, button_deb, ~(Q[7] ^ Q[5] ^ Q[4] ^ Q[3]),Q[7]);
    
    binary2bcd U2(Q,ones,tens,hundreds);
    mux_4to1 Mux(ones, tens, hundreds, zero, counter_out, mux_out);
    Slow_Clock Slow(clk, clk_out);
    two_bitCounter Count(clk_out, counter_out);
    Decoder Decode(counter_out,an);
    bcd_sevenSegment(mux_out, seg);
    endmodule
    
    