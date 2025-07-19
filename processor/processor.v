/**
 * READ THIS DESCRIPTION!
 *
 * This is your processor module that will contain the bulk of your code submission. You are to implement
 * a 5-stage pipelined processor in this module, accounting for hazards and implementing bypasses as
 * necessary.
 *
 * Ultimately, your processor will be tested by a master skeleton, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file, Wrapper.v, acts as a small wrapper around your processor for this purpose. Refer to Wrapper.v
 * for more details.
 *
 * As a result, this module will NOT contain the RegFile nor the memory modules. Study the inputs 
 * very carefully - the RegFile-related I/Os are merely signals to be sent to the RegFile instantiated
 * in your Wrapper module. This is the same for your memory elements. 
 *
 *
 */
 module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for RegFile
    ctrl_writeReg,                  // O: Register to write to in RegFile
    ctrl_readRegA,                  // O: Register to read from port A of RegFile
    ctrl_readRegB,                  // O: Register to read from port B of RegFile
    data_writeReg,                  // O: Data to write to for RegFile
    data_readRegA,                  // I: Data from port A of RegFile
    data_readRegB,                  // I: Data from port B of RegFile

    score,
    clock_counter,
	);

	// Control signals
	input clock, reset;
	
	// Imem
    output [31:0] address_imem;
	input [31:0] q_imem;

	// Dmem
	output [31:0] address_dmem, data;
	output wren;
	input [31:0] q_dmem;

	// Regfile
	output ctrl_writeEnable;
	output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	output [31:0] data_writeReg;
	input [31:0] data_readRegA, data_readRegB;

    // LED
    input [31:0] score;

    output [2:0] clock_counter;

    // assign pc_counter to led
    // // assign led[15] = opcode == 5'b00101;
    // assign led[14] = opcode == 5'b11111;
    // assign led[13] = opcode == 5'b11110;
    // assign led = score[15:0];
    // ----------------- START OF WHACK-A-MOLE ----------------- //

    // TODO: implement new opcodes

    // FETCH: implement new instruction (monitor immediate) 11111
    // DECODE: monitor input[immediate] which monitors hole i by reading the corresponding register ($r10-$r17) for input, also read in corresponding register ($r20-$r27)
    // EXECUTE: calculate $r2x - $r1x
    // MEMORY: generate a flag that gets bypassed to score execute that indicates whether or not we should -1/0/+1 score
    // WRITEBACK: write execute output to $r2x unless it is -1

    // FETCH: implement new instruction (score immediate) 11110
    // DECODE: fetch $r1 (score register)
    // EXECUTE: calculate $1 + (bypassed value from monitor in memory phase)
    // MEMORY: none
    // WRITEBACK: write execute output to $r1


    // FETCH: implement new instruction (srmole [spawn random mole]) 11101
    // DECODE: none
    // EXECUTE: none
    // MEMORY: none
    // WRITEBACK: write 1 to $rmole_spawn_hole

    // spawning a mole can also be done with addi


    // FETCH: implement new instruction (bs [branch on score] 11100)
    // DECODE: none
    // EXECUTE: none


    // mips flow will be: spawn routine -> loop(monitor immediate, score immediate, monitor immediate, score immediate....), branch to return to spawn routine

    // input [7:0] PRESSURE_SENSORS;
    // output [7:0] PRESSURE_LEDS;


    // wire [7:0] active_moles, active_moles_next;

    // mole_register active_moles_register(active_moles, active_moles_next, clock, 1'b1, 1'b1, reset);

    // wire [7:0] moles_hit; // should be 1 if a valid mole is hit
    // assign moles_hit = active_moles & PRESSURE_SENSORS;

    // wire mole_hit;
    // assign mole_hit = moles_hit != 8'b0;


    // wire [7:0] new_active_moles;
    // wire mole_sub_ovf;
    // sub remove_moles(new_active_moles, active_moles, moles_hit, mole_sub_ovf); // remove moles that have been hit
    // assign active_moles_next = new_active_moles; // should change to include adding moles as well


    // assign PRESSURE_LEDS = PRESSURE_SENSORS; // debug

    // assign led[8] = PRESSURE_SENSORS[0];




    // ----------------- END OF WHACK-A-MOLE ----------------- //
    
	/* YOUR CODE STARTS HERE */

    // list all latches (note that fd_latch[95:64] == 0)
    wire [95:0] read_fd_latch, read_dx_latch, read_xm_latch, read_mw_latch;
    wire [95:0] write_fd_latch, write_dx_latch, write_xm_latch, write_mw_latch;

    wire [31:0] read_xm_status_latch, read_mw_status_latch;
    wire [31:0] write_xm_status_latch, write_mw_status_latch;

    pipeline_latch fd_latch(read_fd_latch, write_fd_latch, clock, 1'b1, 1'b1, reset);
    pipeline_latch dx_latch(read_dx_latch, write_dx_latch, clock, 1'b1, 1'b1, reset);
    pipeline_latch xm_latch(read_xm_latch, write_xm_latch, clock, 1'b1, 1'b1, reset);
    pipeline_latch mw_latch(read_mw_latch, write_mw_latch, clock, 1'b1, 1'b1, reset);

    status_latch xm_status_latch(read_xm_status_latch, write_xm_status_latch, clock, 1'b1, 1'b1, reset);
    status_latch mw_status_latch(read_mw_status_latch, write_mw_status_latch, clock, 1'b1, 1'b1, reset);


    // ----------------- FETCH ----------------- //
    // START OF WHACK-A-MOLE FETCH
    wire [2:0] mole_spawn_hole;
    mod_eight_counter hole(mole_spawn_hole, clock, reset, 1'b1);
    // END OF WHACK-A-MOLE FETCH
    assign clock_counter = mole_spawn_hole;


    // fetch instruction
    wire [31:0] program_counter, incremented_program_counter, new_program_counter;
    wire pc_ovf;


    // add pc_increment(incremented_program_counter, program_counter, multdiv_stall ? 32'b0 : 32'b1); // submission
    add pc_increment(incremented_program_counter, program_counter, (multdiv_stall) ? 32'b0 : 32'b1, pc_ovf);

    assign new_program_counter = branch_taken ? new_pc : incremented_program_counter;
    program_counter_register pc_register(program_counter, new_program_counter, clock, 1'b1, 1'b1, reset);

    assign address_imem = program_counter;
    assign write_fd_latch = (multdiv_stall) ? read_fd_latch : branch_taken ? 96'b0 : q_imem; // if multdiv_stall, rewrite the same values


    // ----------------- DECODE ----------------- //


    // START OF WHACK-A-MOLE DECODE
    wire [26:0] mole_immediate;
    assign mole_immediate = read_fd_latch[26:0];

    wire [4:0] mole_sensor_register, mole_led_register;
    wire mole_sensor_reg_ovf, mole_led_reg_ovf;
    add calc_mole_sensor_register(mole_sensor_register, mole_immediate, 5'd10, mole_sensor_reg_ovf); // read $r1x
    add calc_mole_led_register(mole_led_register, mole_immediate, 5'd20, mole_led_reg_ovf); // read $r2x

    // END OF WHACK-A-MOLE DECODE


    // decode instruction

    // R INSTRUCTION: opcode $rd $rs $rt shamt aluop
    // I INSTRUCTION: opcode $rd $rs immediate
    // JI INSTRUCTION: opcode target
    // JII INSTRUCTION: opcode $rd

    wire [31:0] instruction_latch = read_fd_latch[31:0];

    wire [4:0] opcode, rd, rs, rt, shamt, aluop;
    wire [16:0] immediate;
    wire [26:0] target;

    assign opcode = instruction_latch[31:27];

    assign rd = instruction_latch[26:22];
    assign rs = instruction_latch[21:17];

    assign rt = instruction_latch[16:12];
    assign shamt = instruction_latch[11:7];
    assign aluop = instruction_latch[6:2];

    assign immediate = instruction_latch[16:0];
    assign target = instruction_latch[26:0];

    // determine which addresses to read from regfile
    wire [4:0] read_regA, read_regB;

    // if it is an ALU operation, do not use rd, rs, use rs, rt
    assign read_regA = (opcode == 5'b11110) ? 5'b1 : (opcode == 5'b11111) ? mole_sensor_register : (opcode == 5'b10110) ? 5'b11110 : (opcode == 5'b00000) ? rs : rd; // if bex, load $rstatus
    assign read_regB = (opcode == 5'b11111) ? mole_led_register : (opcode == 5'b00000) ? rt : rs;

    // fetch values from regfile
    assign ctrl_readRegA = read_regA;
    assign ctrl_readRegB = read_regB;
    assign write_dx_latch = (multdiv_stall) ? read_dx_latch : branch_taken ? 96'b0 : {data_readRegA, data_readRegB, instruction_latch}; // if multdiv_stall, rewrite the same values





    // ----------------- EXECUTE ----------------- //

    // START OF WHACK-A-MOLE EXECUTE
    wire [31:0] mole_output;

    // 00: none, 0
    // 01: was not hit, 0
    // 10: invalid hit, -1
    // 11: valid hit, +1
    mux_4 mole_hit_LUT(mole_output, {execute_rd[0], execute_rs[0]}, 32'b0, 32'b0, 32'b0, 32'b1);


    // assign led[4:0] = execute_opcode;

    // assign led[8] = execute_rd[0]; // hit status
    // assign led[9] = execute_rs[0]; // led status
    // assign led[11:10] = {mole_output[31], mole_output[0]};

    // assign led[15:12] = score[3:0];

    wire [31:0] execute_score;
    wire mole_score_bypass;
    assign mole_score_bypass = memory_opcode == 5'b11111 ? 1'b1 : 1'b0; // bypass if we are monitoring a mole

    wire [31:0] mole_score_increment;
    assign mole_score_increment = mole_score_bypass ? memory_mole_score_value : 32'b0;

    wire calculate_mole_score_ovf;
    add calculate_mole_score(execute_score, execute_rd, mole_score_increment, calculate_mole_score_ovf);
    
    // END OF WHACK-A-MOLE EXECUTE

    // EXECUTE LW STALL
    wire lw_stall;
    assign lw_stall = read_xm_latch[31:27] == 5'b01000 & ((read_xm_latch[26:22] == read_dx_latch[26:22]) | (read_xm_latch[26:22] == read_dx_latch[21:17]) | (read_xm_latch[26:22] == read_dx_latch[16:12])); // if we have a load word and the loaded address is the same as $rd, $rs, $rt of the execute stage

    // END LW STALL


    // EXECUTE BYPASSING LOGIC
    wire alu_inputA_bypass, alu_inputB_bypass;
    wire [31:0] alu_inputA_bypass_value, alu_inputB_bypass_value;

    wire alu_inputA_memory_bypass, alu_inputB_memory_bypass;
    wire alu_inputA_writeback_bypass, alu_inputB_writeback_bypass;

    wire [31:0] alu_inputA_memory_bypass_value, alu_inputB_memory_bypass_value;
    wire [31:0] alu_inputA_writeback_bypass_value, alu_inputB_writeback_bypass_value;

    wire alu_inputA_memory_exception_bypass, alu_inputB_memory_exception_bypass;
    wire alu_inputA_writeback_exception_bypass, alu_inputB_writeback_exception_bypass;

    wire [31:0] alu_inputA_memory_exception_bypass_value, alu_inputB_memory_exception_bypass_value;
    wire [31:0] alu_inputA_writeback_exception_bypass_value, alu_inputB_writeback_exception_bypass_value;

    wire rd_memory_bypass, rd_writeback_bypass;
    wire [31:0] rd_memory_bypass_value, rd_writeback_bypass_value;


    // memory bypasses
    assign alu_inputA_memory_bypass = (memory_opcode == 5'b00000 | memory_opcode == 5'b00101) & (read_xm_latch[26:22] == read_dx_latch[21:17] & read_dx_latch[21:17] != 32'b0) ? 1'b1 : 1'b0; // bypass if alu operation and $rs == $rd at different stage
    assign alu_inputB_memory_bypass = (memory_opcode == 5'b00000 | memory_opcode == 5'b00101) & (read_xm_latch[26:22] == read_dx_latch[16:12] & read_dx_latch[16:12] != 32'b0) ? 1'b1 : 1'b0; // bypass if alu operation and $rs == $rd at different stage
    assign alu_inputA_memory_exception_bypass = ((memory_opcode == 5'b00000 | memory_opcode == 5'b00101) & read_dx_latch[21:17] == 32'd30) & (read_xm_status_latch != 32'b0) ? 1'b1 : 1'b0; // bypass if alu operation and exception
    assign alu_inputB_memory_exception_bypass = ((memory_opcode == 5'b00000 | memory_opcode == 5'b00101) & read_dx_latch[16:12] == 32'd30) & (read_xm_status_latch != 32'b0) ? 1'b1 : 1'b0; // bypass if alu operation and exception

    assign rd_memory_bypass = (memory_opcode == 5'b00000 | memory_opcode == 5'b00101) & (read_xm_latch[26:22] == read_dx_latch[26:22] & read_dx_latch[26:22] != 32'b0) ? 1'b1 : 1'b0; // bypass if alu operation and $rs == $rd 

    // writeback bypasses
    assign alu_inputA_writeback_bypass = (writeback_opcode == 5'b00000 | writeback_opcode == 5'b00101 | writeback_opcode == 5'b01000 | (lw_stall & memory_opcode == 5'b01000)) & ((read_mw_latch[26:22] == read_dx_latch[21:17] & read_dx_latch[21:17] != 32'b0) | (lw_stall & read_xm_latch[26:22] == read_dx_latch[21:17] & read_dx_latch[21:17] != 32'b0)) ? 1'b1 : 1'b0; // bypass if alu operation and $rs == $rd at different stage
    assign alu_inputB_writeback_bypass = (writeback_opcode == 5'b00000 | writeback_opcode == 5'b00101 | writeback_opcode == 5'b01000 | (lw_stall & memory_opcode == 5'b01000)) & ((read_mw_latch[26:22] == read_dx_latch[16:12] & read_dx_latch[16:12] != 32'b0) | (lw_stall & read_xm_latch[26:22] == read_dx_latch[16:12] & read_dx_latch[16:12] != 32'b0)) ? 1'b1 : 1'b0; // bypass if alu operation and $rs == $rd at different stage
    assign alu_inputA_writeback_exception_bypass = ((writeback_opcode == 5'b00000 | writeback_opcode == 5'b00101) & read_dx_latch[21:17] == 32'd30) & (read_mw_status_latch != 32'b0) ? 1'b1 : 1'b0; // bypass if alu operation and exception
    assign alu_inputB_writeback_exception_bypass = ((writeback_opcode == 5'b00000 | writeback_opcode == 5'b00101) & read_dx_latch[16:12] == 32'd30) & (read_mw_status_latch != 32'b0) ? 1'b1 : 1'b0; // bypass if alu operation and exception

    assign rd_writeback_bypass = (writeback_opcode == 5'b00000 | writeback_opcode == 5'b00101 | writeback_opcode == 5'b01000) & (read_mw_latch[26:22] == read_dx_latch[26:22] & read_dx_latch[26:22] != 32'b0) ? 1'b1 : 1'b0;

    // memory values
    assign alu_inputA_memory_bypass_value = alu_inputA_memory_exception_bypass ? read_xm_status_latch : read_xm_latch[95:64];
    assign alu_inputB_memory_bypass_value = alu_inputB_memory_exception_bypass ? read_xm_status_latch : read_xm_latch[95:64];
    assign rd_memory_bypass_value = read_xm_latch[95:64];

    // writeback values
    assign alu_inputA_writeback_bypass_value = alu_inputA_writeback_exception_bypass ? read_mw_status_latch : (writeback_opcode == 5'b01000 | (lw_stall & memory_opcode == 5'b01000) ? q_dmem : read_mw_latch[95:64]);
    assign alu_inputB_writeback_bypass_value = alu_inputB_writeback_exception_bypass ? read_mw_status_latch : read_mw_latch[95:64];
    assign rd_writeback_bypass_value = read_mw_latch[95:64];


    wire rd_bypass;
    wire [31:0] rd_bypass_value;
    assign rd_bypass = rd_memory_bypass | rd_writeback_bypass;
    assign rd_bypass_value = rd_memory_bypass ? rd_memory_bypass_value : rd_writeback_bypass ? rd_writeback_bypass_value : 32'b0;

    // determine if we need to bypass
    assign alu_inputA_bypass = alu_inputA_memory_bypass | alu_inputA_writeback_bypass | alu_inputA_memory_exception_bypass | alu_inputA_writeback_exception_bypass ? 1'b1 : 1'b0;
    assign alu_inputB_bypass = execute_opcode == 5'b00000 & (alu_inputB_memory_bypass | alu_inputB_writeback_bypass | alu_inputB_memory_exception_bypass | alu_inputB_writeback_exception_bypass) ? 1'b1 : 1'b0;

    // set bypass values if necessary
    assign alu_inputA_bypass_value = (alu_inputA_memory_bypass | alu_inputA_memory_exception_bypass) ? alu_inputA_memory_bypass_value : (alu_inputA_writeback_bypass | alu_inputA_writeback_exception_bypass) ? alu_inputA_writeback_bypass_value : 32'b0; // bypass if alu operation and $rs == $rd at different stage
    assign alu_inputB_bypass_value = (alu_inputB_memory_bypass | alu_inputB_memory_exception_bypass) ? alu_inputB_memory_bypass_value : (alu_inputB_writeback_bypass | alu_inputB_writeback_exception_bypass) ? alu_inputB_writeback_bypass_value : 32'b0;


    // END EXECUTE BYPASSING LOGIC



    wire [31:0] alu_inputA, alu_inputB;

    wire [31:0] execute_rd, execute_rs;
    assign execute_rd = read_dx_latch[95:64];
    assign execute_rs = read_dx_latch[63:32];

    wire [4:0] execute_opcode;

    // load immediate value to prepare to overwrite rt
    wire [16:0] execute_immediate;
    assign execute_immediate = read_dx_latch[16:0];

    wire [31:0] overwrite_rt, execute_sign_extended_immediate;
    assign execute_sign_extended_immediate = { {15{execute_immediate[16]}}, execute_immediate };



    assign alu_inputA = (rd_bypass & (execute_opcode == 5'b00010 | execute_opcode == 5'b00110)) ? rd_bypass_value : alu_inputA_bypass ? alu_inputA_bypass_value : (execute_opcode == 5'b00101 || execute_opcode == 5'b00111 || execute_opcode == 5'b01000) ? execute_rs : execute_rd; // rs : rd
    // add immediate, store word, load word use immediate instead of rs
    assign alu_inputB = (rd_bypass & alu_inputA_bypass & (execute_opcode == 5'b00010 | execute_opcode == 5'b00110)) ? alu_inputA_bypass_value : alu_inputB_bypass ? alu_inputB_bypass_value : (execute_opcode == 5'b00101 || execute_opcode == 5'b00111 || execute_opcode == 5'b01000) ? execute_sign_extended_immediate : execute_rs; // immediate : rs


    // call alu
    wire [4:0] execute_aluop, execute_shiftamt; // inputs
    wire [31:0] alu_output; // output
    wire execute_isNotEqual, execute_isLessThan, execute_overflow; // output

    assign execute_opcode = read_dx_latch[31:27]; // use to determine if we want to execute an alu operation

    // add immediate, store word, load word should be treated as add
    assign execute_aluop = (execute_opcode == 5'b00101 || execute_opcode == 5'b00111 || execute_opcode == 5'b01000) ? 5'b00000 : read_dx_latch[6:2];
    assign execute_shiftamt = read_dx_latch[11:7]; // if not a shift operation, this will be ignored

    alu basic_alu(alu_inputA, alu_inputB, execute_aluop, execute_shiftamt, alu_output, execute_isNotEqual, execute_isLessThan, execute_overflow);


    wire execute_is_mult, execute_is_div;

    assign execute_is_mult = execute_opcode == 5'b00000 & execute_aluop == 5'b00110;
    assign execute_is_div = execute_opcode == 5'b00000 & execute_aluop == 5'b00111;

    wire [31:0] multdiv_output;
    wire multdiv_exception, multdiv_result_rdy;

    wire execute_ctrl_mult, execute_ctrl_div, execute_reset_mult, execute_reset_div;


    assign execute_reset_mult = ~execute_is_mult | multdiv_result_rdy; // reset mult if the operation is mult
    assign execute_reset_div = ~execute_is_div | multdiv_result_rdy; // reset div if the operation is div
    
    multdiv_ctrl_dffe mult_ctrl(execute_ctrl_mult, execute_reset_mult, clock, 1'b1, reset);
    multdiv_ctrl_dffe div_ctrl(execute_ctrl_div, execute_reset_div, clock, 1'b1, reset);

    multdiv multdiv_unit(alu_inputA, alu_inputB, execute_ctrl_mult & execute_is_mult, execute_ctrl_div & execute_is_div, clock, multdiv_output, multdiv_exception, multdiv_result_rdy);


    wire [31:0] alu_status_error;
    wire multdiv_stall;
    assign multdiv_stall = execute_opcode == 5'b00000 & (execute_aluop == 5'b00110 | execute_aluop == 5'b00111) & ~multdiv_result_rdy; // stall if the operation is mult/div and the result is not ready

    // TODO: execute_overflow should be passed to the next stage
    // it should set $r30 on overflow
    // 1 for add (execute_opcode == 5'b00000 & execute_aluop == 5'b00000)
    // 2 for addi (execute_opcode == 5'b00101)
    // 3 for sub (execute_opcode == 5'b00000 & execute_aluop == 5'b00001)
    mux_8 xm_status(alu_status_error, execute_aluop, 32'b1, 32'b11, 32'b0, 32'b0, 32'b0, 32'b0, 32'b100, 32'b101);

    wire [31:0] execute_alu_overflow, execute_multdiv_overflow;

    assign execute_alu_overflow = execute_overflow ? (execute_opcode == 5'b00101 ? 32'b10 : alu_status_error) : 32'b0;

    
    assign execute_multdiv_overflow = multdiv_exception ? (execute_is_mult ? 32'b100 : (execute_is_div ? 32'b101 : 32'b0)) : 32'b0;

    wire execute_is_reg; // indicates add, sub, or addi
    assign execute_is_reg = execute_opcode == 5'b00000 & (execute_aluop == 5'b00000 | execute_aluop == 5'b00001) | execute_opcode == 5'b00101;

    assign write_xm_status_latch = multdiv_stall ? read_xm_status_latch : execute_is_reg ? execute_alu_overflow : (execute_is_mult | execute_is_div) & multdiv_result_rdy ? execute_multdiv_overflow : 32'b0;


    // note that we are not yet passing neq, lt, ovf to the next stage

    wire [31:0] xm_latch_val1, xm_latch_val2, xm_latch_val3;
    assign xm_latch_val1 = (execute_opcode == 5'b11110) ? execute_score : (execute_opcode == 5'b11111) ? mole_output : (execute_opcode == 5'b00011) ? cur_pc_minus_1 : (multdiv_result_rdy & (execute_is_mult | execute_is_div) ? multdiv_output : alu_output);
    assign xm_latch_val2 = (execute_opcode == 5'b00111 | execute_opcode == 5'b01000) ? read_dx_latch[95:64] : read_dx_latch[63:32]; // if store word or load word, use rd, else use rs
    assign xm_latch_val3 = read_dx_latch[31:0];

    assign write_xm_latch = multdiv_stall ? read_xm_latch : writeback_opcode == 5'b00011 ? 96'b0 : {xm_latch_val1, xm_latch_val2, xm_latch_val3}; // alu_output, rd/rs, instruction
    

    // PC UPDATES
    wire branch_taken;

    assign branch_taken = writeback_opcode == 5'b00011 || ((execute_opcode == 5'b10110 & execute_rd != 5'b0) || execute_opcode == 5'b00001 || (execute_opcode == 5'b11100 & (execute_score != writeback_mole_score_value)) || writeback_opcode == 5'b00011 || execute_opcode == 5'b00100 || (execute_opcode == 5'b00010 & execute_isNotEqual) || (execute_opcode == 5'b00110 & execute_isLessThan)) ? 1'b1 : 1'b0; // bex, j, jal, jr, bne, blt

    wire [31:0] new_pc, new_pc_uncorrected;

    // all inputs should be 32 bits, these wil get sign extended
    wire [31:0] execute_sign_extended_jimmediate;
    assign execute_sign_extended_jimmediate = { {5{read_dx_latch[26]}}, read_dx_latch[26:0] };

    // calculate new PC for BNE BLT (PC = PC + 1 + N)
    // cur_pc - 1 + N
    wire execute_branch_target_sub_ovf, execute_branch_target_add_ovf, pc_correction_ovf;
    wire [31:0] cur_pc_minus_1, execute_branch_target;


    // sub sub_pc_minus_1(cur_pc_minus_1, program_counter, 32'b1); // submission
    // add add_new_pc(execute_branch_target, cur_pc_minus_1, execute_sign_extended_immediate); // submission

    sub sub_pc_minus_1(cur_pc_minus_1, program_counter, 32'b1, execute_branch_target_sub_ovf);
    add add_new_pc(execute_branch_target, cur_pc_minus_1, execute_sign_extended_immediate, execute_branch_target_add_ovf);


    mux_32 mux_pc(new_pc_uncorrected, execute_opcode, 32'b00000, execute_sign_extended_jimmediate, execute_branch_target, execute_sign_extended_jimmediate, execute_rd, 32'b00101, execute_branch_target, 32'b00111, 32'b01000, 32'b01001, 32'b01010, 32'b01011, 32'b01100, 32'b01101, 32'b01110, 32'b01111, 32'b10000, 32'b10001, 32'b10010, 32'b10011, 32'b10100, 32'b10101, execute_sign_extended_jimmediate, 32'b10111, 32'b11000, 32'b11001, 32'b11010, 32'b11011, execute_sign_extended_jimmediate, 32'b11101, 32'b11110, 32'b11111);

    // hacky way of executing $rstatus update and pc update at the same time with JAL
    // sub correct_pc(new_pc, (writeback_opcode == 5'b00011 ? writeback_sign_extended_jimmediate : new_pc_uncorrected), (writeback_opcode == 5'b00011 || execute_opcode == 5'b10110 ? 32'b0 : 32'b1)); // submission

    // sub correct_pc(new_pc, (writeback_opcode == 5'b00011 ? writeback_sign_extended_jimmediate : new_pc_uncorrected), (writeback_opcode == 5'b00011 | execute_opcode == 5'b10110 ? 32'b0 : 32'b1), pc_correction_ovf); // subtract 1 from pc because instructions fetched 1 step later, except for jal (00011)

    assign new_pc = writeback_opcode == 5'b00011 ? writeback_sign_extended_jimmediate : ((execute_opcode == 5'b00100 & rd_bypass) ? rd_bypass_value : new_pc_uncorrected);


    // ----------------- MEMORY ----------------- //

    // START OF WHACK-A-MOLE MEMORY
    wire [31:0] memory_mole_score_value;
    assign memory_mole_score_value = read_xm_latch[95:64]; // this value gets bypassed to the execute stage

    // END OF WHACK-A-MOLE MEMORY

    // START MEMORY BYPASSING
    // if we have lw -> sw, we want to pass qdmem (from the writeback stage) to the memory stage

    wire memory_store_bypass;
    wire [31:0] memory_store_bypass_value;

    assign memory_store_bypass = memory_opcode == 5'b00111 & writeback_opcode == 5'b01000 & read_xm_latch[26:22] == read_mw_latch[26:22] & read_mw_latch[26:22] != 32'b0;
    assign memory_store_bypass_value = q_dmem;

    // bypass if we have alu -> sw, where sw address is dependent on alu output
    wire memory_store_alu_bypass;
    wire [31:0] memory_store_alu_bypass_value;

    assign memory_store_alu_bypass = memory_opcode == 5'b00111 & (writeback_opcode == 5'b00000 | writeback_opcode == 5'b00101) & read_xm_latch[26:22] == read_mw_latch[26:22] & read_mw_latch[26:22] != 32'b0;
    assign memory_store_alu_bypass_value = read_mw_latch[95:64];



    // this is part of the memory bypassing logic but is part of execute stage
    // if we have alu -> sw, where sw address is dependent on alu output, we want to pass alu_output (read_xm_latch[95:64]) to the execute stage and use that
    // this is true if $rs_dx == $rd_xm (read_dx_latch[21:17] == read_xm_latch[26:22]) and $rd_xm != 0

    // END MEMORY BYPASSING


    // read from dmem if necessary

    wire [31:0] memory_register_value, memory_alu_output;
    wire [4:0] memory_opcode;

    assign memory_opcode = read_xm_latch[31:27];

    assign memory_alu_output = read_xm_latch[95:64];
    assign memory_register_value = read_xm_latch[63:32];
    


    assign address_dmem = memory_alu_output;
    assign data = memory_store_bypass ? memory_store_bypass_value : memory_store_alu_bypass ? memory_store_alu_bypass_value : memory_register_value;
    assign wren = (memory_opcode == 5'b00111) ? 1'b1 : 1'b0; // wren if store word



    // pass through to next stage
    assign write_mw_latch = multdiv_stall ? read_mw_latch : writeback_opcode == 5'b00011 ? 96'b0 : read_xm_latch;
    assign write_mw_status_latch = multdiv_stall ? read_mw_status_latch : read_xm_status_latch;



    // ----------------- WRITEBACK ----------------- //
    // write to regfile if necessary

    // START OF WHACK-A-MOLE WRITEBACK
    wire [31:0] writeback_mole_score_value;
    assign writeback_mole_score_value = read_mw_latch[95:64]; // this value gets bypassed to the execute stage 

    wire [4:0] writeback_mole_led_register;
    wire calculate_mole_led_register_ovf;
    add update_mole_status(writeback_mole_led_register, 5'd20, read_mw_latch[16:0], calculate_mole_led_register_ovf);

    wire writeback_remove_mole = read_mw_latch[31:27] == 5'b11111 & writeback_mole_score_value == 32'b1; // remove mole if correct opcode and we plan to increment the score
    // END OF WHACK-A-MOLE WRITEBACK

    wire [4:0] writeback_opcode;
    assign writeback_opcode = read_mw_latch[31:27];

    wire [31:0] writeback_sign_extended_jimmediate;
    assign writeback_sign_extended_jimmediate = { {5{read_mw_latch[26]}}, read_mw_latch[26:0] };

    wire [31:0] adjusted_mole_spawn_hole;
    wire adjusted_mole_spawn_hole_ovf;
    add add_mole_spawn_hole(adjusted_mole_spawn_hole, mole_spawn_hole, 32'd20, adjusted_mole_spawn_hole_ovf);


    assign ctrl_writeReg = writeback_opcode == 5'b11101 ? adjusted_mole_spawn_hole : writeback_opcode == 5'b11110 ? 5'b1 : writeback_remove_mole ? writeback_mole_led_register : (read_mw_status_latch != 32'b0 || writeback_opcode == 5'b10101) ? 5'b11110 : (writeback_opcode == 5'b00011) ? 5'b11111 : read_mw_latch[26:22]; // write to $rstatus if overflow setx / $ra if jal
    assign data_writeReg = writeback_opcode == 5'b11101 ? writeback_sign_extended_jimmediate : writeback_opcode == 5'b11110 ? read_mw_latch[95:64] : writeback_remove_mole ? 32'b0 : read_mw_status_latch != 32'b0 ? read_mw_status_latch : (writeback_opcode == 5'b10101) ? writeback_sign_extended_jimmediate : (writeback_opcode == 5'b01000) ? q_dmem : read_mw_latch[95:64]; // write immediate, value from memory, alu output

    assign ctrl_writeEnable = writeback_opcode == 5'b11101 ? 1'b1 : writeback_opcode == 5'b11110 | writeback_remove_mole | read_mw_status_latch != 32'b0 | (read_mw_latch[31:0] != 32'b0 & (writeback_opcode == 5'b00000 || writeback_opcode == 5'b00101 || writeback_opcode == 5'b01000 || writeback_opcode == 5'b10101 || writeback_opcode == 5'b00011)) ? 1'b1 : 1'b0; // write back to register if overflow or alu operation or load word or setx or jald

	/* END CODE */
endmodule