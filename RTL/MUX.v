module MUX #(
    parameter WIDTH = 32
) (
    output wire [WIDTH-1:0] out, 
    input  wire [WIDTH-1:0] in1, in2,
    input  wire             sel
);

assign out = (sel) ? in1 : in2;
    
endmodule