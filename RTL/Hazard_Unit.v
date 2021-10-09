module Hazard_Unit (
    input     wire                  regWriteW, regWriteM, memToRegM, regWriteE, memToRegE, jumpD, branchD,
    input     wire      [4:0]       writeRegE, writeRegM, writeRegW, rsE, rsD, rtE, rtD,
    output    wire                  stallD, stallF, flushE,
    output    wire                  forwardAD, forwardBD,
    output    reg       [1:0]       forwardAE, forwardBE
);

wire  lwStall;
wire  branshStall;

assign  lwStall      = (((rsD == rtE) | (rtD == rtE)) & memToRegE);
assign  branshStall  = ((branchD & regWriteE & ((writeRegE == rsD) | (writeRegE == rtD))) | (branchD & memToRegM & ((writeRegM == rsD) | (writeRegM == rtD))));
assign  stallF       = (lwStall | branshStall);
assign  stallD       = (lwStall | branshStall);
assign  flushE       = (lwStall | branshStall | jumpD);
assign  forwardAD    = ((rsD != 0) & (rsD == writeRegM) & regWriteM);
assign  forwardBD    = ((rtD != 0) & (rtD == writeRegM) & regWriteM);

always @(*)
    begin
        if ((rsE != 0) & (rsE == writeRegM) & regWriteM)
                forwardAE = 2'b10;
        else if ((rsE != 0) & (rsE == writeRegW) & regWriteW)
                forwardAE = 2'b01;
        else
                forwardAE = 2'b00;
    end

always @(*)
    begin
        if ((rtE != 0) & (rtE == writeRegM) & regWriteM)
                forwardBE = 2'b10;
        else if ((rtE != 0) & (rtE == writeRegW) & regWriteW)
                forwardBE = 2'b01;
        else
                forwardBE = 2'b00;
    end

endmodule