module executeStage (
    input     wire              regDstE, aluSrcE,
    input     wire  [1:0]       aluControlE,
    input     wire  [31:0]      rd1D, rd2D,
    input     wire  [4:0]       rsE, rtE, rdE,
    input     wire  [31:0]      signImmE,
    input     wire  [31:0]      aluOutMOut, resultW,
    input     wire  [1:0]       forwardAE, forwardBE,
    output    wire  [4:0]       rsEHazardUnit, rtEHazardUnit,
    output    wire  [4:0]       writeRegE,
    output    wire  [31:0]      writeDataE, aluOutE
);

wire   [31:0]   srcAE, srcBE;

assign rsEHazardUnit = rsE;
assign rtEHazardUnit = rtE;

MUX #(5) U1_MUX (
    .out(writeRegE),
    .in1(rdE),
    .in2(rtE),
    .sel(regDstE)
);

MUX4X1 #(32) U2_MUX (
    .out(srcAE),
    .in1(rd1D),
    .in2(resultW),
    .in3(aluOutMOut),
    .sel(forwardAE)
);

MUX4X1 #(32) U3_MUX (
    .out(writeDataE),
    .in1(rd2D),
    .in2(resultW),
    .in3(aluOutMOut),
    .sel(forwardBE)
);

MUX #(32) U4_MUX (
    .out(srcBE),
    .in1(signImmE),
    .in2(writeDataE),
    .sel(aluSrcE)
);

ALU #(32,2) U5_ALU (
    .aluOut(aluOutE),
    .aluFunc(aluControlE),
    .A(srcAE),
    .B(srcBE)
);

endmodule