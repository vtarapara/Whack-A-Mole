
module mux_2(out, select, in0, in1);
    input select;
    input [31:0] in0, in1;
    output [31:0] out;
    assign out = select ? in1 : in0;
endmodule

module mux_4(out, select, in0, in1, in2, in3);
    input [1:0] select;
    input [31:0] in0, in1, in2, in3;
    output [31:0] out;
    wire [31:0] out0, out1;
    mux_2 mux0(out0, select[0], in0, in1);
    mux_2 mux1(out1, select[0], in2, in3);
    mux_2 mux2(out, select[1], out0, out1);
endmodule

module mux_8(out, select, in0, in1, in2, in3, in4, in5, in6, in7);
    input [2:0] select;
    input [31:0] in0, in1, in2, in3, in4, in5, in6, in7;
    output [31:0] out;
    wire [31:0] out0, out1;
    mux_4 mux0(out0, select[1:0], in0, in1, in2, in3);
    mux_4 mux1(out1, select[1:0], in4, in5, in6, in7);
    mux_2 mux2(out, select[2], out0, out1);
endmodule

module mux_32(out, select, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31);
    input [4:0] select;
    input [31:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31;
    output [31:0] out;
    wire [31:0] out0, out1, out2, out3;
    mux_8 mux0(out0, select[2:0], in0, in1, in2, in3, in4, in5, in6, in7);
    mux_8 mux1(out1, select[2:0], in8, in9, in10, in11, in12, in13, in14, in15);
    mux_8 mux2(out2, select[2:0], in16, in17, in18, in19, in20, in21, in22, in23);
    mux_8 mux3(out3, select[2:0], in24, in25, in26, in27, in28, in29, in30, in31);

    mux_4 mux4(out, select[4:3], out0, out1, out2, out3);
endmodule

