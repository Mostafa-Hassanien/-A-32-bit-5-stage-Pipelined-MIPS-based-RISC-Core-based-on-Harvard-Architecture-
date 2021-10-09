module Decode_Register (
    input     wire        [31:0]       rd, pcPlus4F,
    input     wire                     clk, en, clear, rst,
    output    reg         [31:0]       instrD, pcPlus4D
);

always @(posedge clk or negedge rst)
        begin
            if(!rst)
                begin
                    instrD   <=    32'b0;
                    pcPlus4D <=    32'b0;
                end
            else if (clear & !en)
                begin
                    instrD   <=    32'b0;
                    pcPlus4D <=    32'b0;
                end
            else if(!en)
                begin
                    instrD   <=    rd;
                    pcPlus4D <=    pcPlus4F;
                end
        end
endmodule 