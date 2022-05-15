module gpio_input_decoder(
	input [31:0] inst,
	output [4:0] bram0_raddr,
	output [4:0] bram1_raddr,
	output [4:0] bram1_waddr,
	output [4:0] dsp_inmode,
	output [6:0] dsp_opmode,
	output [3:0] dsp_alumode,
	output execute
);

	assign bram0_raddr = inst[4:0];
	assign bram1_raddr = inst[9:5];
	assign bram1_waddr = inst[14:10];
	assign dsp_inmode  = inst[19:15];
	assign dsp_opmode  = inst[26:20];
	assign dsp_alumode = inst[30:27];
	assign execute     = inst[31];

endmodule