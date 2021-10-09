module dataMemory #(
    parameter DATA_WIDTH    = 32,
    parameter ADDRESS_WIDTH = 32,  
    parameter DEPTH         = 128 //NUMBER_OF_ENTRIES
) (
    output wire [DATA_WIDTH-1:0]    readData, 
    output wire [DATA_WIDTH-1:0]    testData,    // For Testing Purposes 
    input  wire [DATA_WIDTH-1:0]    writeData, 
    input  wire [ADDRESS_WIDTH-1:0] addr, 
    input  wire                     writeEnable,
    input  wire                     clk, 
    input  wire                     reset
);
integer i;

reg [DATA_WIDTH-1:0] dMEM [0:DEPTH-1]; 

always @(posedge clk or negedge reset)
    begin 
         if (!reset)
            begin
                for (i = 0; i < DEPTH; i = i + 1)
                    begin
                        dMEM [i] <= {(DATA_WIDTH){1'b0}};
                    end
            end
        else if (writeEnable)
            begin 
                dMEM [addr] <= writeData;
            end
    end

assign readData = dMEM [addr]; //We always read our data asynchronously (regardless of the clock edge)
assign testData = dMEM [{(ADDRESS_WIDTH) {1'b0}}];

endmodule