`timescale 1ns/100ps

`include "area_sys.v"
`include "test.v"

module test_bench;

    wire clk;
    wire reset;

    wire[7:0] block0;
    wire[7:0] block1;
    wire[7:0] block2;
    wire[7:0] block3;
    wire[7:0] block4;
    wire[7:0] block5;
    wire[7:0] block6;
    wire[7:0] block7;
    wire[7:0] block8;
    wire[7:0] block9;
    wire[7:0] block10;
    wire[7:0] block11;

	wire finish;
    wire start;
    wire[15:0] target;

    wire[7:0] nonce0;
    wire[7:0] nonce1;
    wire[7:0] nonce2;
    wire[7:0] nonce3;

area_sys COND(
    /*AUTOINST*/
	      // Outputs
	      .nonce0			(nonce0[7:0]),
	      .nonce1			(nonce1[7:0]),
	      .nonce2			(nonce2[7:0]),
	      .nonce3			(nonce3[7:0]),
	      .finish			(finish),
	      // Inputs
	      .clk			(clk),
	      .reset			(reset),
	      .block0			(block0[7:0]),
	      .block1			(block1[7:0]),
	      .block2			(block2[7:0]),
	      .block3			(block3[7:0]),
	      .block4			(block4[7:0]),
	      .block5			(block5[7:0]),
	      .block6			(block6[7:0]),
	      .block7			(block7[7:0]),
	      .block8			(block8[7:0]),
	      .block9			(block9[7:0]),
	      .block10			(block10[7:0]),
	      .block11			(block11[7:0]),
	      .start			(start),
	      .target			(target[15:0]));

test TEST(
    /*AUTOINST*/
	  // Outputs
	  .clk				(clk),
	  .reset			(reset),
	  .block0			(block0[7:0]),
	  .block1			(block1[7:0]),
	  .block2			(block2[7:0]),
	  .block3			(block3[7:0]),
	  .block4			(block4[7:0]),
	  .block5			(block5[7:0]),
	  .block6			(block6[7:0]),
	  .block7			(block7[7:0]),
	  .block8			(block8[7:0]),
	  .block9			(block9[7:0]),
	  .block10			(block10[7:0]),
	  .block11			(block11[7:0]),
	  .start			(start),
	  .target			(target[15:0]),
	  // Inputs
	  .finish			(finish),
	  .nonce0			(nonce0[7:0]),
	  .nonce1			(nonce1[7:0]),
	  .nonce2			(nonce2[7:0]),
	  .nonce3			(nonce3[7:0]));
endmodule
