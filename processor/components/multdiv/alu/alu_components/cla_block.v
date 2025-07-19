
module cla_block(data_result, data_operandA, data_operandB, c_out, c_in, f_gen, f_prop);
    input [7:0] data_operandA, data_operandB;
    input c_in, f_gen, f_prop;

    output [7:0] data_result;
    output c_out;

    wire [7:0] carry, gen, prop;

    assign carry[0] = c_in;

    and gen0(gen[0], data_operandA[0], data_operandB[0]);
    and gen1(gen[1], data_operandA[1], data_operandB[1]);
    and gen2(gen[2], data_operandA[2], data_operandB[2]);
    and gen3(gen[3], data_operandA[3], data_operandB[3]);
    and gen4(gen[4], data_operandA[4], data_operandB[4]);
    and gen5(gen[5], data_operandA[5], data_operandB[5]);
    and gen6(gen[6], data_operandA[6], data_operandB[6]);
    and gen7(gen[7], data_operandA[7], data_operandB[7]);

    or prop0(prop[0], data_operandA[0], data_operandB[0]);
    or prop1(prop[1], data_operandA[1], data_operandB[1]);
    or prop2(prop[2], data_operandA[2], data_operandB[2]);
    or prop3(prop[3], data_operandA[3], data_operandB[3]);
    or prop4(prop[4], data_operandA[4], data_operandB[4]);
    or prop5(prop[5], data_operandA[5], data_operandB[5]);
    or prop6(prop[6], data_operandA[6], data_operandB[6]);
    or prop7(prop[7], data_operandA[7], data_operandB[7]);


    wire temp00;
    and op_temp0(temp00, prop[0], carry[0]);
    or carry1(carry[1], gen[0], temp00);


    wire temp10, temp11;
    and op_temp1(temp10, prop[1], gen[0]);
    and op_temp2(temp11, prop[1], prop[0], carry[0]);
    or carry2(carry[2], gen[1], temp10, temp11);

    wire temp20, temp21, temp22;
    and op_temp3(temp20, prop[2], gen[1]);
    and op_temp4(temp21, prop[2], prop[1], gen[0]);
    and op_temp5(temp22, prop[2], prop[1], prop[0], carry[0]);
    or carry3(carry[3], gen[2], temp20, temp21, temp22);

    wire temp30, temp31, temp32, temp33;
    and op_temp6(temp30, prop[3], gen[2]);
    and op_temp7(temp31, prop[3], prop[2], gen[1]);
    and op_temp8(temp32, prop[3], prop[2], prop[1], gen[0]);
    and op_temp9(temp33, prop[3], prop[2], prop[1], prop[0], carry[0]);
    or carry4(carry[4], gen[3], temp30, temp31, temp32, temp33);

    wire temp40, temp41, temp42, temp43, temp44;
    and op_temp10(temp40, prop[4], gen[3]);
    and op_temp11(temp41, prop[4], prop[3], gen[2]);
    and op_temp12(temp42, prop[4], prop[3], prop[2], gen[1]);
    and op_temp13(temp43, prop[4], prop[3], prop[2], prop[1], gen[0]);
    and op_temp14(temp44, prop[4], prop[3], prop[2], prop[1], prop[0], carry[0]);
    or carry5(carry[5], gen[4], temp40, temp41, temp42, temp43, temp44);

    wire temp50, temp51, temp52, temp53, temp54, temp55;
    and op_temp15(temp50, prop[5], gen[4]);
    and op_temp16(temp51, prop[5], prop[4], gen[3]);
    and op_temp17(temp52, prop[5], prop[4], prop[3], gen[2]);
    and op_temp18(temp53, prop[5], prop[4], prop[3], prop[2], gen[1]);
    and op_temp19(temp54, prop[5], prop[4], prop[3], prop[2], prop[1], gen[0]);
    and op_temp20(temp55, prop[5], prop[4], prop[3], prop[2], prop[1], prop[0], carry[0]);
    or carry6(carry[6], gen[5], temp50, temp51, temp52, temp53, temp54, temp55);

    wire temp60, temp61, temp62, temp63, temp64, temp65, temp66;
    and op_temp21(temp60, prop[6], gen[5]);
    and op_temp22(temp61, prop[6], prop[5], gen[4]);
    and op_temp23(temp62, prop[6], prop[5], prop[4], gen[3]);
    and op_temp24(temp63, prop[6], prop[5], prop[4], prop[3], gen[2]);
    and op_temp25(temp64, prop[6], prop[5], prop[4], prop[3], prop[2], gen[1]);
    and op_temp26(temp65, prop[6], prop[5], prop[4], prop[3], prop[2], prop[1], gen[0]);
    and op_temp27(temp66, prop[6], prop[5], prop[4], prop[3], prop[2], prop[1], prop[0], carry[0]);
    or carry7(carry[7], gen[6], temp60, temp61, temp62, temp63, temp64, temp65, temp66);

    wire temp70, temp71, temp72, temp73, temp74, temp75, temp76, temp77;
    and op_temp28(temp70, prop[7], gen[6]);
    and op_temp29(temp71, prop[7], prop[6], gen[5]);
    and op_temp30(temp72, prop[7], prop[6], prop[5], gen[4]);
    and op_temp31(temp73, prop[7], prop[6], prop[5], prop[4], gen[3]);
    and op_temp32(temp74, prop[7], prop[6], prop[5], prop[4], prop[3], gen[2]);
    and op_temp33(temp75, prop[7], prop[6], prop[5], prop[4], prop[3], prop[2], gen[1]);
    and op_temp34(temp76, prop[7], prop[6], prop[5], prop[4], prop[3], prop[2], prop[1], gen[0]);
    and op_temp35(temp77, prop[7], prop[6], prop[5], prop[4], prop[3], prop[2], prop[1], prop[0], carry[0]);
    or carry8(c_out, gen[7], temp70, temp71, temp72, temp73, temp74, temp75, temp76, temp77);

    xor xor0(data_result[0], data_operandA[0], data_operandB[0], carry[0]);
    xor xor1(data_result[1], data_operandA[1], data_operandB[1], carry[1]);
    xor xor2(data_result[2], data_operandA[2], data_operandB[2], carry[2]);
    xor xor3(data_result[3], data_operandA[3], data_operandB[3], carry[3]);
    xor xor4(data_result[4], data_operandA[4], data_operandB[4], carry[4]);
    xor xor5(data_result[5], data_operandA[5], data_operandB[5], carry[5]);
    xor xor6(data_result[6], data_operandA[6], data_operandB[6], carry[6]);
    xor xor7(data_result[7], data_operandA[7], data_operandB[7], carry[7]);

    assign f_gen = gen[7];
    assign f_prop = prop[7];

    

endmodule