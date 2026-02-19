`timescale 1ns/1ns
module MSRR8_DFF();
    reg clk, Re, inz;
    reg [1:0] mode;
    reg sIn;
    wire [7:0] Q;

    MSRR8_FF MSTB(.clk(clk), .Re(Re), .inz(inz), .sIn(sIn), .mode(mode), .Q(Q));

    initial begin 
        clk = 1'b0; 
        forever begin
            clk = ~clk; #50;
            end 
        end

    initial begin
        mode = 2'b00;
        sIn  = 1'b0;
        inz  = 1'b0;
        Re   = 1'b1;
        #100;

        Re = 1'b0;
        #100;

        Re=1'b1; #50;
        sIn=1'b1; mode=2'b01; #800;
        sIn=1'b0;
        Re=1'b0; #100;
        Re=1'b1;
        sIn=1; #100;

        mode=2'b10; #850;

        sIn=1'b0; #100;
        mode=2'b11; #800;

        sIn=1'b1;
        mode = 2'b01; #800;
        inz=1'b1; #100;
        $finish;
    end
endmodule
