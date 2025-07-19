module mod_eight_counter(out, clk, clr, en);

    input clk, clr, en;
    output [2:0] out;

    falling_ff dff0(out[0], 1'b1, clk, clr);
    falling_ff dff1(out[1], 1'b1, out[0], clr);
    falling_ff dff2(out[2], 1'b1, out[1], clr);
endmodule