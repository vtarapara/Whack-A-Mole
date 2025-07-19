module decoder(label, stream);
    input [4:0] stream;
    output [31:0] label;

    wire [4:0] not_stream;

    not not0(not_stream[0], stream[0]);
    not not1(not_stream[1], stream[1]);
    not not2(not_stream[2], stream[2]);
    not not3(not_stream[3], stream[3]);
    not not4(not_stream[4], stream[4]);

    assign label[0] = ~stream[4] & ~stream[3] & ~stream[2] & ~stream[1] & ~stream[0];
    assign label[1] = ~stream[4] & ~stream[3] & ~stream[2] & ~stream[1] & stream[0];
    assign label[2] = ~stream[4] & ~stream[3] & ~stream[2] & stream[1] & ~stream[0];
    assign label[3] = ~stream[4] & ~stream[3] & ~stream[2] & stream[1] & stream[0];
    assign label[4] = ~stream[4] & ~stream[3] & stream[2] & ~stream[1] & ~stream[0];
    assign label[5] = ~stream[4] & ~stream[3] & stream[2] & ~stream[1] & stream[0];
    assign label[6] = ~stream[4] & ~stream[3] & stream[2] & stream[1] & ~stream[0];
    assign label[7] = ~stream[4] & ~stream[3] & stream[2] & stream[1] & stream[0];
    assign label[8] = ~stream[4] & stream[3] & ~stream[2] & ~stream[1] & ~stream[0];
    assign label[9] = ~stream[4] & stream[3] & ~stream[2] & ~stream[1] & stream[0];
    assign label[10] = ~stream[4] & stream[3] & ~stream[2] & stream[1] & ~stream[0];
    assign label[11] = ~stream[4] & stream[3] & ~stream[2] & stream[1] & stream[0];
    assign label[12] = ~stream[4] & stream[3] & stream[2] & ~stream[1] & ~stream[0];
    assign label[13] = ~stream[4] & stream[3] & stream[2] & ~stream[1] & stream[0];
    assign label[14] = ~stream[4] & stream[3] & stream[2] & stream[1] & ~stream[0];
    assign label[15] = ~stream[4] & stream[3] & stream[2] & stream[1] & stream[0];
    assign label[16] = stream[4] & ~stream[3] & ~stream[2] & ~stream[1] & ~stream[0];
    assign label[17] = stream[4] & ~stream[3] & ~stream[2] & ~stream[1] & stream[0];
    assign label[18] = stream[4] & ~stream[3] & ~stream[2] & stream[1] & ~stream[0];
    assign label[19] = stream[4] & ~stream[3] & ~stream[2] & stream[1] & stream[0];
    assign label[20] = stream[4] & ~stream[3] & stream[2] & ~stream[1] & ~stream[0];
    assign label[21] = stream[4] & ~stream[3] & stream[2] & ~stream[1] & stream[0];
    assign label[22] = stream[4] & ~stream[3] & stream[2] & stream[1] & ~stream[0];
    assign label[23] = stream[4] & ~stream[3] & stream[2] & stream[1] & stream[0];
    assign label[24] = stream[4] & stream[3] & ~stream[2] & ~stream[1] & ~stream[0];
    assign label[25] = stream[4] & stream[3] & ~stream[2] & ~stream[1] & stream[0];
    assign label[26] = stream[4] & stream[3] & ~stream[2] & stream[1] & ~stream[0];
    assign label[27] = stream[4] & stream[3] & ~stream[2] & stream[1] & stream[0];
    assign label[28] = stream[4] & stream[3] & stream[2] & ~stream[1] & ~stream[0];
    assign label[29] = stream[4] & stream[3] & stream[2] & ~stream[1] & stream[0];
    assign label[30] = stream[4] & stream[3] & stream[2] & stream[1] & ~stream[0];
    assign label[31] = stream[4] & stream[3] & stream[2] & stream[1] & stream[0];


endmodule