module register(out, outA, outB, in, clk, w_en, r_enA, r_enB, clr);

    input [31:0] in;
    input clk, w_en, r_enA, r_enB, clr;
    output [31:0] out, outA, outB;

    dffe_ref dff(out[0], in[0], clk, w_en, clr);
    dffe_ref dff1(out[1], in[1], clk, w_en, clr);
    dffe_ref dff2(out[2], in[2], clk, w_en, clr);
    dffe_ref dff3(out[3], in[3], clk, w_en, clr);
    dffe_ref dff4(out[4], in[4], clk, w_en, clr);
    dffe_ref dff5(out[5], in[5], clk, w_en, clr);
    dffe_ref dff6(out[6], in[6], clk, w_en, clr);
    dffe_ref dff7(out[7], in[7], clk, w_en, clr);
    dffe_ref dff8(out[8], in[8], clk, w_en, clr);
    dffe_ref dff9(out[9], in[9], clk, w_en, clr);
    dffe_ref dff10(out[10], in[10], clk, w_en, clr);
    dffe_ref dff11(out[11], in[11], clk, w_en, clr);
    dffe_ref dff12(out[12], in[12], clk, w_en, clr);
    dffe_ref dff13(out[13], in[13], clk, w_en, clr);
    dffe_ref dff14(out[14], in[14], clk, w_en, clr);
    dffe_ref dff15(out[15], in[15], clk, w_en, clr);
    dffe_ref dff16(out[16], in[16], clk, w_en, clr);
    dffe_ref dff17(out[17], in[17], clk, w_en, clr);
    dffe_ref dff18(out[18], in[18], clk, w_en, clr);
    dffe_ref dff19(out[19], in[19], clk, w_en, clr);
    dffe_ref dff20(out[20], in[20], clk, w_en, clr);
    dffe_ref dff21(out[21], in[21], clk, w_en, clr);
    dffe_ref dff22(out[22], in[22], clk, w_en, clr);
    dffe_ref dff23(out[23], in[23], clk, w_en, clr);
    dffe_ref dff24(out[24], in[24], clk, w_en, clr);
    dffe_ref dff25(out[25], in[25], clk, w_en, clr);
    dffe_ref dff26(out[26], in[26], clk, w_en, clr);
    dffe_ref dff27(out[27], in[27], clk, w_en, clr);
    dffe_ref dff28(out[28], in[28], clk, w_en, clr);
    dffe_ref dff29(out[29], in[29], clk, w_en, clr);
    dffe_ref dff30(out[30], in[30], clk, w_en, clr);
    dffe_ref dff31(out[31], in[31], clk, w_en, clr);

    assign outA = r_enA ? out : 32'bz;
    assign outB = r_enB ? out : 32'bz;
    

endmodule