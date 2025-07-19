`timescale 1 ns / 100 ps

module sub_tb();
    reg [31:0] data_operandA, data_operandB;
    wire overflow;
    wire [31:0] data_result;

    sub subtracter(data_result, data_operandA, data_operandB, overflow);

    initial begin
        data_operandA = 162346;
        data_operandB = 24124;

        #80;
        $finish;
    end

    always
        #10 begin
            data_operandA[0] = ~data_operandA[0];
        end

    always
        #20 begin
            data_operandA[1] = ~data_operandA[1];
            data_operandB[0] = ~data_operandB[0];
        end

    always
        #40 begin
            data_operandA[7] = ~data_operandA[7];
            data_operandB[7] = ~data_operandB[7];
        end

    always @(data_operandA, data_operandB) begin
        #1
        $display("data_operandA: %d, data_operandB: %d, data_result: %d, overflow: %d", data_operandA, data_operandB, data_result, overflow);
    end

    initial begin
        $dumpfile("sub.vcd");
        $dumpvars(0, sub_tb);
    end
endmodule
