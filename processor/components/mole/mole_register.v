module mole_register(out, in, clk, w_en, r_en, clr);

    input [7:0] in;
    input clk, w_en, r_en, clr;
    output [7:0] out;

    dffe_ref dff(out[0], in[0], clk, w_en, clr);
    dffe_ref dff1(out[1], in[1], clk, w_en, clr);
    dffe_ref dff2(out[2], in[2], clk, w_en, clr);
    dffe_ref dff3(out[3], in[3], clk, w_en, clr);
    dffe_ref dff4(out[4], in[4], clk, w_en, clr);
    dffe_ref dff5(out[5], in[5], clk, w_en, clr);
    dffe_ref dff6(out[6], in[6], clk, w_en, clr);
    dffe_ref dff7(out[7], in[7], clk, w_en, clr);

endmodule