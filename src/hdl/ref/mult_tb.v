`timescale 1ns/10ps
`define cycle 10.0
module mult_tb ();

    reg  [31:0] A;
    reg  [31:0] B;
    wire [47:0] P0;
    wire [47:0] P1;

    mult m1(
        .A(A),
        .B(B),
        .POUT0(P0),
        .POUT1(P1)
    );

    initial begin
        A = 0 ; B = 0;
        #`cycle A = 32'hffffff23; B = 32'h00027623;
        #100 $finish;
        end


    initial begin
        $dumpfile("mult.vcd");
        $dumpvars;
    end

endmodule