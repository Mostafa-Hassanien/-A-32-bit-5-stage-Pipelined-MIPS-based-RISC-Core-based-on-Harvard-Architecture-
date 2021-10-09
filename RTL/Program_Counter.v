module Program_Counter #(
    parameter WIDTH = 32
) (
    output reg  [WIDTH-1:0] pcNew, 
    input  wire [WIDTH-1:0] pcOld,
    input  wire             clk,
    input  wire             reset,
    input  wire             enable
);

always @ (posedge clk or negedge reset)
    begin 
        if (!reset)
            begin 
                pcNew <= { (WIDTH) {1'b0} };
            end
        else if(!enable)
            begin
                pcNew <= pcOld; 
            end  
    end 
    
endmodule