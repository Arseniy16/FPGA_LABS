`timescale 1ns/10ps

module tb;  

    reg d;
    reg c;
    wire q;
    wire notq;
    
    d_latch d_latch_inst(
        .d_i(d),
        .c_i(c),
        .q_o(q),
        .notq_o(notq)
    );

    realtime period = 10;

    initial begin
        $dumpvars;
        $display("SUCCESS");
    
        d = 0;
        c = 0;
        #period;

        d = 0;
        c = 1;
        #period;

        d = 1;
        c = 0;
        #period;

        d = 1;
        c = 1;
        #period;

        d = 1;
        c = 0;
        #period;

        $finish;
    end

endmodule



