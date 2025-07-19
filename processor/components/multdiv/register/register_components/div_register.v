module div_register(out, in, clk, w_en, r_en, clr);

    input [63:0] in;
    input clk, w_en, r_en, clr;
    output [63:0] out;

    wire [63:0] out_wire;

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
    dffe_ref dff32(out_wire[32], in[32], clk, w_en, clr);
    dffe_ref dff33(out_wire[33], in[33], clk, w_en, clr);
    dffe_ref dff34(out_wire[34], in[34], clk, w_en, clr);
    dffe_ref dff35(out_wire[35], in[35], clk, w_en, clr);
    dffe_ref dff36(out_wire[36], in[36], clk, w_en, clr);
    dffe_ref dff37(out_wire[37], in[37], clk, w_en, clr);
    dffe_ref dff38(out_wire[38], in[38], clk, w_en, clr);
    dffe_ref dff39(out_wire[39], in[39], clk, w_en, clr);
    dffe_ref dff40(out_wire[40], in[40], clk, w_en, clr);
    dffe_ref dff41(out_wire[41], in[41], clk, w_en, clr);
    dffe_ref dff42(out_wire[42], in[42], clk, w_en, clr);
    dffe_ref dff43(out_wire[43], in[43], clk, w_en, clr);
    dffe_ref dff44(out_wire[44], in[44], clk, w_en, clr);
    dffe_ref dff45(out_wire[45], in[45], clk, w_en, clr);
    dffe_ref dff46(out_wire[46], in[46], clk, w_en, clr);
    dffe_ref dff47(out_wire[47], in[47], clk, w_en, clr);
    dffe_ref dff48(out_wire[48], in[48], clk, w_en, clr);
    dffe_ref dff49(out_wire[49], in[49], clk, w_en, clr);
    dffe_ref dff50(out_wire[50], in[50], clk, w_en, clr);
    dffe_ref dff51(out_wire[51], in[51], clk, w_en, clr);
    dffe_ref dff52(out_wire[52], in[52], clk, w_en, clr);
    dffe_ref dff53(out_wire[53], in[53], clk, w_en, clr);
    dffe_ref dff54(out_wire[54], in[54], clk, w_en, clr);
    dffe_ref dff55(out_wire[55], in[55], clk, w_en, clr);
    dffe_ref dff56(out_wire[56], in[56], clk, w_en, clr);
    dffe_ref dff57(out_wire[57], in[57], clk, w_en, clr);
    dffe_ref dff58(out_wire[58], in[58], clk, w_en, clr);
    dffe_ref dff59(out_wire[59], in[59], clk, w_en, clr);
    dffe_ref dff60(out_wire[60], in[60], clk, w_en, clr);
    dffe_ref dff61(out_wire[61], in[61], clk, w_en, clr);
    dffe_ref dff62(out_wire[62], in[62], clk, w_en, clr);
    dffe_ref dff63(out_wire[63], in[63], clk, w_en, clr);

    assign out = r_en ? out_wire : 64'bz;
    

endmodule