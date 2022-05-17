`timescale 1ns/10ps
`define cycle 10.0
module ctrl_tb();

  reg clk, rst_n, start;
  reg [31:0] inst;

  wire busy, valid, bram0_enb, bram1_enb;
  wire [9:0] bram0_addrb, bram1_addrb;
  wire [3:0] bram1_web, dsp_alumode;
  wire [4:0] dsp_inmode;
  wire [6:0] dsp_opmode;

  controller #(3) c1(
    .clk(clk), 
    .rst_n(rst_n), 
    .start(start), 
    .busy(busy),
    .valid(valid),
    .inst(inst),
    .bram0_addrb(bram0_addrb),
    .bram0_enb(bram0_enb),
    .bram1_addrb(bram1_addrb),
    .bram1_web(bram1_web),
    .bram1_enb(bram1_enb),
    .dsp_alumode(dsp_alumode),
    .dsp_inmode(dsp_inmode),
    .dsp_opmode(dsp_opmode)
  );

  always #(`cycle/2) clk = ~clk;

  initial begin
    clk = 0; rst_n = 0; start = 0; inst = 0;
    #13  rst_n = 1; 
    #`cycle start = 1; inst=32'b10000000_01011000_10001100_01000000; // BRAM1[3] <= BRAM0[0] * BRAM1[2]
    #`cycle start = 0; 
    #10000 $finish;
  end


  initial begin
    $dumpfile("CTRL.vcd");
    $dumpvars;
  end
  
endmodule