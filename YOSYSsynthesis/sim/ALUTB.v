`timescale 1ns/1ns
module ALU_TB();
    reg[15:0] A, B;
    reg C;
    reg [2:0]opc;
    wire [15:0]W,W_post;
    wire [15:0]Wmin,Wmin_post;
    wire zer,neg,zer_post,neg_post;
    wire zermin,negmin,zermin_post,negmin_post;

    ALU1 ATB1(.inA(A), .inB(B) , .opc(opc) , .inC(C) , .outW(W) , .zer(zer) , .neg(neg));
    ALU1_synth ATB1_synth(.inA(A), .inB(B) , .opc(opc) , .inC(C) , .outW(W_post) , .zer(zer_post) , .neg(neg_post));
   
    minimal_ALU AMTB(.inA(A), .inB(B) , .opc(opc) , .inC(C) , .outW(Wmin) , .zer(zermin) , .neg(negmin));
    minimalALU_synth AMTB_synth(.inA(A), .inB(B) , .opc(opc) , .inC(C) , .outW(Wmin_post) , .zer(zermin_post) , .neg(negmin_post));

    integer i;
    initial begin
        A=16'b0 ; B=16'b0 ; C=1'b0 ; opc=3'b0; #200;

        A =16'b1111111111111110  ; B=16'd3; #200;
        
        for(i=0 ; i<8 ; i=i+1)begin
            opc=i; #200;
        end

        repeat(10)begin
            A = $random();
            B = $random();
            C = $random();
            opc = $random();
            #200;
        end
        $stop;
    end
endmodule
