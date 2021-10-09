module Main_Decoder (
    input    wire     [5:0]     opCode,
    output   reg      [1:0]     aluOp,
    output   reg                memWrite, regWrite, regDest, aluSrc, memtoReg, branch, jump
);

reg     [8:0]     flags;  

localparam loadWord        = 6'b10_0011,
           storeWord       = 6'b10_1011,
           rType           = 6'b00_0000,
           addImmediate    = 6'b00_1000,
           branchIfEqual   = 6'b00_0100,
           jump_inst       = 6'b00_0010; 

always @(*)
    begin
        {jump, aluOp, memWrite, regWrite, regDest, aluSrc, memtoReg, branch} = flags;
    end

always @(*)
    begin
        case (opCode)
            loadWord      : flags = 9'b0_0001_0110;
            storeWord     : flags = 9'b0_0010_0110;
            rType         : flags = 9'b0_1001_1000;
            addImmediate  : flags = 9'b0_0001_0100;
            branchIfEqual : flags = 9'b0_0100_0001;
            jump_inst     : flags = 9'b1_0000_0000;
            default       : flags = 9'b0_0000_0000;
        endcase
    end
endmodule 