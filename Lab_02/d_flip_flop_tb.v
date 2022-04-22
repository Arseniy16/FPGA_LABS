`timescale 1ns/10ps

module tb;  

    reg d;
    reg clk;
    wire q;
    wire notq;
    
    integer i;
    realtime period = 10;
    reg [3:0] delay;    
    integer seed = 2; //for random
    
    d_flip_flop d_flip_flop_inst(
        .d_i(d),
        .clk_i(clk),
        .q_o(q),
        .notq_o(notq)
    );

    always #(period/2) clk = ~clk;

    initial begin
        $dumpvars;
        $display("SUCCESS");
        
        clk = 0;
        d = 0;
        #period;
        
        for (i = 0; i < 10; i=i+1)
        begin
            delay = $urandom(seed) % 10 + 1;
            #(delay) d = i;
            $display("delay = %0d: d = %0b, clk = %0b, q = %0b, notq = %0b", delay, d, clk, q, notq);
        end
        
        #period;
        $finish;
    end

endmodule



