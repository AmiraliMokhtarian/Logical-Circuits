`timescale 1ns/1ns

module Nand2(input a,b , output w);
    wire j;
    supply1 vdd; supply0 gnd;
    pmos #(5,6,7) p1(w,vdd,a);
    pmos #(5,6,7) p2(w,vdd,b);
    
    nmos #(3,4,5) n1(j,gnd,b);
    nmos #(3,4,5) n2(w,j,a);
endmodule


module invertor(input a, output abar);
    supply1 vdd; supply0 gnd;
    pmos #(5,6,7) T1(abar,vdd,a);
    nmos #(3,4,5) T2(abar,gnd,a);
endmodule

module muxBYbuf(input a,b,s,oe , output w);
    wire sbar,j,k;
    wire y,oebar;//for 3state nand

    invertor i1(s,sbar);
    Nand2 n1(a,sbar,j);
    Nand2 n2(b,s,k);

    Nand2 nMUX(k,j,y);
    invertor i2(oe,oebar);
    pmos #(5,6,7) p1_end(w,y,oebar);
    nmos #(3,4,5) n1_end(w,y,oe);
endmodule
