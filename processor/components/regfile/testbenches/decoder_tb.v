`timescale 1 ns / 100 ps

module decoder_tb();
    reg [4:0] stream;
    wire [31:0] label;

    decoder decoder(label, stream);

    initial begin
        stream = 0;
        #320;
        $finish;
    end

    always
        #10 begin
            stream[0] = ~stream[0];
        end

    always
        #20 begin
            stream[1] = ~stream[1];
        end

    always
        #40 begin
            stream[2] = ~stream[2];
        end

    always
        #80 begin
            stream[3] = ~stream[3];
        end

    always
        #160 begin
            stream[4] = ~stream[4];
        end


    always @(stream) begin
        #1
        $display("stream: %d, label: %d", stream, label);
    end

    initial begin
        $dumpfile("decoder.vcd");
        $dumpvars(0, decoder_tb);
    end
endmodule
