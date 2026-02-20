`timescale 1ns/1ns

module muxTB();
    reg aa=1'b0 , bb=1'b1 , ss=1'b1 , ee=1'b1;
    wire w,assign_w;
    mux_e mt(aa,bb,ss,ee,w);
    assign_MUX asmt(aa,bb,ss,ee,assign_w);
    initial begin
        #127;
        {aa,bb,ss,ee}=4'b1111; #127;//to0
        {aa,bb,ss,ee}=4'b1101; #127;//X interval

        {aa,bb,ss,ee}=4'b1001; #127;
        
        {aa,bb,ss,ee}=4'b1011; #127;//worst to0
        {aa,bb,ss,ee}=4'b1001; #127;//worst to1
        
        $finish;
    end
endmodule