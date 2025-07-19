// `include "../alu/alu.v"
// `include "../alu/mult_alu_wrapper.v"
// `include "../alu/alu_components/add.v"
// `include "../alu/alu_components/sub.v"
// `include "../alu/alu_components/bitwise_or.v"
// `include "../alu/alu_components/bitwise_and.v"
// `include "../alu/alu_components/left_shift.v"
// `include "../alu/alu_components/right_shift.v"
// `include "../alu/alu_components/right_shift_64.v"
// `include "../alu/alu_components/cla_block.v"
// `include "../alu/alu_components/mux32.v"

 module multiplier(mult_result, data_resultRDY, data_exception, multiplicand, multiplier);

    input [31:0] multiplicand, multiplier;
    output [31:0] mult_result;
    output data_resultRDY, data_exception;

    // steps[0] is the holding bit
    wire [65:0] steps[64:0];

    wire [31:0] not_multiplicand;
    wire dummy_wireA, dummy_wireB, dummy_wireC;
    alu negate_multiplicand(1'b0, multiplicand, 1'b1, 1'b0, not_multiplicand, dummy_wireA, dummy_wireB, dummy_wireC);

    wire final_sign;
    xor final_sign_xor(final_sign, multiplicand[31], multiplier[31]);





    // load multiplier into first step
    assign steps[0][32:1] = multiplier;
    assign steps[0][0] = 0;

    // start first fetch
    wire overflow1, overflow2, overflow3, overflow4, overflow5, overflow6, overflow7, overflow8, overflow9, overflow10, overflow11, overflow12, overflow13, overflow14, overflow15, overflow16, overflow17, overflow18, overflow19, overflow20, overflow21, overflow22, overflow23, overflow24, overflow25, overflow26, overflow27, overflow28, overflow29, overflow30, overflow31, overflow32, overflow33, overflow34, overflow35, overflow36, overflow37, overflow38, overflow39, overflow40, overflow41, overflow42, overflow43, overflow44, overflow45, overflow46, overflow47, overflow48, overflow49, overflow50, overflow51, overflow52, overflow53, overflow54, overflow55, overflow56, overflow57, overflow58, overflow59, overflow60, overflow61, overflow62, overflow63, overflow64;

    wire [64:0] step0, step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, step12, step13, step14, step15, step16, step17, step18, step19, step20, step21, step22, step23, step24, step25, step26, step27, step28, step29, step30, step31, step32, step33, step34, step35, step36, step37, step38, step39, step40, step41, step42, step43, step44, step45, step46, step47, step48, step49, step50, step51, step52, step53, step54, step55, step56, step57, step58, step59, step60, step61, step62, step63, step64, step65;

    assign step0[32:1] = multiplier;
    assign step0[0] = 0;
    
    wire [31:0] start;
    assign start = 1'b0;

    mult_alu_wrapper fetch1(step0[64:33], overflow1, start, multiplicand, not_multiplicand, {step0[1], step0[0]});
    // assign step1 = step0 >>> 1'b1;
    right_shift_64 shift_step1(step1, step0);
    

    // second fetch
    mult_alu_wrapper fetch2(step2[64:33], overflow2, step1[64:33], multiplicand, not_multiplicand, {step1[1], step1[0]});
    assign step2[32:0] = step1[32:0];
    // assign step3 = step2 >>> 1'b1;
    right_shift_64 shift_step3(step3, step2);

    // third fetch
    mult_alu_wrapper fetch3(step4[64:33], overflow3, step3[64:33], multiplicand, not_multiplicand, {step3[1], step3[0]});
    assign step4[32:0] = step3[32:0];
    // assign step5 = step4 >>> 1'b1;
    right_shift_64 shift_step5(step5, step4);

    mult_alu_wrapper fetch4(step6[64:33], overflow4, step5[64:33], multiplicand, not_multiplicand, {step5[1], step5[0]});
    assign step6[32:0] = step5[32:0];
    // assign step7 = step6 >>> 1'b1;
    right_shift_64 shift_step7(step7, step6);

    mult_alu_wrapper fetch5(step8[64:33], overflow5, step7[64:33], multiplicand, not_multiplicand, {step7[1], step7[0]});
    assign step8[32:0] = step7[32:0];
    // assign step9 = step8 >>> 1'b1;
    right_shift_64 shift_step9(step9, step8);

    mult_alu_wrapper fetch6(step10[64:33], overflow6, step9[64:33], multiplicand, not_multiplicand, {step9[1], step9[0]});
    assign step10[32:0] = step9[32:0];
    // assign step11 = step10 >>> 1'b1;
    right_shift_64 shift_step11(step11, step10);

    mult_alu_wrapper fetch7(step12[64:33], overflow7, step11[64:33], multiplicand, not_multiplicand, {step11[1], step11[0]});
    assign step12[32:0] = step11[32:0];
    // assign step13 = step12 >>> 1'b1;
    right_shift_64 shift_step13(step13, step12);

    mult_alu_wrapper fetch8(step14[64:33], overflow8, step13[64:33], multiplicand, not_multiplicand, {step13[1], step13[0]});
    assign step14[32:0] = step13[32:0];
    // assign step15 = step14 >>> 1'b1;
    right_shift_64 shift_step15(step15, step14);

    mult_alu_wrapper fetch9(step16[64:33], overflow9, step15[64:33], multiplicand, not_multiplicand, {step15[1], step15[0]});
    assign step16[32:0] = step15[32:0];
    // assign step17 = step16 >>> 1'b1;
    right_shift_64 shift_step17(step17, step16);

    mult_alu_wrapper fetch10(step18[64:33], overflow10, step17[64:33], multiplicand, not_multiplicand, {step17[1], step17[0]});
    assign step18[32:0] = step17[32:0];
    // assign step19 = step18 >>> 1'b1;
    right_shift_64 shift_step19(step19, step18);

    mult_alu_wrapper fetch11(step20[64:33], overflow11, step19[64:33], multiplicand, not_multiplicand, {step19[1], step19[0]});
    assign step20[32:0] = step19[32:0];
    // assign step21 = step20 >>> 1'b1;
    right_shift_64 shift_step21(step21, step20);

    mult_alu_wrapper fetch12(step22[64:33], overflow12, step21[64:33], multiplicand, not_multiplicand, {step21[1], step21[0]});
    assign step22[32:0] = step21[32:0];
    // assign step23 = step22 >>> 1'b1;
    right_shift_64 shift_step23(step23, step22);

    mult_alu_wrapper fetch13(step24[64:33], overflow13, step23[64:33], multiplicand, not_multiplicand, {step23[1], step23[0]});
    assign step24[32:0] = step23[32:0];
    // assign step25 = step24 >>> 1'b1;
    right_shift_64 shift_step25(step25, step24);

    mult_alu_wrapper fetch14(step26[64:33], overflow14, step25[64:33], multiplicand, not_multiplicand, {step25[1], step25[0]});
    assign step26[32:0] = step25[32:0];
    // assign step27 = step26 >>> 1'b1;
    right_shift_64 shift_step27(step27, step26);

    mult_alu_wrapper fetch15(step28[64:33], overflow15, step27[64:33], multiplicand, not_multiplicand, {step27[1], step27[0]});
    assign step28[32:0] = step27[32:0];
    // assign step29 = step28 >>> 1'b1;
    right_shift_64 shift_step29(step29, step28);

    mult_alu_wrapper fetch16(step30[64:33], overflow16, step29[64:33], multiplicand, not_multiplicand, {step29[1], step29[0]});
    assign step30[32:0] = step29[32:0];
    // assign step31 = step30 >>> 1'b1;
    right_shift_64 shift_step31(step31, step30);

    mult_alu_wrapper fetch17(step32[64:33], overflow17, step31[64:33], multiplicand, not_multiplicand, {step31[1], step31[0]});
    assign step32[32:0] = step31[32:0];
    // assign step33 = step32 >>> 1'b1;
    right_shift_64 shift_step33(step33, step32);

    mult_alu_wrapper fetch18(step34[64:33], overflow18, step33[64:33], multiplicand, not_multiplicand, {step33[1], step33[0]});
    assign step34[32:0] = step33[32:0];
    // assign step35 = step34 >>> 1'b1;
    right_shift_64 shift_step35(step35, step34);

    mult_alu_wrapper fetch19(step36[64:33], overflow19, step35[64:33], multiplicand, not_multiplicand, {step35[1], step35[0]});
    assign step36[32:0] = step35[32:0];
    // assign step37 = step36 >>> 1'b1;
    right_shift_64 shift_step37(step37, step36);

    mult_alu_wrapper fetch20(step38[64:33], overflow20, step37[64:33], multiplicand, not_multiplicand, {step37[1], step37[0]});
    assign step38[32:0] = step37[32:0];
    // assign step39 = step38 >>> 1'b1;
    right_shift_64 shift_step39(step39, step38);

    mult_alu_wrapper fetch21(step40[64:33], overflow21, step39[64:33], multiplicand, not_multiplicand, {step39[1], step39[0]});
    assign step40[32:0] = step39[32:0];
    // assign step41 = step40 >>> 1'b1;
    right_shift_64 shift_step41(step41, step40);

    mult_alu_wrapper fetch22(step42[64:33], overflow22, step41[64:33], multiplicand, not_multiplicand, {step41[1], step41[0]});
    assign step42[32:0] = step41[32:0];
    // assign step43 = step42 >>> 1'b1;
    right_shift_64 shift_step43(step43, step42);

    mult_alu_wrapper fetch23(step44[64:33], overflow23, step43[64:33], multiplicand, not_multiplicand, {step43[1], step43[0]});
    assign step44[32:0] = step43[32:0];
    // assign step45 = step44 >>> 1'b1;
    right_shift_64 shift_step45(step45, step44);

    mult_alu_wrapper fetch24(step46[64:33], overflow24, step45[64:33], multiplicand, not_multiplicand, {step45[1], step45[0]});
    assign step46[32:0] = step45[32:0];
    // assign step47 = step46 >>> 1'b1;
    right_shift_64 shift_step47(step47, step46);

    mult_alu_wrapper fetch25(step48[64:33], overflow25, step47[64:33], multiplicand, not_multiplicand, {step47[1], step47[0]});
    assign step48[32:0] = step47[32:0];
    // assign step49 = step48 >>> 1'b1;
    right_shift_64 shift_step49(step49, step48);

    mult_alu_wrapper fetch26(step50[64:33], overflow26, step49[64:33], multiplicand, not_multiplicand, {step49[1], step49[0]});
    assign step50[32:0] = step49[32:0];
    // assign step51 = step50 >>> 1'b1;
    right_shift_64 shift_step51(step51, step50);

    mult_alu_wrapper fetch27(step52[64:33], overflow27, step51[64:33], multiplicand, not_multiplicand, {step51[1], step51[0]});
    assign step52[32:0] = step51[32:0];
    // assign step53 = step52 >>> 1'b1;
    right_shift_64 shift_step53(step53, step52);

    mult_alu_wrapper fetch28(step54[64:33], overflow28, step53[64:33], multiplicand, not_multiplicand, {step53[1], step53[0]});
    assign step54[32:0] = step53[32:0];
    // assign step55 = step54 >>> 1'b1;
    right_shift_64 shift_step55(step55, step54);

    mult_alu_wrapper fetch29(step56[64:33], overflow29, step55[64:33], multiplicand, not_multiplicand, {step55[1], step55[0]});
    assign step56[32:0] = step55[32:0];
    // assign step57 = step56 >>> 1'b1;
    right_shift_64 shift_step57(step57, step56);

    mult_alu_wrapper fetch30(step58[64:33], overflow30, step57[64:33], multiplicand, not_multiplicand, {step57[1], step57[0]});
    assign step58[32:0] = step57[32:0];
    // assign step59 = step58 >>> 1'b1;
    right_shift_64 shift_step59(step59, step58);

    mult_alu_wrapper fetch31(step60[64:33], overflow31, step59[64:33], multiplicand, not_multiplicand, {step59[1], step59[0]});
    assign step60[32:0] = step59[32:0];
    // assign step61 = step60 >>> 1'b1;
    right_shift_64 shift_step61(step61, step60);

    mult_alu_wrapper fetch32(step62[64:33], overflow32, step61[64:33], multiplicand, not_multiplicand, {step61[1], step61[0]});
    assign step62[32:0] = step61[32:0];
    // assign step63 = step62 >>> 1'b1;
    right_shift_64 shift_step63(step63, step62);

    assign step65 = step63;

    wire all_ones, all_zeros;

    and zeros(all_zeros, ~step65[33], ~step65[34], ~step65[35], ~step65[36], ~step65[37], ~step65[38], ~step65[39], ~step65[40], ~step65[41], ~step65[42], ~step65[43], ~step65[44], ~step65[45], ~step65[46], ~step65[47], ~step65[48], ~step65[49], ~step65[50], ~step65[51], ~step65[52], ~step65[53], ~step65[54], ~step65[55], ~step65[56], ~step65[57], ~step65[58], ~step65[59], ~step65[60], ~step65[61], ~step65[62], ~step65[63], ~step65[64]);
    and ones(all_ones, step65[33], step65[34], step65[35], step65[36], step65[37], step65[38], step65[39], step65[40], step65[41], step65[42], step65[43], step65[44], step65[45], step65[46], step65[47], step65[48], step65[49], step65[50], step65[51], step65[52], step65[53], step65[54], step65[55], step65[56], step65[57], step65[58], step65[59], step65[60], step65[61], step65[62], step65[63], step65[64]);

    assign mult_result = step65[32:1];


    wire result_is_zero;
    assign result_is_zero = ~|step65[32:1];

    wire zero_exception, one_exception, incorrect_sign, hold;
    and zero(zero_exception, ~all_zeros, ~(final_sign & ~result_is_zero));
    and one(one_exception, ~all_ones, (final_sign & ~result_is_zero));


    xor incorrect_sign_xor(hold, final_sign, step65[32]);

    and all_zero_exception(incorrect_sign, hold, ~result_is_zero);

    assign data_exception = incorrect_sign | zero_exception | one_exception; 
    assign data_resultRDY = 1'b1;

endmodule
