module equality #(
    parameter WIDTH  = 32  //DATA_WIDTH  
) ( 
    input     wire  [WIDTH-1:0]            in1, in2,
    output    wire                         equalD
);

assign equalD   =   (in1 == in2);

endmodule