module writeBackStage (
    output wire   [31:0]   resultW, 
    output wire   [4:0]    writeRegWOut,
    input  wire            memToRegW, 
    input  wire   [31:0]   readDataW,
    input  wire   [31:0]   aluOutW,
    input  wire   [4:0]    writeRegWIn    
);

assign writeRegWOut = writeRegWIn; 

MUX #(32) MUX_instance
(
    .out (resultW), 
    .in1 (readDataW), 
    .in2 (aluOutW), 
    .sel (memToRegW)
);

endmodule