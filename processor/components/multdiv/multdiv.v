// `include "register/regfile.v"
// `include "register/register_components/decoder.v"
// `include "register/register_components/register.v"
// `include "register/register_components/booths_register.v"
// `include "register/register_components/div_register.v"
// `include "register/register_components/dffe_ref.v"
// `include "register/register_components/ff.v"
// `include "register/counter.v"


// `include "alu/alu.v"
// `include "alu/mult_alu_wrapper.v"
// `include "alu/div_alu_wrapper.v"
// `include "alu/alu_components/add.v"
// `include "alu/alu_components/sub.v"
// `include "alu/alu_components/bitwise_or.v"
// `include "alu/alu_components/bitwise_and.v"
// `include "alu/alu_components/left_shift.v"
// `include "alu/alu_components/right_shift.v"
// `include "alu/alu_components/right_shift_64.v"
// `include "alu/alu_components/cla_block.v"
// `include "alu/alu_components/mux32.v"

// `include "components/booth_multiplier.v"
// `include "components/divider.v"

module multdiv(
	data_operandA, data_operandB, 
	ctrl_MULT, ctrl_DIV, 
	clock, 
	data_result, data_exception, data_resultRDY);

    input [31:0] data_operandA, data_operandB;
    input ctrl_MULT, ctrl_DIV, clock;

    output [31:0] data_result;
    output data_exception, data_resultRDY;

    wire mult_exception, div_exception;


    wire [5:0] counter_out;
    counter count(counter_out, clock, ctrl_MULT | ctrl_DIV, 1'b1);



    // latch operands
    wire [64:0] booths_latch, pre_shift_mult, post_shift_mult;

    wire operand_latch; // operand latch will be 1 if mult, 0 if div
    dffe_ref latch_operand(operand_latch, ctrl_MULT, clock, ctrl_MULT | ctrl_DIV, 1'b0);

    // single_register booths_low_bits(pre_shift_mult_low_bits, booths_low_latch, clock, clock, 1'b1, 1'b0);
    // single_register booths_high_bits(pre_shift_mult_high_bits, booths_high_latch, clock, clock, 1'b1, 1'b0);

    booths_register store_booths(pre_shift_mult, booths_latch, clock, clock, 1'b1, 1'b0);

    booth_multiplier mult(post_shift_mult, mult_exception, pre_shift_mult, data_operandA, data_operandB);

    // determine if we need to reset booth operation
    // assign booths_low_latch = ctrl_MULT ? data_operandB : post_shift_mult_low_bits;
    // assign booths_high_latch = ctrl_MULT ? 32'b0 : post_shift_mult_high_bits;

    assign booths_latch = ctrl_MULT ? {32'b0, data_operandB, 1'b0} : post_shift_mult;


    // ------------- START DIV ----------------
    wire [63:0] pre_shift_div, post_shift_div, div_latch;

    wire div_by_zero;
    dffe_ref latch_div_by_zero(div_by_zero, ~|data_operandB[31:0], clock, ctrl_DIV, 1'b0);


    // generate negative divisor and dividend
    wire [31:0] neg_divisor;
    wire dummy_wireG, dummy_wireH, dummy_wireI;
    alu negate_divisor(1'b0, data_operandB, 1'b1, 1'b0, neg_divisor, dummy_wireG, dummy_wireH, dummy_wireI);
    wire [31:0] neg_dividend;
    wire dummy_wireA, dummy_wireB, dummy_wireC;
    alu negate_dividend(1'b0, data_operandA, 1'b1, 1'b0, neg_dividend, dummy_wireA, dummy_wireB, dummy_wireC);
    // end generate negative divisor and dividend

    // determine if we need to negate the quotient at the end (if the signs of the operands are different)
    wire should_negate_quotient;
    xor should_negate_quotient_xor(should_negate_quotient, data_operandA[31], data_operandB[31]);


    // latch remainder/quotient
    div_register store_div(pre_shift_div, div_latch, clock, clock, 1'b1, 1'b0);
    // perform division
    divider div(post_shift_div, div_exception, pre_shift_div, (data_operandB[31] ? neg_divisor : data_operandB));


    // determine if we need to reset division operation
    assign div_latch = ctrl_DIV ? {32'b0, (data_operandA[31] ? neg_dividend : data_operandA)} : post_shift_div;


    // if counter is 0 and the clock is 0, then set data result to booths_low_latch and data_resultRDY to high
    wire clock_done;
    assign clock_done = counter_out[5] & ~counter_out[4] & ~counter_out[3] & ~counter_out[2] & counter_out[1] & ~counter_out[0];



    // calculate final answer by running div again
    wire [63:0] final_RQ;
    wire [31:0] quotient, neg_quotient;
    divider final_div(final_RQ, div_exception, post_shift_div, (data_operandB[31] ? neg_divisor : data_operandB));
    assign quotient = final_RQ[31:0];
    wire dummy_wireD, dummy_wireE, dummy_wireF;
    alu negate_quotient(1'b0, quotient, 1'b1, 1'b0, neg_quotient, dummy_wireD, dummy_wireE, dummy_wireF);




    // determine if mult has overflow exception
    wire mult_overflow;

    wire all_zeros, all_ones;
    assign all_ones = &booths_latch[64:34];
    assign all_zeros = ~(|booths_latch[64:34]);
    assign mult_overflow = ~(all_ones | all_zeros);



    assign data_result = operand_latch ? (mult_overflow ? 32'bx : booths_latch[33:2]) : div_by_zero ? 1'b0 : (should_negate_quotient ? neg_quotient : quotient);
    assign data_exception = operand_latch ? (mult_exception | mult_overflow) : div_by_zero;
    assign data_resultRDY = clock_done;


endmodule

