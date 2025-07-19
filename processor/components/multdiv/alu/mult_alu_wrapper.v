module mult_alu_wrapper(final, overflow, current, multiplicand, not_multiplicand, booth_bits);

    input [31:0] current, multiplicand, not_multiplicand;
    input [1:0] booth_bits;
    input overflow;
    output [31:0] final;


    wire [31:0] add_result, sub_result;
    wire add_overflow, sub_overflow;

    add add1(add_result, current, multiplicand, add_overflow);
    add sub1(sub_result, current, not_multiplicand, sub_overflow);

    // check what the result should be
    mux_4 select(final, booth_bits, current, add_result, sub_result, current);
endmodule

