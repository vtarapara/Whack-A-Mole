module decoder(label, stream);
    input [4:0] stream;
    output [31:0] label;

    wire [4:0] not_stream;

    not not0(not_stream[0], stream[0]);
    not not1(not_stream[1], stream[1]);
    not not2(not_stream[2], stream[2]);
    not not3(not_stream[3], stream[3]);
    not not4(not_stream[4], stream[4]);


    and and0(label[0], not_stream[0], not_stream[1], not_stream[2], not_stream[3], not_stream[4]);
    and and1(label[1], not_stream[0], not_stream[1], not_stream[2], not_stream[3], stream[4]);
    and and2(label[2], not_stream[0], not_stream[1], not_stream[2], stream[3], not_stream[4]);
    and and3(label[3], not_stream[0], not_stream[1], not_stream[2], stream[3], stream[4]);
    and and4(label[4], not_stream[0], not_stream[1], stream[2], not_stream[3], not_stream[4]);
    and and5(label[5], not_stream[0], not_stream[1], stream[2], not_stream[3], stream[4]);
    and and6(label[6], not_stream[0], not_stream[1], stream[2], stream[3], not_stream[4]);
    and and7(label[7], not_stream[0], not_stream[1], stream[2], stream[3], stream[4]);
    and and8(label[8], not_stream[0], stream[1], not_stream[2], not_stream[3], not_stream[4]);
    and and9(label[9], not_stream[0], stream[1], not_stream[2], not_stream[3], stream[4]);
    and and10(label[10], not_stream[0], stream[1], not_stream[2], stream[3], not_stream[4]);
    and and11(label[11], not_stream[0], stream[1], not_stream[2], stream[3], stream[4]);
    and and12(label[12], not_stream[0], stream[1], stream[2], not_stream[3], not_stream[4]);
    and and13(label[13], not_stream[0], stream[1], stream[2], not_stream[3], stream[4]);
    and and14(label[14], not_stream[0], stream[1], stream[2], stream[3], not_stream[4]);
    and and15(label[15], not_stream[0], stream[1], stream[2], stream[3], stream[4]);
    and and16(label[16], stream[0], not_stream[1], not_stream[2], not_stream[3], not_stream[4]);
    and and17(label[17], stream[0], not_stream[1], not_stream[2], not_stream[3], stream[4]);
    and and18(label[18], stream[0], not_stream[1], not_stream[2], stream[3], not_stream[4]);
    and and19(label[19], stream[0], not_stream[1], not_stream[2], stream[3], stream[4]);
    and and20(label[20], stream[0], not_stream[1], stream[2], not_stream[3], not_stream[4]);
    and and21(label[21], stream[0], not_stream[1], stream[2], not_stream[3], stream[4]);
    and and22(label[22], stream[0], not_stream[1], stream[2], stream[3], not_stream[4]);
    and and23(label[23], stream[0], not_stream[1], stream[2], stream[3], stream[4]);
    and and24(label[24], stream[0], stream[1], not_stream[2], not_stream[3], not_stream[4]);
    and and25(label[25], stream[0], stream[1], not_stream[2], not_stream[3], stream[4]);
    and and26(label[26], stream[0], stream[1], not_stream[2], stream[3], not_stream[4]);
    and and27(label[27], stream[0], stream[1], not_stream[2], stream[3], stream[4]);
    and and28(label[28], stream[0], stream[1], stream[2], not_stream[3], not_stream[4]);
    and and29(label[29], stream[0], stream[1], stream[2], not_stream[3], stream[4]);
    and and30(label[30], stream[0], stream[1], stream[2], stream[3], not_stream[4]);
    and and31(label[31], stream[0], stream[1], stream[2], stream[3], stream[4]);


endmodule