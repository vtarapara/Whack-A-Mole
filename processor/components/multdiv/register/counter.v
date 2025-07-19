module counter(out, clk, clr, en);

    input clk, clr, en;
    output [5:0] out;

    wire [5:0] out_wire;

    ff dff0(out_wire[0], 1'b1, clk, clr);
    ff dff1(out_wire[1], 1'b1, out_wire[0], clr);
    ff dff2(out_wire[2], 1'b1, out_wire[1], clr);
    ff dff3(out_wire[3], 1'b1, out_wire[2], clr);
    ff dff4(out_wire[4], 1'b1, out_wire[3], clr);
    ff dff5(out_wire[5], 1'b1, out_wire[4], clr);

    assign out = out_wire;
endmodule