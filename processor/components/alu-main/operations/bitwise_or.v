module bitwise_or(data_result, data_operandA, data_operandB);

    input [31:0] data_operandA, data_operandB;
    output [31:0] data_result;

    or bit_0(data_result[0], data_operandA[0], data_operandB[0]);
    or bit_1(data_result[1], data_operandA[1], data_operandB[1]);
    or bit_2(data_result[2], data_operandA[2], data_operandB[2]);
    or bit_3(data_result[3], data_operandA[3], data_operandB[3]);
    or bit_4(data_result[4], data_operandA[4], data_operandB[4]);
    or bit_5(data_result[5], data_operandA[5], data_operandB[5]);
    or bit_6(data_result[6], data_operandA[6], data_operandB[6]);
    or bit_7(data_result[7], data_operandA[7], data_operandB[7]);
    or bit_8(data_result[8], data_operandA[8], data_operandB[8]);
    or bit_9(data_result[9], data_operandA[9], data_operandB[9]);
    or bit_10(data_result[10], data_operandA[10], data_operandB[10]);
    or bit_11(data_result[11], data_operandA[11], data_operandB[11]);
    or bit_12(data_result[12], data_operandA[12], data_operandB[12]);
    or bit_13(data_result[13], data_operandA[13], data_operandB[13]);
    or bit_14(data_result[14], data_operandA[14], data_operandB[14]);
    or bit_15(data_result[15], data_operandA[15], data_operandB[15]);
    or bit_16(data_result[16], data_operandA[16], data_operandB[16]);
    or bit_17(data_result[17], data_operandA[17], data_operandB[17]);
    or bit_18(data_result[18], data_operandA[18], data_operandB[18]);
    or bit_19(data_result[19], data_operandA[19], data_operandB[19]);
    or bit_20(data_result[20], data_operandA[20], data_operandB[20]);
    or bit_21(data_result[21], data_operandA[21], data_operandB[21]);
    or bit_22(data_result[22], data_operandA[22], data_operandB[22]);
    or bit_23(data_result[23], data_operandA[23], data_operandB[23]);
    or bit_24(data_result[24], data_operandA[24], data_operandB[24]);
    or bit_25(data_result[25], data_operandA[25], data_operandB[25]);
    or bit_26(data_result[26], data_operandA[26], data_operandB[26]);
    or bit_27(data_result[27], data_operandA[27], data_operandB[27]);
    or bit_28(data_result[28], data_operandA[28], data_operandB[28]);
    or bit_29(data_result[29], data_operandA[29], data_operandB[29]);
    or bit_30(data_result[30], data_operandA[30], data_operandB[30]);
    or bit_31(data_result[31], data_operandA[31], data_operandB[31]);


endmodule