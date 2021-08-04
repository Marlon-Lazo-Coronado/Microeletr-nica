module test
(
    output reg clk,
    output reg reset,

    output reg[7:0] block0,
    output reg[7:0] block1,
    output reg[7:0] block2,
    output reg[7:0] block3,
    output reg[7:0] block4,
    output reg[7:0] block5,
    output reg[7:0] block6,
    output reg[7:0] block7,
    output reg[7:0] block8,
    output reg[7:0] block9,
    output reg[7:0] block10,
    output reg[7:0] block11,

    output reg start,
    output reg[15:0] target,

    input finish,

    input[7:0] nonce0,
    input[7:0] nonce1,
    input[7:0] nonce2,
    input[7:0] nonce3
); 


initial begin
    $dumpfile("perf_sys.vcd");
	$dumpvars;

    @(posedge clk);
	@(posedge clk);
    @(posedge clk);
        start <= 1;
    repeat(2) @(posedge clk);
        target <= 50;
	
        block0  <= 8'heb;
        block1 <= 8'had;
        block2 <= 8'h50;
        block3 <= 8'h90;
        block4 <= 8'h38;
        block5 <= 8'h43;
        block6 <= 8'hf9;
        block7 <= 8'hc9;
        block8 <= 8'haa;
        block9 <= 8'had;
        block10 <= 8'h6f;
        block11 <= 8'h64;
    repeat(27) @(posedge clk);
        start <= 0;
    $finish;
end

//clk.
initial clk <= 0;
always	#2 clk <= ~clk;

//resetn.
initial
begin
	#0
	reset = 1'b0;
	@(posedge clk);
	reset = 1'b0;
	@(posedge clk);
	reset = 1'b1;
end

endmodule
