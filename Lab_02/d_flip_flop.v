module d_flip_flop(
	input wire d_i,
	input wire clk_i,
	output wire q_o,
	output wire notq_o
);
	
	wire qm;
	
	d_latch d_latch_1(
		.d_i(d_i),
		.c_i(~clk_i),
		.q_o(qm)
	);
	
	d_latch d_latch_2(
		.d_i(qm),
		.c_i(clk_i),
		.q_o(q_o),
		.notq_o(notq_o)
	);
	
endmodule
