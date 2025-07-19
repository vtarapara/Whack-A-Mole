// `include "./register_components/decoder.v"
// `include "./register_components/register.v"
// `include "./register_components/dffe_ref.v"

module regfile (
	clock,
	ctrl_writeEnable, ctrl_reset, ctrl_writeReg,
	ctrl_readRegA, ctrl_readRegB, data_writeReg,
	data_readRegA, data_readRegB
);

	input clock, ctrl_writeEnable, ctrl_reset;
	input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	input [31:0] data_writeReg;

	output [31:0] data_readRegA, data_readRegB;

	wire [31:0] label_readRegA, label_readRegB, label_writeReg;

	decoder decoder_readRegA(label_readRegA, ctrl_readRegA);
	decoder decoder_readRegB(label_readRegB, ctrl_readRegB);
	decoder decoder_writeReg(label_writeReg, ctrl_writeReg);

	wire [31:0] ctrl_writeLabel, ctrl_readLabelA, ctrl_readLabelB;
	// and and_write0(ctrl_writeLabel, ctrl_writeEnable, label_writeReg);
	// and and_read0(ctrl_readLabelA, ctrl_readRegA, label_readRegA);
	// and and_read1(ctrl_readLabelB, ctrl_readRegB, label_readRegB);

	and and_write0(ctrl_writeLabel[0], ctrl_writeEnable, label_writeReg[0]);
	and and_write1(ctrl_writeLabel[1], ctrl_writeEnable, label_writeReg[1]);
	and and_write2(ctrl_writeLabel[2], ctrl_writeEnable, label_writeReg[2]);
	and and_write3(ctrl_writeLabel[3], ctrl_writeEnable, label_writeReg[3]);
	and and_write4(ctrl_writeLabel[4], ctrl_writeEnable, label_writeReg[4]);
	and and_write5(ctrl_writeLabel[5], ctrl_writeEnable, label_writeReg[5]);
	and and_write6(ctrl_writeLabel[6], ctrl_writeEnable, label_writeReg[6]);
	and and_write7(ctrl_writeLabel[7], ctrl_writeEnable, label_writeReg[7]);
	and and_write8(ctrl_writeLabel[8], ctrl_writeEnable, label_writeReg[8]);
	and and_write9(ctrl_writeLabel[9], ctrl_writeEnable, label_writeReg[9]);
	and and_write10(ctrl_writeLabel[10], ctrl_writeEnable, label_writeReg[10]);
	and and_write11(ctrl_writeLabel[11], ctrl_writeEnable, label_writeReg[11]);
	and and_write12(ctrl_writeLabel[12], ctrl_writeEnable, label_writeReg[12]);
	and and_write13(ctrl_writeLabel[13], ctrl_writeEnable, label_writeReg[13]);
	and and_write14(ctrl_writeLabel[14], ctrl_writeEnable, label_writeReg[14]);
	and and_write15(ctrl_writeLabel[15], ctrl_writeEnable, label_writeReg[15]);
	and and_write16(ctrl_writeLabel[16], ctrl_writeEnable, label_writeReg[16]);
	and and_write17(ctrl_writeLabel[17], ctrl_writeEnable, label_writeReg[17]);
	and and_write18(ctrl_writeLabel[18], ctrl_writeEnable, label_writeReg[18]);
	and and_write19(ctrl_writeLabel[19], ctrl_writeEnable, label_writeReg[19]);
	and and_write20(ctrl_writeLabel[20], ctrl_writeEnable, label_writeReg[20]);
	and and_write21(ctrl_writeLabel[21], ctrl_writeEnable, label_writeReg[21]);
	and and_write22(ctrl_writeLabel[22], ctrl_writeEnable, label_writeReg[22]);
	and and_write23(ctrl_writeLabel[23], ctrl_writeEnable, label_writeReg[23]);
	and and_write24(ctrl_writeLabel[24], ctrl_writeEnable, label_writeReg[24]);
	and and_write25(ctrl_writeLabel[25], ctrl_writeEnable, label_writeReg[25]);
	and and_write26(ctrl_writeLabel[26], ctrl_writeEnable, label_writeReg[26]);
	and and_write27(ctrl_writeLabel[27], ctrl_writeEnable, label_writeReg[27]);
	and and_write28(ctrl_writeLabel[28], ctrl_writeEnable, label_writeReg[28]);
	and and_write29(ctrl_writeLabel[29], ctrl_writeEnable, label_writeReg[29]);
	and and_write30(ctrl_writeLabel[30], ctrl_writeEnable, label_writeReg[30]);
	and and_write31(ctrl_writeLabel[31], ctrl_writeEnable, label_writeReg[31]);

	and and_readA0(ctrl_readLabelA[0], ctrl_readRegA, label_readRegA[0]);
	and and_readA1(ctrl_readLabelA[1], ctrl_readRegA, label_readRegA[1]);
	and and_readA2(ctrl_readLabelA[2], ctrl_readRegA, label_readRegA[2]);
	and and_readA3(ctrl_readLabelA[3], ctrl_readRegA, label_readRegA[3]);
	and and_readA4(ctrl_readLabelA[4], ctrl_readRegA, label_readRegA[4]);
	and and_readA5(ctrl_readLabelA[5], ctrl_readRegA, label_readRegA[5]);
	and and_readA6(ctrl_readLabelA[6], ctrl_readRegA, label_readRegA[6]);
	and and_readA7(ctrl_readLabelA[7], ctrl_readRegA, label_readRegA[7]);
	and and_readA8(ctrl_readLabelA[8], ctrl_readRegA, label_readRegA[8]);
	and and_readA9(ctrl_readLabelA[9], ctrl_readRegA, label_readRegA[9]);
	and and_readA10(ctrl_readLabelA[10], ctrl_readRegA, label_readRegA[10]);
	and and_readA11(ctrl_readLabelA[11], ctrl_readRegA, label_readRegA[11]);
	and and_readA12(ctrl_readLabelA[12], ctrl_readRegA, label_readRegA[12]);
	and and_readA13(ctrl_readLabelA[13], ctrl_readRegA, label_readRegA[13]);
	and and_readA14(ctrl_readLabelA[14], ctrl_readRegA, label_readRegA[14]);
	and and_readA15(ctrl_readLabelA[15], ctrl_readRegA, label_readRegA[15]);
	and and_readA16(ctrl_readLabelA[16], ctrl_readRegA, label_readRegA[16]);
	and and_readA17(ctrl_readLabelA[17], ctrl_readRegA, label_readRegA[17]);
	and and_readA18(ctrl_readLabelA[18], ctrl_readRegA, label_readRegA[18]);
	and and_readA19(ctrl_readLabelA[19], ctrl_readRegA, label_readRegA[19]);
	and and_readA20(ctrl_readLabelA[20], ctrl_readRegA, label_readRegA[20]);
	and and_readA21(ctrl_readLabelA[21], ctrl_readRegA, label_readRegA[21]);
	and and_readA22(ctrl_readLabelA[22], ctrl_readRegA, label_readRegA[22]);
	and and_readA23(ctrl_readLabelA[23], ctrl_readRegA, label_readRegA[23]);
	and and_readA24(ctrl_readLabelA[24], ctrl_readRegA, label_readRegA[24]);
	and and_readA25(ctrl_readLabelA[25], ctrl_readRegA, label_readRegA[25]);
	and and_readA26(ctrl_readLabelA[26], ctrl_readRegA, label_readRegA[26]);
	and and_readA27(ctrl_readLabelA[27], ctrl_readRegA, label_readRegA[27]);
	and and_readA28(ctrl_readLabelA[28], ctrl_readRegA, label_readRegA[28]);
	and and_readA29(ctrl_readLabelA[29], ctrl_readRegA, label_readRegA[29]);
	and and_readA30(ctrl_readLabelA[30], ctrl_readRegA, label_readRegA[30]);
	and and_readA31(ctrl_readLabelA[31], ctrl_readRegA, label_readRegA[31]);

	and and_readB0(ctrl_readLabelB[0], ctrl_readRegB, label_readRegB[0]);
	and and_readB1(ctrl_readLabelB[1], ctrl_readRegB, label_readRegB[1]);
	and and_readB2(ctrl_readLabelB[2], ctrl_readRegB, label_readRegB[2]);
	and and_readB3(ctrl_readLabelB[3], ctrl_readRegB, label_readRegB[3]);
	and and_readB4(ctrl_readLabelB[4], ctrl_readRegB, label_readRegB[4]);
	and and_readB5(ctrl_readLabelB[5], ctrl_readRegB, label_readRegB[5]);
	and and_readB6(ctrl_readLabelB[6], ctrl_readRegB, label_readRegB[6]);
	and and_readB7(ctrl_readLabelB[7], ctrl_readRegB, label_readRegB[7]);
	and and_readB8(ctrl_readLabelB[8], ctrl_readRegB, label_readRegB[8]);
	and and_readB9(ctrl_readLabelB[9], ctrl_readRegB, label_readRegB[9]);
	and and_readB10(ctrl_readLabelB[10], ctrl_readRegB, label_readRegB[10]);
	and and_readB11(ctrl_readLabelB[11], ctrl_readRegB, label_readRegB[11]);
	and and_readB12(ctrl_readLabelB[12], ctrl_readRegB, label_readRegB[12]);
	and and_readB13(ctrl_readLabelB[13], ctrl_readRegB, label_readRegB[13]);
	and and_readB14(ctrl_readLabelB[14], ctrl_readRegB, label_readRegB[14]);
	and and_readB15(ctrl_readLabelB[15], ctrl_readRegB, label_readRegB[15]);
	and and_readB16(ctrl_readLabelB[16], ctrl_readRegB, label_readRegB[16]);
	and and_readB17(ctrl_readLabelB[17], ctrl_readRegB, label_readRegB[17]);
	and and_readB18(ctrl_readLabelB[18], ctrl_readRegB, label_readRegB[18]);
	and and_readB19(ctrl_readLabelB[19], ctrl_readRegB, label_readRegB[19]);
	and and_readB20(ctrl_readLabelB[20], ctrl_readRegB, label_readRegB[20]);
	and and_readB21(ctrl_readLabelB[21], ctrl_readRegB, label_readRegB[21]);
	and and_readB22(ctrl_readLabelB[22], ctrl_readRegB, label_readRegB[22]);
	and and_readB23(ctrl_readLabelB[23], ctrl_readRegB, label_readRegB[23]);
	and and_readB24(ctrl_readLabelB[24], ctrl_readRegB, label_readRegB[24]);
	and and_readB25(ctrl_readLabelB[25], ctrl_readRegB, label_readRegB[25]);
	and and_readB26(ctrl_readLabelB[26], ctrl_readRegB, label_readRegB[26]);
	and and_readB27(ctrl_readLabelB[27], ctrl_readRegB, label_readRegB[27]);
	and and_readB28(ctrl_readLabelB[28], ctrl_readRegB, label_readRegB[28]);
	and and_readB29(ctrl_readLabelB[29], ctrl_readRegB, label_readRegB[29]);
	and and_readB30(ctrl_readLabelB[30], ctrl_readRegB, label_readRegB[30]);
	and and_readB31(ctrl_readLabelB[31], ctrl_readRegB, label_readRegB[31]);

	register register0(data_readRegA, data_readRegB, data_writeReg, clock, 1'b0, label_readRegA[0], label_readRegB[0], ctrl_reset);
	register register1(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[1], label_readRegA[1], label_readRegB[1], ctrl_reset);
	register register2(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[2], label_readRegA[2], label_readRegB[2], ctrl_reset);
	register register3(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[3], label_readRegA[3], label_readRegB[3], ctrl_reset);
	register register4(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[4], label_readRegA[4], label_readRegB[4], ctrl_reset);
	register register5(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[5], label_readRegA[5], label_readRegB[5], ctrl_reset);
	register register6(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[6], label_readRegA[6], label_readRegB[6], ctrl_reset);
	register register7(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[7], label_readRegA[7], label_readRegB[7], ctrl_reset);
	register register8(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[8], label_readRegA[8], label_readRegB[8], ctrl_reset);
	register register9(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[9], label_readRegA[9], label_readRegB[9], ctrl_reset);
	register register10(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[10], label_readRegA[10], label_readRegB[10], ctrl_reset);
	register register11(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[11], label_readRegA[11], label_readRegB[11], ctrl_reset);
	register register12(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[12], label_readRegA[12], label_readRegB[12], ctrl_reset);
	register register13(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[13], label_readRegA[13], label_readRegB[13], ctrl_reset);
	register register14(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[14], label_readRegA[14], label_readRegB[14], ctrl_reset);
	register register15(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[15], label_readRegA[15], label_readRegB[15], ctrl_reset);
	register register16(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[16], label_readRegA[16], label_readRegB[16], ctrl_reset);
	register register17(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[17], label_readRegA[17], label_readRegB[17], ctrl_reset);
	register register18(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[18], label_readRegA[18], label_readRegB[18], ctrl_reset);
	register register19(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[19], label_readRegA[19], label_readRegB[19], ctrl_reset);
	register register20(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[20], label_readRegA[20], label_readRegB[20], ctrl_reset);
	register register21(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[21], label_readRegA[21], label_readRegB[21], ctrl_reset);
	register register22(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[22], label_readRegA[22], label_readRegB[22], ctrl_reset);
	register register23(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[23], label_readRegA[23], label_readRegB[23], ctrl_reset);
	register register24(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[24], label_readRegA[24], label_readRegB[24], ctrl_reset);
	register register25(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[25], label_readRegA[25], label_readRegB[25], ctrl_reset);
	register register26(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[26], label_readRegA[26], label_readRegB[26], ctrl_reset);
	register register27(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[27], label_readRegA[27], label_readRegB[27], ctrl_reset);
	register register28(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[28], label_readRegA[28], label_readRegB[28], ctrl_reset);
	register register29(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[29], label_readRegA[29], label_readRegB[29], ctrl_reset);
	register register30(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[30], label_readRegA[30], label_readRegB[30], ctrl_reset);
	register register31(data_readRegA, data_readRegB, data_writeReg, clock, ctrl_writeLabel[31], label_readRegA[31], label_readRegB[31], ctrl_reset);

endmodule