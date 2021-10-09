module  instructionMemory #(
    parameter DATA_WIDTH    = 32,
    parameter ADDRESS_WIDTH = 32, 
    parameter DEPTH         = 256
) (
    output wire [DATA_WIDTH-1:0]    instruct, 
    input  wire [ADDRESS_WIDTH-1:0] pcNew
);

reg [DATA_WIDTH-1:0] iMem [0:DEPTH-1]; 

initial 
    begin
        $readmemh("Program 1_Machine Code.txt", iMem);
    end

assign instruct = iMem [pcNew>>2]; //Div by 4

endmodule