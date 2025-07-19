`timescale 1ns / 1ps

module multiplier_tb();

    reg [31:0] multiplicand, multiplier;
    wire [31:0] mult_result;
    wire data_resultRDY, data_exception;

    // Instantiate the Unit Under Test (UUT)
    multiplier uut (
        mult_result, data_resultRDY, data_exception, 
        multiplicand, multiplier
    );

    initial begin
        // Initialize Inputs
        multiplicand = 0;
        multiplier = 0;

        // Wait 100 ns for global reset to finish
        
        // Add stimulus here
        multiplicand = 32'd124; // 15 in decimal
        multiplier = -32'd34; // 3 in decimal
        #10; // Wait for 10 ns
        
        
        $display("Test Case 1: 15 * 3 = %d", mult_result);
        if (mult_result !== 64'd108125) $display("Test Case 1 Failed");
        else $display("Test Case 1 Passed");

        // multiplicand = 32'd10; // 10 in decimal
        // multiplier = 32'd5; // 5 in decimal
        // #10; // Wait for 10 ns
        
        // $display("Test Case 2: 10 * 5 = %d", mult_result);
        // if (mult_result !== 64'd50) $display("Test Case 2 Failed");
        // else $display("Test Case 2 Passed");

        // Continue with more test cases as needed
        #100;
    end

    initial begin
        $dumpfile("multiplier.vcd");
        $dumpvars(0, multiplier_tb);
    end
      
endmodule