module ALU #(
    parameter DATA_WIDTH = 32,
    parameter OP_WIDTH   = 2
) (
    output reg   [DATA_WIDTH-1:0]  aluOut, 
    input  wire  [OP_WIDTH-1:0]    aluFunc,
    input  wire  [DATA_WIDTH-1:0]  A, B
);

localparam ADD   =  2'b00;
localparam SUB   =  2'b01;
localparam MUL   =  2'b10;
localparam SLT   =  2'b11;

always @ (*)
    begin 
        case (aluFunc)
            ADD: aluOut = A + B; 
            SUB: aluOut = A - B;
            MUL: aluOut = A * B;
            SLT: aluOut = (A < B) ? {{(DATA_WIDTH - 1){1'b0}}, 1'b1} :  {(DATA_WIDTH){1'b0}};  
            default: aluOut = {(DATA_WIDTH){1'b0}};
        endcase
    end

endmodule