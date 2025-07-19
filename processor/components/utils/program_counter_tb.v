`timescale 1ns / 1ps

module program_counter_tb();

    reg clk, clr, en;
    wire [31:0] out;

    // Instantiate the Unit Under Test (UUT)
    counter uut (
        out, clk, clr, en
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        clr = 0;
        en = 1;
        
        // Wait 100 ns for global reset to finish
        #1000;
        $finish;
    end

    always
        #10 begin 
            clk = ~clk;
        end

    // always
    //     #100 begin
    //         clr = ~clr;
    //     end

    always @(out) begin
        #1
        $display("out: %d", out);
    end

    initial begin
        $dumpfile("program_counter.vcd");
        $dumpvars(0, program_counter_tb);
    end

endmodule