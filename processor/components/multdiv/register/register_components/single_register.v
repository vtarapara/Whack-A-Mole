module single_register(out, in, clk, w_en, r_en, clr);

    input [31:0] in;
    input clk, w_en, r_en, clr;
    output [31:0] out;

    wire [31:0] out_wire;

    dffe_ref dff(out_wire[0], in[0], clk, w_en, clr);
    dffe_ref dff1(out_wire[1], in[1], clk, w_en, clr);
    dffe_ref dff2(out_wire[2], in[2], clk, w_en, clr);
    dffe_ref dff3(out_wire[3], in[3], clk, w_en, clr);
    dffe_ref dff4(out_wire[4], in[4], clk, w_en, clr);
    dffe_ref dff5(out_wire[5], in[5], clk, w_en, clr);
    dffe_ref dff6(out_wire[6], in[6], clk, w_en, clr);
    dffe_ref dff7(out_wire[7], in[7], clk, w_en, clr);
    dffe_ref dff8(out_wire[8], in[8], clk, w_en, clr);
    dffe_ref dff9(out_wire[9], in[9], clk, w_en, clr);
    dffe_ref dff10(out_wire[10], in[10], clk, w_en, clr);
    dffe_ref dff11(out_wire[11], in[11], clk, w_en, clr);
    dffe_ref dff12(out_wire[12], in[12], clk, w_en, clr);
    dffe_ref dff13(out_wire[13], in[13], clk, w_en, clr);
    dffe_ref dff14(out_wire[14], in[14], clk, w_en, clr);
    dffe_ref dff15(out_wire[15], in[15], clk, w_en, clr);
    dffe_ref dff16(out_wire[16], in[16], clk, w_en, clr);
    dffe_ref dff17(out_wire[17], in[17], clk, w_en, clr);
    dffe_ref dff18(out_wire[18], in[18], clk, w_en, clr);
    dffe_ref dff19(out_wire[19], in[19], clk, w_en, clr);
    dffe_ref dff20(out_wire[20], in[20], clk, w_en, clr);
    dffe_ref dff21(out_wire[21], in[21], clk, w_en, clr);
    dffe_ref dff22(out_wire[22], in[22], clk, w_en, clr);
    dffe_ref dff23(out_wire[23], in[23], clk, w_en, clr);
    dffe_ref dff24(out_wire[24], in[24], clk, w_en, clr);
    dffe_ref dff25(out_wire[25], in[25], clk, w_en, clr);
    dffe_ref dff26(out_wire[26], in[26], clk, w_en, clr);
    dffe_ref dff27(out_wire[27], in[27], clk, w_en, clr);
    dffe_ref dff28(out_wire[28], in[28], clk, w_en, clr);
    dffe_ref dff29(out_wire[29], in[29], clk, w_en, clr);
    dffe_ref dff30(out_wire[30], in[30], clk, w_en, clr);
    dffe_ref dff31(out_wire[31], in[31], clk, w_en, clr);

    assign out = r_en ? out_wire : 32'bz;
    

endmodule