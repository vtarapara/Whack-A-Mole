`timescale 1ns / 1ps

`include "processor.v"
`include "components/regfile/regfile.v"
`include "RAM.v"
`include "ROM.v"



// imports for processor
`include "components/utils/program_counter.v"
`include "components/utils/program_counter_register.v"
`include "components/utils/ff.v"

`include "components/utils/pipeline_latch.v"
`include "components/utils/status_latch.v"


// imports for regfile
`include "components/regfile/components/decoder.v"
`include "components/regfile/components/register.v"
`include "components/regfile/components/dffe_ref.v"
`include "components/utils/falling_dffe_ref.v"

// imports for alu
`include "components/alu-main/alu.v"
`include "components/alu-main/operations/add.v"
`include "components/alu-main/operations/sub.v"
`include "components/alu-main/operations/bitwise_or.v"
`include "components/alu-main/operations/bitwise_and.v"
`include "components/alu-main/operations/left_shift.v"
`include "components/alu-main/operations/right_shift.v"
`include "components/alu-main/operations/cla_block.v"
`include "components/alu-main/utils/mux32.v"

// imports for multdiv
`include "components/multdiv/multdiv.v"
`include "components/multdiv/register/register_components/booths_register.v"
`include "components/multdiv/register/register_components/div_register.v"
`include "components/multdiv/register/counter.v"
`include "components/multdiv/alu/alu_components/right_shift_64.v"


`include "components/multdiv/alu/mult_alu_wrapper.v"
`include "components/multdiv/alu/div_alu_wrapper.v"

`include "components/multdiv/components/booth_multiplier.v"
`include "components/multdiv/components/divider.v"
`include "components/utils/multdiv_ctrl_dffe.v"


// moles
`include "components/mole/mole_register.v"
`include "components/mole/mod_eight_counter.v"
`include "components/utils/falling_ff.v"
`include "components/mole/segment_display.v"
`include "components/mole/bin2bcd.v"



/**
 * 
 * READ THIS DESCRIPTION:
 *
 * This is the Wrapper module that will serve as the header file combining your processor, 
 * RegFile and Memory elements together.
 *
 * This file will be used to generate the bitstream to upload to the FPGA.
 * We have provided a sibling file, Wrapper_tb.v so that you can test your processor's functionality.
 * 
 * We will be using our own separate Wrapper_tb.v to test your code. You are allowed to make changes to the Wrapper files 
 * for your own individual testing, but we expect your final processor.v and memory modules to work with the 
 * provided Wrapper interface.
 * 
 * Refer to Lab 5 documents for detailed instructions on how to interface 
 * with the memory elements. Each imem and dmem modules will take 12-bit 
 * addresses and will allow for storing of 32-bit values at each address. 
 * Each memory module should receive a single clock. At which edges, is 
 * purely a design choice (and thereby up to you). 
 * 
 * You must change line 36 to add the memory file of the test you created using the assembler
 * For example, you would add sample inside of the quotes on line 38 after assembling sample.s
 *
 **/

module Wrapper (CLK100MHZ, BT_RESET, LED, JA, JB, AN, CA, CB, CC, CD, CE, CF, CG, DP);
	input CLK100MHZ, BT_RESET;
	output [15:0] LED;
	output [7:0] AN;
	output CA, CB, CC, CD, CE, CF, CG, DP;

	// assign AN = 8'b11111110;
	// assign CA = 0;
	// assign CB = 0;
	// assign CC = 0;
	// assign CD = 1;
	// assign CE = 1;
	// assign CF = 0;
	// assign CG = 0;
	// assign DP = 1;

	wire [2:0] clock_counter; // mod 8 counter for driving segment display
					
	wire [7:0] AN_IN;
	wire CA_IN, CB_IN, CC_IN, CD_IN, CE_IN, CF_IN, CG_IN, DP_IN;

	wire [43:0] dec_score, dec_high_score;
	wire [3:0] score_data;
	wire [3:0] off;
	assign off = 4'b1111;

	bin2bcd #(.W(32)) bcd_score(.bin(score), .bcd(dec_score));
	bin2bcd #(.W(32)) bcd_high_score(.bin(high_score), .bcd(dec_high_score));

	assign score_data = clock_counter == 3'b000 ? dec_score[3:0] : 
						clock_counter == 3'b001 ? dec_score[7:4] : 
						clock_counter == 3'b010 ? dec_score[11:8] : 
						clock_counter == 3'b011 ? dec_score[15:12] : 
						clock_counter == 3'b100 ? dec_high_score[3:0] : 
						clock_counter == 3'b101 ? dec_high_score[7:4] : 
						clock_counter == 3'b110 ? dec_high_score[11:8] : 
						clock_counter == 3'b111 ? dec_high_score[15:12] : 4'b1111;

	segment_display seg(.digit_data(score_data), .display_select(clock_counter), .AN(AN_IN), .CA(CA_IN), .CB(CB_IN), .CC(CC_IN), .CD(CD_IN), .CE(CE_IN), .CF(CF_IN), .CG(CG_IN), .DP(DP_IN));
	assign AN = AN_IN;
	assign CA = CA_IN;
	assign CB = CB_IN;
	assign CC = CC_IN;
	assign CD = CD_IN;
	assign CE = CE_IN;
	assign CF = CF_IN;
	assign CG = CG_IN;
	assign DP = DP_IN;


	localparam SYSTEM_FREQ = 100000000;

	localparam desired_freq = 1000000;
	localparam PULSE_WINDOW = SYSTEM_FREQ / desired_freq;
	localparam PULSE_BITS = $clog2(PULSE_WINDOW);

	wire [21:0] high_window;
	assign high_window = PULSE_WINDOW/2 + 1;
	reg clk_desired;

	reg[PULSE_BITS - 1:0] counter = 0;
	always @(posedge CLK100MHZ) begin
		if (counter < high_window) begin
			counter <= counter + 1;
		end else begin
			counter <= 0;
			clk_desired <= ~clk_desired;
		end
	end
	
	wire clock;
	assign clock = clk_desired;

	wire reset;

	assign reset = ~BT_RESET;

	wire rwe, mwe;
	wire[4:0] rd, rs1, rs2;
	wire[31:0] instAddr, instData, 
		rData, regA, regB,
		memAddr, memDataIn, memDataOut;


	// TODO: route JA/JB directly to register file
	input [7:0] JA;
	output [7:0] JB;

	// assign LED[7:0] = JA;

	wire [31:0] score, lives, high_score;

	assign LED[2] = lives == 32'd2;
	assign LED[1] = lives == 32'd1 | lives == 32'd2;
	assign LED[0] = lives == 32'd0 | lives == 32'd1 | lives == 32'd2;
	// assign LED[7:0] = 8'b11111111;

	// ADD YOUR MEMORY FILE HERE
	localparam INSTR_FILE = "despawn";
	
	// Main Processing Unit
	processor CPU(.clock(clock), .reset(reset), 
								
		// ROM
		.address_imem(instAddr), .q_imem(instData),
									
		// Regfile
		.ctrl_writeEnable(rwe),     .ctrl_writeReg(rd),
		.ctrl_readRegA(rs1),     .ctrl_readRegB(rs2), 
		.data_writeReg(rData), .data_readRegA(regA), .data_readRegB(regB),
									
		// RAM
		.wren(mwe), .address_dmem(memAddr), 
		.data(memDataIn), .q_dmem(memDataOut),
		
		// LED
		.score(score),
		.clock_counter(clock_counter)); 
	
	// Instruction Memory (ROM)
	ROM #(.MEMFILE({INSTR_FILE, ".mem"}))
	InstMem(.clk(clock), 
		.addr(instAddr[11:0]), 
		.dataOut(instData));
	
	// Register File
	regfile RegisterFile(.clock(clock), 
		.ctrl_writeEnable(rwe), .ctrl_reset(reset), 
		.ctrl_writeReg(rd),
		.ctrl_readRegA(rs1), .ctrl_readRegB(rs2), 
		.data_writeReg(rData), .data_readRegA(regA), .data_readRegB(regB), .JA(JA), .JB(JB), .score(score), .LED(LED), .lives(lives), .high_score(high_score));
						
	// Processor Memory (RAM)
	RAM ProcMem(.clk(clock), 
		.wEn(mwe), 
		.addr(memAddr[11:0]), 
		.dataIn(memDataIn), 
		.dataOut(memDataOut));

endmodule
