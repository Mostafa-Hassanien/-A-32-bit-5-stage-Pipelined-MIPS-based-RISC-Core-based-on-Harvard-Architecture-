module PC_Adder #(
    parameter WIDTH = 32
) (
    output wire  [WIDTH-1:0] pcNewValue,
    input  wire  [WIDTH-1:0] pcCurentValue
);
 
assign pcNewValue = pcCurentValue + 4; 

endmodule