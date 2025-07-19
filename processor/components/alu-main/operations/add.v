// `include "./cla_block.v"

module add(data_result, data_operandA, data_operandB, overflow);
    input [31:0] data_operandA, data_operandB;
    
    output [31:0] data_result;
    output overflow;
    
    wire [31:0] add_result;

    wire [3:0] gen, prop;
    wire [3:0] carry;

    cla_block adder1(add_result[7:0], data_operandA[7:0], data_operandB[7:0], carry[0], 1'b0, gen[0], prop[0]);

    cla_block adder2(add_result[15:8], data_operandA[15:8], data_operandB[15:8], carry[1], carry[0], gen[1], prop[1]);

    cla_block adder3(add_result[23:16], data_operandA[23:16], data_operandB[23:16], carry[2], carry[1], gen[2], prop[2]);

    cla_block adder4(add_result[31:24], data_operandA[31:24], data_operandB[31:24], carry[3], carry[2], gen[3], prop[3]);

    // assign overflow = carry[3];
    assign overflow = (data_operandA[31] & data_operandB[31] & ~add_result[31]) | (~data_operandA[31] & ~data_operandB[31] & add_result[31]);

    assign data_result = add_result;

endmodule

// TODO: test add.v for correctness