module MSRR8(input clk, Re, inz, sIn , input [1:0]mode , output [7:0]Q);
    reg [7:0] D_in;
    generate
        genvar i;
        for(i=0 ; i<8 ; i=i+1) begin 
            always @(*) begin
                case (mode)

                    2'b00: D_in[i]=Q[i];

                    2'b01: begin
                    if(i==7)
                        D_in[i]=sIn;
                    else
                        D_in[i]=Q[i+1];
                    end

                    2'b10: begin
                    if(i==7)
                        D_in[i]=Q[0]; 
                    else
                        D_in[i]=Q[i+1];
                    end

                    2'b11: begin
                        if(i==7 || i==6)
                            D_in[i]=sIn;
                        else
                            D_in[i]=Q[i+2];
                    end

                endcase
            end

            DLR_inz latch_i(.D(D_in[i]), .clk(clk) , .Re(Re) , .inz(inz), .Q(Q[i]));
        end
    endgenerate
endmodule