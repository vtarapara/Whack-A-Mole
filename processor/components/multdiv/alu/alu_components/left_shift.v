
module left_shift(data_result, data_operandA, ctrl_shiftamt);
        
    input [31:0] data_operandA;
    input [4:0] ctrl_shiftamt;

    output [31:0] data_result;

    wire [31:0] left_shift_result_1, left_shift_result_2, left_shift_result_3, left_shift_result_4, left_shift_result_5;



    // left shift 1st LSB
    assign left_shift_result_1[0] = ctrl_shiftamt[0] ? 0 : data_operandA[0];
    assign left_shift_result_1[1] = ctrl_shiftamt[0] ? data_operandA[0] : data_operandA[1];
    assign left_shift_result_1[2] = ctrl_shiftamt[0] ? data_operandA[1] : data_operandA[2];
    assign left_shift_result_1[3] = ctrl_shiftamt[0] ? data_operandA[2] : data_operandA[3];
    assign left_shift_result_1[4] = ctrl_shiftamt[0] ? data_operandA[3] : data_operandA[4];
    assign left_shift_result_1[5] = ctrl_shiftamt[0] ? data_operandA[4] : data_operandA[5];
    assign left_shift_result_1[6] = ctrl_shiftamt[0] ? data_operandA[5] : data_operandA[6];
    assign left_shift_result_1[7] = ctrl_shiftamt[0] ? data_operandA[6] : data_operandA[7];
    assign left_shift_result_1[8] = ctrl_shiftamt[0] ? data_operandA[7] : data_operandA[8];
    assign left_shift_result_1[9] = ctrl_shiftamt[0] ? data_operandA[8] : data_operandA[9];
    assign left_shift_result_1[10] = ctrl_shiftamt[0] ? data_operandA[9] : data_operandA[10];
    assign left_shift_result_1[11] = ctrl_shiftamt[0] ? data_operandA[10] : data_operandA[11];
    assign left_shift_result_1[12] = ctrl_shiftamt[0] ? data_operandA[11] : data_operandA[12];
    assign left_shift_result_1[13] = ctrl_shiftamt[0] ? data_operandA[12] : data_operandA[13];
    assign left_shift_result_1[14] = ctrl_shiftamt[0] ? data_operandA[13] : data_operandA[14];
    assign left_shift_result_1[15] = ctrl_shiftamt[0] ? data_operandA[14] : data_operandA[15];
    assign left_shift_result_1[16] = ctrl_shiftamt[0] ? data_operandA[15] : data_operandA[16];
    assign left_shift_result_1[17] = ctrl_shiftamt[0] ? data_operandA[16] : data_operandA[17];
    assign left_shift_result_1[18] = ctrl_shiftamt[0] ? data_operandA[17] : data_operandA[18];
    assign left_shift_result_1[19] = ctrl_shiftamt[0] ? data_operandA[18] : data_operandA[19];
    assign left_shift_result_1[20] = ctrl_shiftamt[0] ? data_operandA[19] : data_operandA[20];
    assign left_shift_result_1[21] = ctrl_shiftamt[0] ? data_operandA[20] : data_operandA[21];
    assign left_shift_result_1[22] = ctrl_shiftamt[0] ? data_operandA[21] : data_operandA[22];
    assign left_shift_result_1[23] = ctrl_shiftamt[0] ? data_operandA[22] : data_operandA[23];
    assign left_shift_result_1[24] = ctrl_shiftamt[0] ? data_operandA[23] : data_operandA[24];
    assign left_shift_result_1[25] = ctrl_shiftamt[0] ? data_operandA[24] : data_operandA[25];
    assign left_shift_result_1[26] = ctrl_shiftamt[0] ? data_operandA[25] : data_operandA[26];
    assign left_shift_result_1[27] = ctrl_shiftamt[0] ? data_operandA[26] : data_operandA[27];
    assign left_shift_result_1[28] = ctrl_shiftamt[0] ? data_operandA[27] : data_operandA[28];
    assign left_shift_result_1[29] = ctrl_shiftamt[0] ? data_operandA[28] : data_operandA[29];
    assign left_shift_result_1[30] = ctrl_shiftamt[0] ? data_operandA[29] : data_operandA[30];
    assign left_shift_result_1[31] = ctrl_shiftamt[0] ? data_operandA[30] : data_operandA[31];

    // left shift 2nd LSB
    assign left_shift_result_2[0] = ctrl_shiftamt[1] ? 0 : left_shift_result_1[0];
    assign left_shift_result_2[1] = ctrl_shiftamt[1] ? 0 : left_shift_result_1[1];
    assign left_shift_result_2[2] = ctrl_shiftamt[1] ? left_shift_result_1[0] : left_shift_result_1[2];
    assign left_shift_result_2[3] = ctrl_shiftamt[1] ? left_shift_result_1[1] : left_shift_result_1[3];
    assign left_shift_result_2[4] = ctrl_shiftamt[1] ? left_shift_result_1[2] : left_shift_result_1[4];
    assign left_shift_result_2[5] = ctrl_shiftamt[1] ? left_shift_result_1[3] : left_shift_result_1[5];
    assign left_shift_result_2[6] = ctrl_shiftamt[1] ? left_shift_result_1[4] : left_shift_result_1[6];
    assign left_shift_result_2[7] = ctrl_shiftamt[1] ? left_shift_result_1[5] : left_shift_result_1[7];
    assign left_shift_result_2[8] = ctrl_shiftamt[1] ? left_shift_result_1[6] : left_shift_result_1[8];
    assign left_shift_result_2[9] = ctrl_shiftamt[1] ? left_shift_result_1[7] : left_shift_result_1[9];
    assign left_shift_result_2[10] = ctrl_shiftamt[1] ? left_shift_result_1[8] : left_shift_result_1[10];
    assign left_shift_result_2[11] = ctrl_shiftamt[1] ? left_shift_result_1[9] : left_shift_result_1[11];
    assign left_shift_result_2[12] = ctrl_shiftamt[1] ? left_shift_result_1[10] : left_shift_result_1[12];
    assign left_shift_result_2[13] = ctrl_shiftamt[1] ? left_shift_result_1[11] : left_shift_result_1[13];
    assign left_shift_result_2[14] = ctrl_shiftamt[1] ? left_shift_result_1[12] : left_shift_result_1[14];
    assign left_shift_result_2[15] = ctrl_shiftamt[1] ? left_shift_result_1[13] : left_shift_result_1[15];
    assign left_shift_result_2[16] = ctrl_shiftamt[1] ? left_shift_result_1[14] : left_shift_result_1[16];
    assign left_shift_result_2[17] = ctrl_shiftamt[1] ? left_shift_result_1[15] : left_shift_result_1[17];
    assign left_shift_result_2[18] = ctrl_shiftamt[1] ? left_shift_result_1[16] : left_shift_result_1[18];
    assign left_shift_result_2[19] = ctrl_shiftamt[1] ? left_shift_result_1[17] : left_shift_result_1[19];
    assign left_shift_result_2[20] = ctrl_shiftamt[1] ? left_shift_result_1[18] : left_shift_result_1[20];
    assign left_shift_result_2[21] = ctrl_shiftamt[1] ? left_shift_result_1[19] : left_shift_result_1[21];
    assign left_shift_result_2[22] = ctrl_shiftamt[1] ? left_shift_result_1[20] : left_shift_result_1[22];
    assign left_shift_result_2[23] = ctrl_shiftamt[1] ? left_shift_result_1[21] : left_shift_result_1[23];
    assign left_shift_result_2[24] = ctrl_shiftamt[1] ? left_shift_result_1[22] : left_shift_result_1[24];
    assign left_shift_result_2[25] = ctrl_shiftamt[1] ? left_shift_result_1[23] : left_shift_result_1[25];
    assign left_shift_result_2[26] = ctrl_shiftamt[1] ? left_shift_result_1[24] : left_shift_result_1[26];
    assign left_shift_result_2[27] = ctrl_shiftamt[1] ? left_shift_result_1[25] : left_shift_result_1[27];
    assign left_shift_result_2[28] = ctrl_shiftamt[1] ? left_shift_result_1[26] : left_shift_result_1[28];
    assign left_shift_result_2[29] = ctrl_shiftamt[1] ? left_shift_result_1[27] : left_shift_result_1[29];
    assign left_shift_result_2[30] = ctrl_shiftamt[1] ? left_shift_result_1[28] : left_shift_result_1[30];
    assign left_shift_result_2[31] = ctrl_shiftamt[1] ? left_shift_result_1[29] : left_shift_result_1[31];


    // left shift 3th LSB
    assign left_shift_result_3[0] = ctrl_shiftamt[2] ? 0 : left_shift_result_2[0];
    assign left_shift_result_3[1] = ctrl_shiftamt[2] ? 0 : left_shift_result_2[1];
    assign left_shift_result_3[2] = ctrl_shiftamt[2] ? 0 : left_shift_result_2[2];
    assign left_shift_result_3[3] = ctrl_shiftamt[2] ? 0 : left_shift_result_2[3];
    assign left_shift_result_3[4] = ctrl_shiftamt[2] ? left_shift_result_2[0] : left_shift_result_2[4];
    assign left_shift_result_3[5] = ctrl_shiftamt[2] ? left_shift_result_2[1] : left_shift_result_2[5];
    assign left_shift_result_3[6] = ctrl_shiftamt[2] ? left_shift_result_2[2] : left_shift_result_2[6];
    assign left_shift_result_3[7] = ctrl_shiftamt[2] ? left_shift_result_2[3] : left_shift_result_2[7];
    assign left_shift_result_3[8] = ctrl_shiftamt[2] ? left_shift_result_2[4] : left_shift_result_2[8];
    assign left_shift_result_3[9] = ctrl_shiftamt[2] ? left_shift_result_2[5] : left_shift_result_2[9];
    assign left_shift_result_3[10] = ctrl_shiftamt[2] ? left_shift_result_2[6] : left_shift_result_2[10];
    assign left_shift_result_3[11] = ctrl_shiftamt[2] ? left_shift_result_2[7] : left_shift_result_2[11];
    assign left_shift_result_3[12] = ctrl_shiftamt[2] ? left_shift_result_2[8] : left_shift_result_2[12];
    assign left_shift_result_3[13] = ctrl_shiftamt[2] ? left_shift_result_2[9] : left_shift_result_2[13];
    assign left_shift_result_3[14] = ctrl_shiftamt[2] ? left_shift_result_2[10] : left_shift_result_2[14];
    assign left_shift_result_3[15] = ctrl_shiftamt[2] ? left_shift_result_2[11] : left_shift_result_2[15];
    assign left_shift_result_3[16] = ctrl_shiftamt[2] ? left_shift_result_2[12] : left_shift_result_2[16];
    assign left_shift_result_3[17] = ctrl_shiftamt[2] ? left_shift_result_2[13] : left_shift_result_2[17];
    assign left_shift_result_3[18] = ctrl_shiftamt[2] ? left_shift_result_2[14] : left_shift_result_2[18];
    assign left_shift_result_3[19] = ctrl_shiftamt[2] ? left_shift_result_2[15] : left_shift_result_2[19];
    assign left_shift_result_3[20] = ctrl_shiftamt[2] ? left_shift_result_2[16] : left_shift_result_2[20];
    assign left_shift_result_3[21] = ctrl_shiftamt[2] ? left_shift_result_2[17] : left_shift_result_2[21];
    assign left_shift_result_3[22] = ctrl_shiftamt[2] ? left_shift_result_2[18] : left_shift_result_2[22];
    assign left_shift_result_3[23] = ctrl_shiftamt[2] ? left_shift_result_2[19] : left_shift_result_2[23];
    assign left_shift_result_3[24] = ctrl_shiftamt[2] ? left_shift_result_2[20] : left_shift_result_2[24];
    assign left_shift_result_3[25] = ctrl_shiftamt[2] ? left_shift_result_2[21] : left_shift_result_2[25];
    assign left_shift_result_3[26] = ctrl_shiftamt[2] ? left_shift_result_2[22] : left_shift_result_2[26];
    assign left_shift_result_3[27] = ctrl_shiftamt[2] ? left_shift_result_2[23] : left_shift_result_2[27];
    assign left_shift_result_3[28] = ctrl_shiftamt[2] ? left_shift_result_2[24] : left_shift_result_2[28];
    assign left_shift_result_3[29] = ctrl_shiftamt[2] ? left_shift_result_2[25] : left_shift_result_2[29];
    assign left_shift_result_3[30] = ctrl_shiftamt[2] ? left_shift_result_2[26] : left_shift_result_2[30];
    assign left_shift_result_3[31] = ctrl_shiftamt[2] ? left_shift_result_2[27] : left_shift_result_2[31];

    // left shift 4th LSB
    assign left_shift_result_4[0] = ctrl_shiftamt[3] ? 0 : left_shift_result_3[0];
    assign left_shift_result_4[1] = ctrl_shiftamt[3] ? 0 : left_shift_result_3[1];
    assign left_shift_result_4[2] = ctrl_shiftamt[3] ? 0 : left_shift_result_3[2];
    assign left_shift_result_4[3] = ctrl_shiftamt[3] ? 0 : left_shift_result_3[3];
    assign left_shift_result_4[4] = ctrl_shiftamt[3] ? 0 : left_shift_result_3[4];
    assign left_shift_result_4[5] = ctrl_shiftamt[3] ? 0 : left_shift_result_3[5];
    assign left_shift_result_4[6] = ctrl_shiftamt[3] ? 0 : left_shift_result_3[6];
    assign left_shift_result_4[7] = ctrl_shiftamt[3] ? 0 : left_shift_result_3[7];
    assign left_shift_result_4[8] = ctrl_shiftamt[3] ? left_shift_result_3[0] : left_shift_result_3[8];
    assign left_shift_result_4[9] = ctrl_shiftamt[3] ? left_shift_result_3[1] : left_shift_result_3[9];
    assign left_shift_result_4[10] = ctrl_shiftamt[3] ? left_shift_result_3[2] : left_shift_result_3[10];
    assign left_shift_result_4[11] = ctrl_shiftamt[3] ? left_shift_result_3[3] : left_shift_result_3[11];
    assign left_shift_result_4[12] = ctrl_shiftamt[3] ? left_shift_result_3[4] : left_shift_result_3[12];
    assign left_shift_result_4[13] = ctrl_shiftamt[3] ? left_shift_result_3[5] : left_shift_result_3[13];
    assign left_shift_result_4[14] = ctrl_shiftamt[3] ? left_shift_result_3[6] : left_shift_result_3[14];
    assign left_shift_result_4[15] = ctrl_shiftamt[3] ? left_shift_result_3[7] : left_shift_result_3[15];
    assign left_shift_result_4[16] = ctrl_shiftamt[3] ? left_shift_result_3[8] : left_shift_result_3[16];
    assign left_shift_result_4[17] = ctrl_shiftamt[3] ? left_shift_result_3[9] : left_shift_result_3[17];
    assign left_shift_result_4[18] = ctrl_shiftamt[3] ? left_shift_result_3[10] : left_shift_result_3[18];
    assign left_shift_result_4[19] = ctrl_shiftamt[3] ? left_shift_result_3[11] : left_shift_result_3[19];
    assign left_shift_result_4[20] = ctrl_shiftamt[3] ? left_shift_result_3[12] : left_shift_result_3[20];
    assign left_shift_result_4[21] = ctrl_shiftamt[3] ? left_shift_result_3[13] : left_shift_result_3[21];
    assign left_shift_result_4[22] = ctrl_shiftamt[3] ? left_shift_result_3[14] : left_shift_result_3[22];
    assign left_shift_result_4[23] = ctrl_shiftamt[3] ? left_shift_result_3[15] : left_shift_result_3[23];
    assign left_shift_result_4[24] = ctrl_shiftamt[3] ? left_shift_result_3[16] : left_shift_result_3[24];
    assign left_shift_result_4[25] = ctrl_shiftamt[3] ? left_shift_result_3[17] : left_shift_result_3[25];
    assign left_shift_result_4[26] = ctrl_shiftamt[3] ? left_shift_result_3[18] : left_shift_result_3[26];
    assign left_shift_result_4[27] = ctrl_shiftamt[3] ? left_shift_result_3[19] : left_shift_result_3[27];
    assign left_shift_result_4[28] = ctrl_shiftamt[3] ? left_shift_result_3[20] : left_shift_result_3[28];
    assign left_shift_result_4[29] = ctrl_shiftamt[3] ? left_shift_result_3[21] : left_shift_result_3[29];
    assign left_shift_result_4[30] = ctrl_shiftamt[3] ? left_shift_result_3[22] : left_shift_result_3[30];
    assign left_shift_result_4[31] = ctrl_shiftamt[3] ? left_shift_result_3[23] : left_shift_result_3[31];

    // left shift 5th LSB
    assign left_shift_result_5[0] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[0];
    assign left_shift_result_5[1] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[1];
    assign left_shift_result_5[2] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[2];
    assign left_shift_result_5[3] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[3];
    assign left_shift_result_5[4] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[4];
    assign left_shift_result_5[5] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[5];
    assign left_shift_result_5[6] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[6];
    assign left_shift_result_5[7] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[7];
    assign left_shift_result_5[8] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[8];
    assign left_shift_result_5[9] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[9];
    assign left_shift_result_5[10] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[10];
    assign left_shift_result_5[11] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[11];
    assign left_shift_result_5[12] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[12];
    assign left_shift_result_5[13] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[13];
    assign left_shift_result_5[14] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[14];
    assign left_shift_result_5[15] = ctrl_shiftamt[4] ? 0 : left_shift_result_4[15];
    assign left_shift_result_5[16] = ctrl_shiftamt[4] ? left_shift_result_4[0] : left_shift_result_4[16];
    assign left_shift_result_5[17] = ctrl_shiftamt[4] ? left_shift_result_4[1] : left_shift_result_4[17];
    assign left_shift_result_5[18] = ctrl_shiftamt[4] ? left_shift_result_4[2] : left_shift_result_4[18];
    assign left_shift_result_5[19] = ctrl_shiftamt[4] ? left_shift_result_4[3] : left_shift_result_4[19];
    assign left_shift_result_5[20] = ctrl_shiftamt[4] ? left_shift_result_4[4] : left_shift_result_4[20];
    assign left_shift_result_5[21] = ctrl_shiftamt[4] ? left_shift_result_4[5] : left_shift_result_4[21];
    assign left_shift_result_5[22] = ctrl_shiftamt[4] ? left_shift_result_4[6] : left_shift_result_4[22];
    assign left_shift_result_5[23] = ctrl_shiftamt[4] ? left_shift_result_4[7] : left_shift_result_4[23];
    assign left_shift_result_5[24] = ctrl_shiftamt[4] ? left_shift_result_4[8] : left_shift_result_4[24];
    assign left_shift_result_5[25] = ctrl_shiftamt[4] ? left_shift_result_4[9] : left_shift_result_4[25];
    assign left_shift_result_5[26] = ctrl_shiftamt[4] ? left_shift_result_4[10] : left_shift_result_4[26];
    assign left_shift_result_5[27] = ctrl_shiftamt[4] ? left_shift_result_4[11] : left_shift_result_4[27];
    assign left_shift_result_5[28] = ctrl_shiftamt[4] ? left_shift_result_4[12] : left_shift_result_4[28];
    assign left_shift_result_5[29] = ctrl_shiftamt[4] ? left_shift_result_4[13] : left_shift_result_4[29];
    assign left_shift_result_5[30] = ctrl_shiftamt[4] ? left_shift_result_4[14] : left_shift_result_4[30];
    assign left_shift_result_5[31] = ctrl_shiftamt[4] ? left_shift_result_4[15] : left_shift_result_4[31];


    assign data_result = left_shift_result_5;
    
endmodule