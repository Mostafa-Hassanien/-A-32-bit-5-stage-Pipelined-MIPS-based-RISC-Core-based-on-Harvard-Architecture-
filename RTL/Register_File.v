module Register_File #(
    parameter WIDTH  = 32,  //DATA_WIDTH 
    parameter DEPTH  = 32  //NUMBER_OF_REGISTERS 
) ( 
    output wire  [WIDTH-1:0]            readData1, readData2,
    input  wire  [WIDTH-1:0]            writeData,
    input  wire  [$clog2 (DEPTH)-1:0]   readAddr1, readAddr2, writeAddr,
    input  wire                         writeEnable, 
    input  wire                         clk, 
    input  wire                         reset
);

reg [WIDTH-1:0] MEM [0:DEPTH-1];
integer i;

always @ (negedge clk or negedge reset)
    begin
        if (!reset)
            begin 
                for (i=0; i<DEPTH; i=i+1)
                    begin
                        MEM [i] <= { (WIDTH) {1'b0} };
                    end
            end
        else if (writeEnable) 
            begin
                MEM[writeAddr] <= writeData;
            end
    end 
assign readData1 = MEM[readAddr1];
assign readData2 = MEM[readAddr2];

endmodule