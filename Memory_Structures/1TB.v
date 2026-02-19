`timescale 1ns/1ns
module DTB();
    reg D,Re,clk;
    wire Q;
    DLR2 DT(.D(D), .Re(Re), .clk(clk), .Q(Q));

    initial begin
        #50;
        D=1'b1; clk=1'b0;
        Re=1'b0; #50;

        Re=1'b1; clk=1'b1; #50;

        clk=1'b0; D=1'b0; #50;
        clk=1'b1; #50;

        //glitch
        D=1'b1; #10;
        clk=1'b0; #30;
        clk=1'b1; #25;

        //trancparency
        D=1'b0; #50;
        D=1'b1; #50;

        $finish;
    end
endmodule
