`timescale 1ns/1ns
module assignMUXbuf(input a,b,s,oe , output w);
    assign #(28,31,12) w = oe ? (a&~s) | (b&s) : 1'bz;
endmodule
