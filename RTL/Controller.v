module Controller (
    input    wire    [5:0]      opCode, func,
    input    wire               equalD,
    output   wire               memWrite, regWrite, regDest, aluSrc, memtoReg, jump, pcSrcD, clearD, branch,
    output   wire    [1:0]      aluController
);

wire      [1:0]     aluOp;

assign pcSrcD = branch & equalD;
assign clearD = pcSrcD | jump;

Main_Decoder U1_MD1 (
    .opCode(opCode),
    .aluOp(aluOp),
    .memWrite(memWrite),
    .regWrite(regWrite),
    .regDest(regDest),
    .aluSrc(aluSrc),
    .memtoReg(memtoReg),
    .jump(jump),
    .branch(branch)
);

ALU_Decoder  U2_ALUD (
    .aluOp(aluOp),
    .func(func),
    .aluController(aluController)
);

endmodule

