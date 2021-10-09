module MUX4X1 #(
    parameter WIDTH = 32
) (
    output reg  [WIDTH-1:0] out, 
    input  wire [WIDTH-1:0] in1, in2, in3,
    input  wire [1:0]       sel
);

always @(*)
    begin
        case (sel)
            2'b00   : out = in1;
            2'b01   : out = in2;
            2'b10   : out = in3;
            default : out = {(WIDTH){1'b0}};
        endcase
    end
endmodule