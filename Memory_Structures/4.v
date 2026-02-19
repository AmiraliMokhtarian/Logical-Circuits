module DLR_inz(input D,clk,Re,inz , output Q);
    wire QM, QbarM , Qbar;
    wire D_syn, inzBAR;

    not #6 (inzBAR , inz);
    
    and #14 (D_syn , inzBAR , D);
    nand #8 (QM , D_syn , clk);
    nand #8 (QbarM , QM , clk);
    nand #12(Qbar , Q , QbarM , Re);
    nand #8 (Q,QM,Qbar);
endmodule