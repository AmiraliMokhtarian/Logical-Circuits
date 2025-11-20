`timescale 1ns/1ns
module Nand2(input a,b , output w);
    wire j;
    supply1 vdd; supply0 gnd;
    pmos #(5,6,7) p1(w,vdd,a);
    pmos #(5,6,7) p2(w,vdd,b);
    
    nmos #(3,4,5) n1(j,gnd,b);
    nmos #(3,4,5) n2(w,j,a);
endmodule

