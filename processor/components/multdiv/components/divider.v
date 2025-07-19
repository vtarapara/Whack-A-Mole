module divider(out, data_exception, in, divisor);

    input [63:0] in;
    input [31:0] divisor;
    output [63:0] out;
    output data_exception;

    wire [31:0] neg_divisor;

    wire dummy_wireA, dummy_wireB, dummy_wireC;
    alu negate_divisor(1'b0, divisor, 1'b1, 1'b0, neg_divisor, dummy_wireA, dummy_wireB, dummy_wireC);

    wire [63:0] post_shift, post_subtract, pre_revert_ans;
    wire [31:0] restoration;

    assign post_shift = in << 1;
    assign restoration = post_shift[63:32];

    div_alu_wrapper attempt_sub(post_subtract, post_shift, neg_divisor);

    assign pre_revert_ans[63:1] = post_subtract[63:1];
    assign pre_revert_ans[0] = ~post_subtract[63];

    assign out = post_subtract[63] ? {restoration, pre_revert_ans[31:0]} : pre_revert_ans;

endmodule