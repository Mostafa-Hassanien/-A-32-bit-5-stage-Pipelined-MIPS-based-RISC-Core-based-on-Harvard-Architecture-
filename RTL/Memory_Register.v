module Memory_Register (
    input     wire             regWriteE, memToRegE, memWriteE,
    input     wire   [31:0]    aluOutE, writeDataE,
    input     wire   [4:0]     writeRegE,
    input     wire             clk, rst,
    output    reg              regWriteM, memToRegM, memWriteM,
    output    reg    [31:0]    aluOutM, writeDataM,
    output    reg    [4:0]     writeRegM
);

always @(posedge clk or negedge rst)
    begin
        if (!rst)
            begin
                regWriteM    <=    1'b0; 
                memToRegM    <=    1'b0;
                memWriteM    <=    1'b0;
                aluOutM      <=    32'b0; 
                writeDataM   <=    32'b0;
                writeRegM    <=    5'b0;
            end
        else
            begin
                regWriteM    <=   regWriteE; 
                memToRegM    <=   memToRegE;
                memWriteM    <=   memWriteE;
                aluOutM      <=   aluOutE; 
                writeDataM   <=   writeDataE;
                writeRegM    <=   writeRegE;
            end
    end
endmodule 