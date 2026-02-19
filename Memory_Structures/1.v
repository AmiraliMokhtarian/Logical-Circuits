module DLR(input D,clk,Re , output Q);
    wire QM, QbarM , Qbar;
    nand(QM , D , clk); //if we want to reset while clock is on we can add a Re here which is overwrite
    nand(QbarM , QM , clk);
    nand(Qbar , Q , QbarM , Re);
    nand(Q,QM,Qbar);
endmodule