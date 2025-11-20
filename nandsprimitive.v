`timescale 1ns/1ns
module Nand2_pri(input a,b , output w);
    nand #(8,10) (w,a,b);
endmodule

module Nand3_pri(input a,b,c , output w);
    nand #(12,15) (w,a,b,c);
endmodule


