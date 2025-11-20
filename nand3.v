`timescale 1ns/1ns
module Nand3(input a,b,c , output w);
    supply1 vdd; supply0 gnd;
    wire j,k;
    pmos #(5,6,7) p1(w,vdd,a),
                 p2(w,vdd,b),
                 p3(w,vdd,c);
    nmos #(3,4,5) n1(j,gnd,c),
                  n2(k,j,b),
                  n3(w,k,a);
endmodule


