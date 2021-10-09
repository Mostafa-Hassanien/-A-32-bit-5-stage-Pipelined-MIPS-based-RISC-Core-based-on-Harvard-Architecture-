module WriteBack_Register (
    input    wire            regWriteM, memToRegM,
    input    wire   [31:0]   readDataM, aluOutM,
    input    wire   [4:0]    writeRegM,
    input    wire            clk, rst,
    output   reg             regWriteW, memToRegW,
    output   reg    [31:0]   readDataW, aluOutW,
    output   reg    [4:0]    writeRegW
);

always @(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                regWriteW      <=      1'b0;
                memToRegW      <=      1'b0;
                readDataW      <=      32'b0;
                aluOutW        <=      32'b0;
                writeRegW      <=      5'b0;
            end
        else
            begin
                regWriteW      <=      regWriteM;
                memToRegW      <=      memToRegM;
                readDataW      <=      readDataM;
                aluOutW        <=      aluOutM;
                writeRegW      <=      writeRegM;
            end
    end

endmodule