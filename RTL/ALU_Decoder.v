module ALU_Decoder (
    input   wire    [1:0]      aluOp,
    input   wire    [5:0]      func,
    output  reg     [1:0]      aluController
);

localparam   add = 6'b10_0000,
             sub = 6'b10_0010,
             slt = 6'b10_1010,
             mul = 6'b01_1100;

always @(*)
    begin
        case (aluOp)
            2'b00   :    aluController = 2'b00;
            2'b01   :    aluController = 2'b01;
            2'b10   :    begin
                            case (func)
                                add     :   aluController = 2'b00;
                                sub     :   aluController = 2'b01;
                                slt     :   aluController = 2'b11;
                                mul     :   aluController = 2'b10;
                                default :   aluController = 2'b00;
                            endcase
                         end 
            default :   aluController = 2'b00;
        endcase
    end
endmodule