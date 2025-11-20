`timescale 1ns/1ns
module inv(input a, output abar);
    supply1 vdd; supply0 gnd;
    pmos #(5,6,7) T1(abar,vdd,a);
    nmos #(3,4,5) T2(abar,gnd,a);
endmodule

module Nand_3sta(input a,b,c , output w);
    supply1 vdd; supply0 gnd;
    wire y,j,cbar; 

    pmos #(5,6,7) p1(y,vdd,a);
    pmos #(5,6,7) p2(y,vdd,b);
    
    nmos #(3,4,5) n1(j,gnd,b);
    nmos #(3,4,5) n2(y,j,a); 

    inv invc(c , cbar);
    pmos #(5,6,7) PP1(w,y,cbar);
    nmos #(3,4,5) NN1(w,y,c);
    
endmodule