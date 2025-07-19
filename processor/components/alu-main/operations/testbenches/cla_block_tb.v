`timescale 1 ns / 100 ps

module cla_block_tb();
    reg [7:0] data_operandA, data_operandB;
    reg c_in;
    wire [7:0] data_result;
    wire c_out, f_gen, f_prop;

    cla_block adder(data_result, data_operandA, data_operandB, c_out, c_in, f_gen, f_prop);

    initial begin
        data_operandA = 0;
        data_operandB = 0;
        c_in = 1;

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

    always @(data_operandA, data_operandB, c_in) begin
        #1
        $display("data_operandA: %d, data_operandB: %d, c_in: %d, data_result: %d, c_out: %d", data_operandA, data_operandB, c_in, data_result, c_out);
    end

    initial begin
        $dumpfile("cla_block.vcd");
        $dumpvars(0, cla_block_tb);
    end
endmodule
