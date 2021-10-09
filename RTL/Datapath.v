module Datapath (
    input      wire               clearD, jump, pcSrcD, 
    input      wire               memWrite, regWrite, regDest, aluSrc, memtoReg, 
    input      wire    [1:0]      aluController,
    input      wire               stallD, stallF, flushE,
    input      wire               forwardAD, forwardBD,
    input      wire    [1:0]      forwardAE, forwardBE,
    input      wire               clk, rst,
    output     wire    [5:0]      opCode, func,
    output     wire               equalD,
    output     wire               regWriteM, memToRegM, regWriteE, memToRegE, regWriteW,
    output     wire    [4:0]      writeRegE, writeRegMOut, writeRegW, rsEHazardUnit, rsD, rtEHazardUnit, rtD,
    output     wire    [31:0]     testDataOut
);

wire    [31:0]   pcMux1Out, pcOld, pcPlus4F, pcPlus4D, pcBranchD, pcJumpD;
wire    [31:0]   pcF, rd;
wire    [31:0]   instrD, resultW, aluOutMOut, aluOutMIn, aluOutM, writeDataM;
wire    [4:0]    writeRegWIn, writeRegMIn, writeRegM, rdD;
wire    [31:0]   rd1D, rd2D, signImmD, signImmE;
wire             memWriteE, aluSrcE, regDstE;
wire    [1:0]    aluControlE;
wire    [31:0]   rd1E, rd2E, writeDataE, aluOutE;
wire    [4:0]    rdE, rsE, rtE;
wire             memToRegW, memWriteM;
wire    [31:0]   readDataM, readDataW, aluOutW;



MUX #(32) U1_MUX (
    .out(pcMux1Out),
    .in1(pcBranchD),
    .in2(pcPlus4F),
    .sel(pcSrcD)
);

MUX #(32) U2_MUX (
    .out(pcOld),
    .in1(pcJumpD),
    .in2(pcMux1Out),
    .sel(jump)
);

Program_Counter #(32)  U3_Program_Counter (
    .pcNew(pcF),
    .pcOld(pcOld),
    .clk(clk),
    .reset(rst),
    .enable(stallF)
);

fetchSatge U4_fetchSatge (
    .rd(rd),
    .pcPlus4F(pcPlus4F),
    .pcF(pcF)
);

Decode_Register U5_Decode_Register(
    .rd(rd),
    .pcPlus4F(pcPlus4F),
    .clk(clk),
    .rst(rst),
    .en(stallD),
    .clear(clearD),
    .instrD(instrD),
    .pcPlus4D(pcPlus4D)
);

decodeStage U6_decodeStage (
    .regWriteW(regWriteW),
    .instrD(instrD),
    .resultW(resultW),
    .aluOutM(aluOutMOut),
    .pcPlus4D(pcPlus4D),
    .writeRegW(writeRegW),
    .forwardAD(forwardAD),
    .forwardBD(forwardBD),
    .clk(clk),
    .rst(rst),
    .opCode(opCode),
    .func(func),
    .rd1D(rd1D),
    .rd2D(rd2D),
    .signImmD(signImmD),
    .pcBrancD(pcBranchD),
    .pcJumpD(pcJumpD),
    .rsD(rsD),
    .rtD(rtD),
    .rdE(rdD),
    .equalD(equalD)
);

Execute_Register U7_Execute_Register (
    .regWriteE(regWriteE),
    .memToRegE(memToRegE),
    .memWriteE(memWriteE),
    .aluControlE(aluControlE),
    .aluSrcE(aluSrcE),
    .regDstE(regDstE),
    .rd1E(rd1E),
    .rd2E(rd2E),
    .rsE(rsE),
    .rtE(rtE),
    .rdE(rdE),
    .signImmE(signImmE),
    .regWriteD(regWrite),
    .memToRegD(memtoReg),
    .memWriteD(memWrite),
    .aluControlD(aluController),
    .aluSrcD(aluSrc),
    .regDstD(regDest),
    .rd1D(rd1D),
    .rd2D(rd2D),
    .rsD(rsD),
    .rtD(rtD),
    .rdD(rdD),
    .signImmD(signImmD),
    .clk(clk),
    .reset(rst),
    .clear(flushE)
);

executeStage U8_executeStage (
    .regDstE(regDstE),
    .aluSrcE(aluSrcE),
    .aluControlE(aluControlE),
    .rd1D(rd1E),
    .rd2D(rd2E),
    .rsE(rsE),
    .rtE(rtE),
    .rdE(rdE),
    .signImmE(signImmE),
    .aluOutMOut(aluOutMOut),
    .resultW(resultW),
    .forwardAE(forwardAE),
    .forwardBE(forwardBE),
    .rsEHazardUnit(rsEHazardUnit),
    .rtEHazardUnit(rtEHazardUnit),
    .writeRegE(writeRegE),
    .writeDataE(writeDataE),
    .aluOutE(aluOutE)
);

Memory_Register U9_Memory_Register (
    .regWriteE(regWriteE),
    .memToRegE(memToRegE),
    .memWriteE(memWriteE),
    .aluOutE(aluOutE),
    .writeRegE(writeRegE),
    .writeDataE(writeDataE),
    .clk(clk),
    .rst(rst),
    .regWriteM(regWriteM),
    .memToRegM(memToRegM),
    .memWriteM(memWriteM),
    .aluOutM(aluOutMIn),
    .writeDataM(writeDataM),
    .writeRegM(writeRegMIn)
);

memStage U10_memStage (
    .writeRegMOut(writeRegMOut),
    .aluOutMOut(aluOutMOut),
    .readDataM(readDataM),
    .aluOutM(aluOutM),
    .writeRegM(writeRegM),
    .testDataOut(testDataOut),
    .writeRegMIn(writeRegMIn),
    .aluOutMIn(aluOutMIn),
    .writeDataM(writeDataM),
    .memWriteM(memWriteM),
    .clk(clk),
    .reset(rst)
);

WriteBack_Register U11_WriteBack_Register (
    .regWriteM(regWriteM),
    .memToRegM(memToRegM),
    .readDataM(readDataM),
    .aluOutM(aluOutM),
    .writeRegM(writeRegM),
    .clk(clk),
    .rst(rst),
    .regWriteW(regWriteW),
    .memToRegW(memToRegW),
    .readDataW(readDataW),
    .aluOutW(aluOutW),
    .writeRegW(writeRegWIn)
);

writeBackStage U12_writeBackStage (
    .resultW(resultW),
    .writeRegWOut(writeRegW),
    .memToRegW(memToRegW),
    .readDataW(readDataW),
    .aluOutW(aluOutW),
    .writeRegWIn(writeRegWIn)
);

endmodule