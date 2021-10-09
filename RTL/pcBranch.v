module pcBranch #(
    parameter WIDTH = 32
) (
    output wire [WIDTH-1:0] pcBranch, 
    input  wire [WIDTH-1:0] shiftedSignImm,
    input  wire [WIDTH-1:0] pcPlusFour
);

assign pcBranch = shiftedSignImm + pcPlusFour; 

endmodule