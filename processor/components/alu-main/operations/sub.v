module sub(data_result, data_operandA, data_operandB, overflow);
    input [31:0] data_operandA, data_operandB;

    wire [31:0] negated_operandB;
    not not0(negated_operandB[0], data_operandB[0]);
    not not1(negated_operandB[1], data_operandB[1]);
    not not2(negated_operandB[2], data_operandB[2]);
    not not3(negated_operandB[3], data_operandB[3]);
    not not4(negated_operandB[4], data_operandB[4]);
    not not5(negated_operandB[5], data_operandB[5]);
    not not6(negated_operandB[6], data_operandB[6]);
    not not7(negated_operandB[7], data_operandB[7]);
    not not8(negated_operandB[8], data_operandB[8]);
    not not9(negated_operandB[9], data_operandB[9]);
    not not10(negated_operandB[10], data_operandB[10]);
    not not11(negated_operandB[11], data_operandB[11]);
    not not12(negated_operandB[12], data_operandB[12]);
    not not13(negated_operandB[13], data_operandB[13]);
    not not14(negated_operandB[14], data_operandB[14]);
    not not15(negated_operandB[15], data_operandB[15]);
    not not16(negated_operandB[16], data_operandB[16]);
    not not17(negated_operandB[17], data_operandB[17]);
    not not18(negated_operandB[18], data_operandB[18]);
    not not19(negated_operandB[19], data_operandB[19]);
    not not20(negated_operandB[20], data_operandB[20]);
    not not21(negated_operandB[21], data_operandB[21]);
    not not22(negated_operandB[22], data_operandB[22]);
    not not23(negated_operandB[23], data_operandB[23]);
    not not24(negated_operandB[24], data_operandB[24]);
    not not25(negated_operandB[25], data_operandB[25]);
    not not26(negated_operandB[26], data_operandB[26]);
    not not27(negated_operandB[27], data_operandB[27]);
    not not28(negated_operandB[28], data_operandB[28]);
    not not29(negated_operandB[29], data_operandB[29]);
    not not30(negated_operandB[30], data_operandB[30]);
    not not31(negated_operandB[31], data_operandB[31]);


    wire [31:0] new_data_operandB;

    wire one_overflow;

    add init(new_data_operandB, 32'b1, negated_operandB, one_overflow);

    
    output [31:0] data_result;
    output overflow;

    wire sub_ovf;

    
    assign overflow = (~data_operandA[31] & data_operandB[31] & data_result[31]) | (data_operandA[31] & ~data_operandB[31] & ~data_result[31]);

    add sub(data_result, data_operandA, new_data_operandB, sub_ovf);

endmodule

// TODO: test add.v for correctness