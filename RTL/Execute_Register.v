module Execute_Register (
    output reg              regWriteE, 
    output reg              memToRegE,
    output reg              memWriteE,
    output reg    [1:0]     aluControlE,
    output reg              aluSrcE,
    output reg              regDstE,
    output reg    [31:0]    rd1E,
    output reg    [31:0]    rd2E,
    output reg    [4:0]     rsE, 
    output reg    [4:0]     rtE, 
    output reg    [4:0]     rdE,
    output reg    [31:0]    signImmE, 
    input  wire             regWriteD,
    input  wire             memToRegD,
    input  wire             memWriteD,
    input  wire   [1:0]     aluControlD,
    input  wire             aluSrcD,
    input  wire             regDstD,
    input  wire   [31:0]    rd1D,
    input  wire   [31:0]    rd2D,
    input  wire   [4:0]     rsD, 
    input  wire   [4:0]     rtD, 
    input  wire   [4:0]     rdD,
    input  wire   [31:0]    signImmD, 
    input  wire             clk, 
    input  wire             reset, 
    input  wire             clear
);


always @ (posedge clk or negedge reset)
    begin 
        if (clear | !reset)
            begin
                regWriteE   <=  1'b0;
                memToRegE   <=  1'b0;
                memWriteE   <=  1'b0;
                aluControlE <=  2'b0;
                aluSrcE     <=  1'b0;
                regDstE     <=  1'b0;
                rd1E        <=  32'b0;
                rd2E        <=  32'b0;
                rsE         <=  5'b0;
                rtE         <=  5'b0;
                rdE         <=  5'b0;
                signImmE    <=  32'b0;
            end
        else
            begin
                regWriteE   <=  regWriteD;
                memToRegE   <=  memToRegD;
                memWriteE   <=  memWriteD;
                aluControlE <=  aluControlD;
                aluSrcE     <=  aluSrcD;
                regDstE     <=  regDstD;
                rd1E        <=  rd1D;
                rd2E        <=  rd2D;
                rsE         <=  rsD;
                rtE         <=  rtD;
                rdE         <=  rdD;
                signImmE    <=  signImmD;
            end  
    end

endmodule