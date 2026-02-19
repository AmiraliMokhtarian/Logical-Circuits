`timescale 1ns/1ns
module DLR2(input D,clk,Re , output Q);
    wire QM, QbarM , Qbar;
    nand #8 (QM , D , clk);
    nand #8 (QbarM , QM , clk);
    nand #12 (Qbar , Q , QbarM , Re);
    nand #8 (Q,QM,Qbar);
endmodule