// `include "./operations/add.v"
// `include "./operations/bitwise_or.v"
// `include "./operations/bitwise_and.v"
// `include "./operations/left_shift.v"
// `include "./operations/right_shift.v"
// `include "./utils/mux32.v"

module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
        
    input [31:0] data_operandA, data_operandB;
    input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

    output [31:0] data_result;
    output isNotEqual, isLessThan, overflow;


    wire [31:0] add_result, sub_result, and_result, or_result, left_shift_result, right_shift_result;

    add add1(add_result, data_operandA, data_operandB, overflow);
    sub sub1(sub_result, data_operandA, data_operandB, overflow);
    bitwise_and and1(and_result, data_operandA, data_operandB);
    bitwise_or or1(or_result, data_operandA, data_operandB);
    left_shift left_shift1(left_shift_result, data_operandA, ctrl_shiftamt);
    right_shift right_shift1(right_shift_result, data_operandA, ctrl_shiftamt);

    // add your code here:

    mux_32 mux(data_result, ctrl_ALUopcode, add_result, sub_result, and_result, or_result, left_shift_result, right_shift_result, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

endmodule