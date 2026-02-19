module DLR(input D,clk,Re , output Q);
    wire QM, QbarM , Qbar;
    nand(QM , D , clk);
    nand(QbarM , QM , clk);
    nand(Qbar , Q , QbarM , Re);
    nand(Q,QM,Qbar);
endmodule

module DFF(input D , clk , inz , Re , output Q);
    wire D_syn , inzBAR , clkBAR , Q1;
    not(inzBAR , inz);
    and(D_syn , D , inzBAR);

    DLR dlr1(D_syn , clk , Re , Q1);
    not(clkBAR , clk);
    DLR dlr2(Q1 , clkBAR , Re , Q);
endmodule

  