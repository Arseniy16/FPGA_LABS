module d_latch(
    input wire d_i,
    input wire c_i,
    output wire q_o,
    output wire notq_o
);

    wire set, reset;

    assign set = ~(d_i & c_i);
    assign reset = ~(~d_i & c_i);
    
    not_sr_latch not_sr_latch_inst(
        .set_i(set),
        .reset_i(reset),
        .q_out(q_o),
        .notq_out(notq_o)
    );
        
endmodule
