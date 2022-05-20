module mult ( // 25 * 19 => 25 * 18 + 
    input  [31:0] A,
    input  [31:0] B,
    output [47:0] POUT0,
    output [47:0] POUT1
);

assign POUT1 = A*B;

wire [42:0] POUT2 = {{18{A[24]}}, A[24:0]} * {{25{B[18]}}, B[18:1]};
wire [47:0] tmp1 = {{5{POUT2[42]}}, POUT2};

wire fabric1 = A[0] & B[0];
wire [23:0] fabric2 = B[0] ? A[24:1] : 0;

wire [46:0] tmp2 = tmp1[46:0] + {{23{fabric2[23]}}, fabric2};
assign POUT0 = {tmp2, fabric1};
endmodule