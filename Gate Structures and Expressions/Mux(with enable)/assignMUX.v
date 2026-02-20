`timescale 1ns/1ns
module assign_MUX(input a,b,s,e , output w);
    assign #(36,42) w = e?(a&~s)|(b&s):1'b0;
endmodule