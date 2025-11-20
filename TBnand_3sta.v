`timescale 1ns/1ns
module TBNand_3sta();
    reg aa=1'b1,bb=1'b1,cc=1'b1;
    wire w,wPrim;
    Nand_3sta M1(aa,bb,cc,w);
    NandBuf M2(aa,bb,cc,wPrim);

    
    initial begin
        #47;
        {aa,bb,cc} = 3'b101;#47;//the worst case to1
        {aa,bb,cc} = 3'b111;#47;//worst to0
        {aa,bb,cc} = 3'b011;#47;
        {aa,bb,cc} = 3'b001;#47;
        {aa,bb,cc} = 3'b000;#47;//worst toZ
        {aa,bb,cc} = 3'b100;#47;
        
        #47 $finish;
    end
endmodule
//wPrim always consider the worst case even if it's not(because in primitive for calculating the worst cases we should consider the worst case)
