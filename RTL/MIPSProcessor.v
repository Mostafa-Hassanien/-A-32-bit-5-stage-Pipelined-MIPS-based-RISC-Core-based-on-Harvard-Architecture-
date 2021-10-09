module MIPSProcessor (
    input    wire               clk, rst,
    output   wire    [31:0]     testDataOut           
);

wire               clearD, jump, pcSrcD, branch;
wire               memWrite, regWrite, regDest, aluSrc, memtoReg;
wire    [1:0]      aluController;
wire               stallD, stallF, flushE;
wire               forwardAD, forwardBD;
wire    [1:0]      forwardAE, forwardBE;
wire    [5:0]      opCode, func;
wire               equalD;
wire               regWriteM, memToRegM, regWriteE, memToRegE, regWriteW;
wire    [4:0]      writeRegE, writeRegMOut, writeRegW, rsE, rsD, rtE, rtD;



Datapath U1_Datapath (
    .clearD(clearD),
    .jump(jump),
    .pcSrcD(pcSrcD),
    .memWrite(memWrite), 
    .regWrite(regWrite), 
    .regDest(regDest), 
    .aluSrc(aluSrc), 
    .memtoReg(memtoReg),
    .aluController(aluController),
    .stallD(stallD), 
    .stallF(stallF), 
    .flushE(flushE),
    .forwardAD(forwardAD), 
    .forwardBD(forwardBD),
    .forwardAE(forwardAE), 
    .forwardBE(forwardBE),
    .clk(clk), 
    .rst(rst),
    .opCode(opCode), 
    .func(func),
    .equalD(equalD),
    .regWriteM(regWriteM), 
    .memToRegM(memToRegM), 
    .regWriteE(regWriteE), 
    .memToRegE(memToRegE),
    .writeRegE(writeRegE), 
    .regWriteW(regWriteW),
    .writeRegMOut(writeRegMOut), 
    .writeRegW(writeRegW), 
    .rsEHazardUnit(rsE), 
    .rsD(rsD), 
    .rtEHazardUnit(rtE), 
    .rtD(rtD),
    .testDataOut(testDataOut)
);

Controller U2_Controller (
    .opCode(opCode), 
    .func(func),
    .equalD(equalD),
    .clearD(clearD),
    .jump(jump),
    .pcSrcD(pcSrcD),
    .memWrite(memWrite), 
    .regWrite(regWrite), 
    .regDest(regDest), 
    .aluSrc(aluSrc), 
    .memtoReg(memtoReg),
    .aluController(aluController),
    .branch(branch)
);

Hazard_Unit U3_Hazard_Unit (
    .regWriteW(regWriteW),
    .regWriteM(regWriteM), 
    .memToRegM(memToRegM), 
    .regWriteE(regWriteE), 
    .memToRegE(memToRegE),
    .writeRegE(writeRegE),
    .jumpD(jump), 
    .branchD(branch),
    .writeRegM(writeRegMOut), 
    .writeRegW(writeRegW), 
    .rsE(rsE), 
    .rsD(rsD), 
    .rtE(rtE), 
    .rtD(rtD),
    .stallD(stallD), 
    .stallF(stallF), 
    .flushE(flushE),
    .forwardAD(forwardAD), 
    .forwardBD(forwardBD),
    .forwardAE(forwardAE), 
    .forwardBE(forwardBE)
);
endmodule