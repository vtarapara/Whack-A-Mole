`timescale 1 ns / 100 ps

module left_shift_tb();
    reg [31:0] data_operandA;
    reg [4:0] ctrl_shiftamt;

    wire [31:0] data_result;

    left_shift shift(data_result, data_operandA, ctrl_shiftamt);

    initial begin
        ctrl_shiftamt = 0;
        data_operandA = 1;

        #320;
        $finish;
    end

    always
        #10 ctrl_shiftamt[0] = ~ctrl_shiftamt[0];
    always
        #20 ctrl_shiftamt[1] = ~ctrl_shiftamt[1];
    always
        #40 ctrl_shiftamt[2] = ~ctrl_shiftamt[2];
    always
        #80 ctrl_shiftamt[3] = ~ctrl_shiftamt[3];
    always
        #160 ctrl_shiftamt[4] = ~ctrl_shiftamt[4];

    always @(data_result, data_operandA, ctrl_shiftamt) begin
        #1
        $display("data_operandA: %d, ctrl_shiftamt: %d, data_result: %d", data_operandA, ctrl_shiftamt, data_result);
    end

    initial begin
        $dumpfile("left_shift.vcd");
        $dumpvars(0, left_shift_tb);
    end
endmodule
