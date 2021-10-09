module signExtend #(
    parameter OUTPUT_WIDTH = 32,
    parameter INPUT_WIDTH  = 16
) (
    output wire [OUTPUT_WIDTH-1:0] dataOut,
    input  wire [INPUT_WIDTH-1:0]  dataIn
);

assign dataOut = {{(OUTPUT_WIDTH-INPUT_WIDTH) {dataIn[INPUT_WIDTH-1]}}, dataIn};

endmodule