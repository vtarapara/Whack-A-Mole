`timescale 1 ns / 100 ps

module divider_tb();

    reg [63:0] in;
    reg [31:0] divisor;
    wire [63:0] out;
    wire data_exception;

    // Instantiate the Unit Under Test (UUT)
    divider uut(
        out, data_exception, in, divisor
    );

    initial begin
        // Initialize Inputs
        divisor = 0;
        in = 0;
        #100;
        divisor = 3;
        in = 28;

    end

    always @(out) begin
        #1
        $display("out: %d", out);
    end

    initial begin
        $dumpfile("divider.vcd");
        $dumpvars(0, divider_tb);
    end
      
endmodule