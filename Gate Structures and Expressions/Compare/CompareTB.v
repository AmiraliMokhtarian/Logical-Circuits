`timescale 1ns/1ns
module Compare();
    reg a=1'b1 , b=1'b1 , s=1'b1;
    reg e=1'b1;
    wire w1 , w3;

    mux_e mux1(a,b,s,e,w1);
    muxBYbuf mux_3(a,b,s,e,w3);

    initial begin
        #127;
        {a,b,s,e}=4'b1101; #127;//X interval
        {a,b,s,e}=4'b1001; #127;
        {a,b,s,e}=4'b1011; #127;//worst to0
        {a,b,s,e}=4'b1001; #127;//worst to1
        {a,b,s,e}=4'b1000; #127;//Z for 3
        $finish;
    end
endmodule

