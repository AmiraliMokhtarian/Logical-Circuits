`timescale 1ns/1ns
module MSRR8_TB();
    reg clk, Re, inz;
    reg [1:0] mode;
    reg sIn;
    wire [7:0] Q;

    MSRR8 dut(.clk(clk), .Re(Re), .inz(inz), .sIn(sIn), .mode(mode), .Q(Q));

    initial begin
        clk = 1'b0;
        forever begin
           clk = ~clk; #50; 
        end 
    end

    initial begin
        sIn  = 1'b1;
        mode = 2'b00;
        Re=1'b1;
        inz=1'b0;
        
        mode = 2'b00; #200;
        mode = 2'b01; #200;
        mode = 2'b10; #200;
        mode = 2'b11; #200;

        mode = 2'b00;
        Re = 1'b0; #200;
        Re = 1'b1; #200;
        inz = 1'b1; #400;
        inz = 1'b0; #200;

        $finish;
    end
endmodule
