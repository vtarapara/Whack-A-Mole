
module booth_multiplier(out, data_exception, in, multiplicand, multiplier);
    input [64:0] in; 
    input [31:0] multiplicand, multiplier;
    output [64:0] out;
    output data_exception;

    wire [31:0] neg_multiplicand;

    wire dummy_wireA, dummy_wireB, dummy_wireC;
    alu negate_multiplicand(1'b0, multiplicand, 1'b1, 1'b0, neg_multiplicand, dummy_wireA, dummy_wireB, dummy_wireC);

    
    // holding wires
    wire [64:0] pre_shift;
    wire ovf;

    mult_alu_wrapper fetch(pre_shift[64:33], ovf, in[64:33], multiplicand, neg_multiplicand, {in[1], in[0]});
    assign pre_shift[32:0] = in[32:0];

    right_shift_64 shift(out, pre_shift);


    // ovf handling
    wire final_sign;
    xor final_sign_xor(final_sign, multiplicand[31], multiplier[31]);

    wire result_is_zero, leading_ones, leading_zeros;
    assign leading_ones = &out[64:34];
    assign leading_zeros = ~(|out[64:34]);

    assign result_is_zero = ~|out[33:2];

    wire zero_exception, one_exception, incorrect_sign, hold;
    and zero(zero_exception, ~leading_zeros, ~(final_sign & ~result_is_zero));
    and one(one_exception, ~leading_ones, final_sign & ~result_is_zero);

    xor incorrect_sign_xor(hold, final_sign, out[33]);

    and all_zero_exception(incorrect_sign, hold, ~result_is_zero);

    assign data_exception = zero_exception | one_exception | incorrect_sign;



    
endmodule
