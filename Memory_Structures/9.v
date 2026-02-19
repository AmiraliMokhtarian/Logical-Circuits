module DFF_al(input clk, Re, inz , D , output reg Q);
    reg QM;
    always @(posedge clk) begin
        QM = D;
    end

    always @(negedge clk) begin

        if(Re==1'b0)begin
            Q<=1'b0;
        end

        else begin
            if(inz)
                Q<=1'b0;
            else    
                Q<=QM;
        end
    end

    assign Q = Q ? Re : 1'b0;

endmodule