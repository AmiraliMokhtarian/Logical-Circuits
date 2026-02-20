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

module mux_e(input a,b,s,e, output y);
  wire sbar;
  wire j, k;    
  wire mux;     
  wire ybar;     

  invertor no(s,sbar);

  Nand2 N1( a, sbar, j);
  Nand2 N2(s, b, k);
  Nand2 N3(k,j,mux);
  Nand2 N4(e, mux, ybar);

  invertor no2(ybar,y);
endmodule

