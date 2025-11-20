`timescale 1ns/1ns

module NandBuf(input a,b,c , output w);
    wire y;
    nand #(10,8) (y,a,b);
    bufif1 #(5,6,12) (w,y,c);
endmodule
//5->to1(worst to1 pmos) , 6->to0(worst to0 pmos) , 12->toZ(c=0 so buf doesn't conduct anything and delay comes from nand)
