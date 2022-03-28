module not_sr_latch(
	input wire set_i,
	input wire reset_i,
	output wire q_out,
	output wire notq_out
);

	wire q_int, notq_int;

	assign q_int = ~(set_i & notq_int);
	assign notq_int = ~(reset_i & q_int);
	assign q_out = q_int;
	assign notq_out = notq_int;

endmodule