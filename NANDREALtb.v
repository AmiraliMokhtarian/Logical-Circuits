`timescale 1ns/1ns
module nandTB();
    reg aa=1'b1,bb=1'b1;
    reg cc=1'b1; //for NAND3
    Nand2 G2(aa,bb,w2);
    Nand3 G3(aa,bb,cc,w3);
    Nand2_pri G2_p(aa,bb,w2p);
    Nand3_pri G3_p(aa,bb,cc,w3p);

    
    initial begin
        #45;
        {aa,bb,cc}=3'b110; #45;//the worst case to1(for NAND3)
        {aa,bb,cc}=3'b111; #45;//the worst case to0(for NAND3)

        {aa,bb,cc}=3'b101; #45;//the worst case to1(for NAND2)
        {aa,bb,cc}=3'b111; #45;//the worst case to0(for NAND2)

        {aa,bb,cc}=3'b010; #45;
        {aa,bb,cc}=3'b110; #45;
        
        $finish;
    end
endmodule







`timescale 1ns/1ns

module muxTB();
    reg aa=1'b0 , bb=1'b1 , ss=1'b0 , ee=1'b1;
    //wire w;
    mux_e mt(aa,bb,ss,ee,w);
    initial begin
        #90;
        {aa,bb,ss,ee}=4'b0111; #90;
        $finish;
    end
endmodule
here's my testbench and final simulation(why w  is Z at all)
