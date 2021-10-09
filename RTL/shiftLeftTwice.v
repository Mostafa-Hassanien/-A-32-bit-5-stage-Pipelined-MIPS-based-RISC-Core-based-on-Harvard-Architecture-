module shiftLeftTwice #(
    parameter WIDTHOut = 32,
    parameter WIDTHIn  = 32
) (
    output wire [WIDTHOut-1:0] out, 
    input  wire [WIDTHIn-1:0] in
);

assign out = in << 2; 
    
endmodule