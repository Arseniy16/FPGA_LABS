`timescale 1ns/10ps

module tb;	

	reg set;
	reg reset;
	wire q;
	wire notq;
	
	sr_latch sr_latch_inst(
		.set_i(set),
		.reset_i(reset),
		.q_out(q),
		.notq_out(notq)
	);

	realtime period = 10;

	initial begin
		$dumpvars;
		$display("SUCCESS");
		
		set = 1;
		reset = 1;
		#period;
		
		set = 0;
		reset = 0;
		#period;

		set = 1;
		reset = 0;
		#period;

		set = 1;
		reset = 1;
		#period;

		set = 0;
		reset = 1;
		#period;

		$finish;
	end

endmodule



