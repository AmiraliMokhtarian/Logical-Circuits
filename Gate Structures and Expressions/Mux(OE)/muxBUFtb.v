`timescale 1ns/1ns

module muxBUFtb();
    reg aa=1'b1 , bb=1'b1 , ss=1'b1 , oe=1'b1;
    wire w;
    muxBYbuf mbt(aa,bb,ss,oe,w);
    assignMUXbuf ambt(aa,bb,ss,oe,w_assign);
    initial begin
        #97;
        {aa,bb,ss,oe}=4'b1011;#97;
        {aa,bb,ss,oe}=4'b1001;#97;//worst case to1
        {aa,bb,ss,oe}=4'b1011;#97;//worst case to0
        {aa,bb,ss,oe}=4'b1111;#97;
        {aa,bb,ss,oe}=4'b1101;#97;//X interval
        {aa,bb,ss,oe}=4'b1100;#97;//toZ
        $finish;
    end
endmodule


