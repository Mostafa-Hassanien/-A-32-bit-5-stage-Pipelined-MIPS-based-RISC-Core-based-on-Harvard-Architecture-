module fetchSatge (
    output wire [31:0] rd, 
    output wire [31:0] pcPlus4F,
    input  wire [31:0] pcF 
);

PC_Adder #(32) pcAdderInstance 
(
    .pcNewValue     (pcPlus4F), 
    .pcCurentValue  (pcF)
);

instructionMemory #(32,32,256) instructionMemoryInstance 
(
    .instruct (rd), 
    .pcNew    (pcF)
);

endmodule