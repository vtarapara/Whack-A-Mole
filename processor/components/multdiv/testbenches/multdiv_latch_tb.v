`timescale 1ns / 1ps

module multdiv_latch_tb;

    // Testbench signals
    reg [31:0] data_operandA, data_operandB;
    reg ctrl_MULT, ctrl_DIV, clock;
    wire [31:0] operandA_latch, operandB_latch;

    // Instantiate the Device Under Test (DUT)
    multdiv DUT (
        .data_operandA(data_operandA), 
        .data_operandB(data_operandB), 
        .ctrl_MULT(ctrl_MULT), 
        .ctrl_DIV(ctrl_DIV), 
        .clock(clock), 
        .data_result(), 
        .data_exception(), 
        .data_resultRDY()
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #10 clock = ~clock; // Toggle clock every 10 time units
    end

    // Test sequence
    initial begin
        // Initialize inputs
        ctrl_MULT = 0;
        ctrl_DIV = 0;
        data_operandA = 0;
        data_operandB = 0;
        #20; // Wait for two clock cycles

        // Test case 1: Check latching with MULT control
        data_operandA = 32'hA5A5A5A5; // Test data for operand A
        data_operandB = 32'h5A5A5A5A; // Test data for operand B
        ctrl_MULT = 1; // Enable MULT operation to latch values
        #20; // Wait for two clock cycles
        ctrl_MULT = 0; // Disable MULT operation
        #20; // Wait for two clock cycles

        // Test case 2: Check latching with DIV control
        data_operandA = 32'h3C3C3C3C; // New test data for operand A
        data_operandB = 32'hC3C3C3C3; // New test data for operand B
        ctrl_DIV = 1; // Enable DIV operation to latch values
        #20; // Wait for two clock cycles
        ctrl_DIV = 0; // Disable DIV operation
        #20; // Wait for two clock cycles

        // Complete the test
        $display("Test Complete");
        $finish;
    end
    initial begin
        $dumpfile("multdiv_latch_tb.vcd");
        $dumpvars(0, multdiv_latch_tb);
    end

endmodule

