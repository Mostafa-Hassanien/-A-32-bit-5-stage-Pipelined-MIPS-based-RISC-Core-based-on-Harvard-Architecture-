module memStage (
    output wire  [4:0]   writeRegMOut,
    output wire  [31:0]  aluOutMOut, 
    output wire  [31:0]  readDataM,
    output wire  [31:0]  aluOutM, 
    output wire  [4:0]   writeRegM,
    output wire  [31:0]  testDataOut, 
    input  wire  [4:0]   writeRegMIn, 
    input  wire  [31:0]  aluOutMIn, 
    input  wire  [31:0]  writeDataM, 
    input  wire          memWriteM, 
    input  wire          clk, 
    input  wire          reset 
);

assign writeRegM    = writeRegMIn;
assign writeRegMOut = writeRegMIn; 
assign aluOutM      = aluOutMIn; 
assign aluOutMOut   = aluOutMIn; 

dataMemory #(32, 32, 128) dataMemoryInstance
(
    .readData    (readDataM), 
    .testData    (testDataOut), 
    .writeData   (writeDataM), 
    .addr        (aluOutMIn),
    .writeEnable (memWriteM), 
    .clk         (clk), 
    .reset       (reset)
); 

endmodule