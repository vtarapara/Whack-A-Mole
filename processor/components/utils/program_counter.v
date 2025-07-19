module program_counter(out, clk, clr, en);

    input clk, clr, en;
    output [31:0] out;

    wire [31:0] out_wire, out_wire2;

    ff dff0(out_wire[0], 1'b1, clk, clr);
    ff dff1(out_wire[1], 1'b1, out_wire[0], clr);
    ff dff2(out_wire[2], 1'b1, out_wire[1], clr);
    ff dff3(out_wire[3], 1'b1, out_wire[2], clr);
    ff dff4(out_wire[4], 1'b1, out_wire[3], clr);
    ff dff5(out_wire[5], 1'b1, out_wire[4], clr);
    ff dff6(out_wire[6], 1'b1, out_wire[5], clr);
    ff dff7(out_wire[7], 1'b1, out_wire[6], clr);
    ff dff8(out_wire[8], 1'b1, out_wire[7], clr);
    ff dff9(out_wire[9], 1'b1, out_wire[8], clr);
    ff dff10(out_wire[10], 1'b1, out_wire[9], clr);
    ff dff11(out_wire[11], 1'b1, out_wire[10], clr);
    ff dff12(out_wire[12], 1'b1, out_wire[11], clr);
    ff dff13(out_wire[13], 1'b1, out_wire[12], clr);
    ff dff14(out_wire[14], 1'b1, out_wire[13], clr);
    ff dff15(out_wire[15], 1'b1, out_wire[14], clr);
    ff dff16(out_wire[16], 1'b1, out_wire[15], clr);
    ff dff17(out_wire[17], 1'b1, out_wire[16], clr);
    ff dff18(out_wire[18], 1'b1, out_wire[17], clr);
    ff dff19(out_wire[19], 1'b1, out_wire[18], clr);
    ff dff20(out_wire[20], 1'b1, out_wire[19], clr);
    ff dff21(out_wire[21], 1'b1, out_wire[20], clr);
    ff dff22(out_wire[22], 1'b1, out_wire[21], clr);
    ff dff23(out_wire[23], 1'b1, out_wire[22], clr);
    ff dff24(out_wire[24], 1'b1, out_wire[23], clr);
    ff dff25(out_wire[25], 1'b1, out_wire[24], clr);
    ff dff26(out_wire[26], 1'b1, out_wire[25], clr);
    ff dff27(out_wire[27], 1'b1, out_wire[26], clr);
    ff dff28(out_wire[28], 1'b1, out_wire[27], clr);
    ff dff29(out_wire[29], 1'b1, out_wire[28], clr);
    ff dff30(out_wire[30], 1'b1, out_wire[29], clr);
    ff dff31(out_wire[31], 1'b1, out_wire[30], clr);

    assign out = ~out_wire + 1;
endmodule