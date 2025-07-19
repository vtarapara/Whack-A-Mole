module right_shift_64(out, in);
    input [64:0] in;
    output [64:0] out;

    assign out[63:0] = in[64:1];
    assign out[64] = in[64];
endmodule