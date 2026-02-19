`timescale 1ns/1ns
module TB7();
    reg D,inz,clk,Re;
    wire Q;
    DFF dfftb(.D(D) , .inz(inz) , .Re(Re) , .clk(clk) , .Q(Q));
    initial begin
        #50;
        {D,inz,clk,Re}=4'b1011; #50;
        {D,inz,clk,Re}=4'b1001; #50;
        {D,inz,clk,Re}=4'b0011; #50;
        {D,inz,clk,Re}=4'b0001; #50;
        {D,inz,clk,Re}=4'b1011; #50;
        {D,inz,clk,Re}=4'b1001; #50;

        {D,inz,clk,Re}=4'b1111; #50;
        {D,inz,clk,Re}=4'b1101; #50;

        {D,inz,clk,Re}=4'b1011; #50;
        {D,inz,clk,Re}=4'b1001; #50;

        {D,inz,clk,Re}=4'b1111; #50;
        {D,inz,clk,Re}=4'b1001; #50; //inz=0 so it looks like it shouldn't reset
        //but the value 1 doesn't propogate yet because of edge triggering

        //Re checking:
        {D,inz,clk,Re}=4'b1011; #50;
        {D,inz,clk,Re}=4'b1001; #50;
        {D,inz,clk,Re}=4'b1000; #50;
    end
    
endmodule