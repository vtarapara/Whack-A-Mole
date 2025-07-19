module div_alu_wrapper(final, current, addend);
    input [63:0] current;
    input [31:0] addend;
    output [63:0] final;

    wire [31:0] add_result;
    wire add_overflow;

    add add1(add_result, current[63:32], addend, add_overflow);

    assign final[63:32] = add_result;
    assign final[31:0] = current[31:0];
endmodule