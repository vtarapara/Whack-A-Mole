
module segment_display(
    input wire [3:0] digit_data,
    input wire [2:0] display_select,
    output wire [7:0] AN,
    output wire CA, CB, CC, CD, CE, CF, CG, DP
);

    assign AN[0] = ~(display_select == 3'b000);
    assign AN[1] = ~(display_select == 3'b001);
    assign AN[2] = ~(display_select == 3'b010);
    assign AN[3] = ~(display_select == 3'b011);
    assign AN[4] = ~(display_select == 3'b100);
    assign AN[5] = ~(display_select == 3'b101);
    assign AN[6] = ~(display_select == 3'b110);
    assign AN[7] = ~(display_select == 3'b111);

    assign CA = ~(digit_data == 4'd2 | digit_data == 4'd3 | digit_data == 4'd5 | digit_data == 4'd6 | digit_data == 4'd7 | digit_data == 4'd8 | digit_data == 4'd9 | digit_data == 4'd0);
    assign CB = ~(digit_data == 4'd1 | digit_data == 4'd2 | digit_data == 4'd3 | digit_data == 4'd4 | digit_data == 4'd7 | digit_data == 4'd8 | digit_data == 4'd9 | digit_data == 4'd0);
    assign CC = ~(digit_data == 4'd1 | digit_data == 4'd3 | digit_data == 4'd4 | digit_data == 4'd5 | digit_data == 4'd6 | digit_data == 4'd7 | digit_data == 4'd8 | digit_data == 4'd9 | digit_data == 4'd0);
    assign CD = ~(digit_data == 4'd2 | digit_data == 4'd3 | digit_data == 4'd5 | digit_data == 4'd6 | digit_data == 4'd8 | digit_data == 4'd9 | digit_data == 4'd0);
    assign CE = ~(digit_data == 4'd2 | digit_data == 4'd6 | digit_data == 4'd8 | digit_data == 4'd0);
    assign CF = ~(digit_data == 4'd4 | digit_data == 4'd5 | digit_data == 4'd6 | digit_data == 4'd8 | digit_data == 4'd9 | digit_data == 4'd0);
    assign CG = ~(digit_data == 4'd2 | digit_data == 4'd3 | digit_data == 4'd5 | digit_data == 4'd6 | digit_data == 4'd8 | digit_data == 4'd9 | digit_data == 4'd4);
    assign DP = 1'b1;

endmodule