`timescale 1ns/1ns

module DFF_alTB();
    reg clk, D, Re , inz;
    wire Q;
    DFF_al DF(.clk(clk), .Re(Re), .inz(inz) , .D(D) , .Q(Q));
    initial begin
        D=1'b0; inz=1'b0; Re=1'b1; clk=1'b1; #50

        clk=1'b0; #50;
        D=1'b1; clk=1'b1; #50
        clk=1'b0; #50;

        Re=1'b0; #50;
        Re=1'b1; #50;

        clk=1'b1; D=1'b1; #50;
        clk=1'b0; #50;

        clk=1'b1; inz=1'b1; #50;
        clk=1'b0; #50;

        $finish;

    end
endmodule