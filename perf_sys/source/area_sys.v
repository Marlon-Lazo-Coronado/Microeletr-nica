

`include "compare.v"
`include "validity_reg.v"
`include "loop_limit.v"
`include "nonce_gen.v"
`include "micro_ucr_hash.v"


`ifndef area_sys
`define area_sys

module area_sys (
    input clk,
    input reset,

    input[7:0] block0,
    input[7:0] block1,
    input[7:0] block2,
    input[7:0] block3,
    input[7:0] block4,
    input[7:0] block5,
    input[7:0] block6,
    input[7:0] block7,
    input[7:0] block8,
    input[7:0] block9,
    input[7:0] block10,
    input[7:0] block11,

    input start,
    input[15:0] target,

    output reg[7:0] nonce0,
    output reg[7:0] nonce1,
    output reg[7:0] nonce2,
    output reg[7:0] nonce3,

    output reg finish
);

    parameter LOOP_LIMIT = 5000;
    //parameter TARGET = 8'h0A;
    reg[15:0] loop_variable;
    reg enable_nonce;

    wire[7:0] nonce_0_0;
    wire[7:0] nonce_0_1;
    wire[7:0] nonce_0_2;
    wire[7:0] nonce_0_3;

    wire[7:0] nonce_final_0;
    wire[7:0] nonce_final_1;
    wire[7:0] nonce_final_2;
    wire[7:0] nonce_final_3;

    reg[7:0] nonce0_first_number;
    reg[7:0] nonce0_second_number;

    wire[7:0] hash_array0_0;
    wire[7:0] hash_array0_1;
    wire[7:0] hash_array0_2;

    wire[2:0] compare_var0_0;
    wire[2:0] compare_var0_1;

    wire validity_reg_0;
    reg validity_reg;

    reg nonce_ready;
    reg ready;

    wire fail;
    wire[15:0] current_loop_actualize;
    reg stop;


    reg[7:0] counter, counter0, counter1;
    reg invalid_nonce;
    integer i,j;
    always @ (posedge clk) begin
        if(reset) begin
            if(start) begin
                counter <= counter + 1;
                if (~(counter == 9 && invalid_nonce))
                	ready <= 1;
                /* nonce generation */
                if(~finish) begin
                    case(1)
                        counter == 9 && invalid_nonce: begin
                        	//================
                        	if(ready)
                        		ready <= 0;
                        	else
                        		ready <= 1;
                        	//=================
                            counter1 <= counter1 + 1;
                            if(counter1 == 8'hFF) begin
                                counter0 <= counter0 + 1;
                            end else begin
                                counter0 <= counter0;
                            end

                            nonce0_first_number <= counter0;
                            nonce0_second_number <= counter1;
                            loop_variable <= current_loop_actualize;
                            counter <= 0;
                        end
                    endcase
                end else begin
                    nonce0_first_number <= nonce0_first_number;
                    nonce0_second_number <= nonce0_second_number;
                end

                /* hash function input generation */
                /* hash function module */
                /* validity module */

                if(validity_reg_0 == 1 && nonce_ready == 0) begin
                    /* valid nonce sets to output */
                    nonce0 <= ~hash_array2_0;
                    nonce1 <= hash_array2_0;
                    nonce2 <= hash_array2_1;
                    nonce3 <= hash_array2_2;
                end else begin
                    nonce0 <= nonce0;
                    nonce1 <= nonce1;
                    nonce2 <= nonce2;
                    nonce3 <= nonce3;
                end

                if((validity_reg_0 == 1))begin
                    finish <= 1;
                    invalid_nonce <= 0;
                    //ready <= 0;
                end else begin
                    finish <= finish;
                    invalid_nonce <= 1;
                    ready <= 1;
                end

                if(finish||fail) begin
                    stop <= 1;
                end else begin 
                    stop <= 0;
                end
            
            end else begin
                // start else
                nonce0 <= 0;
                nonce1 <= 0;
                nonce2 <= 0;
                nonce3 <= 0;
                finish <= 0;
            end
        end else begin
            // reset else
            nonce_ready <= 0;
            validity_reg <= 0;
            loop_variable <= 0;
            counter <= 0;
            counter0 <= 0;
            counter1 <= 0;
            stop <= 0;
            invalid_nonce <= 0;
            ready <= 0;
        end
    end


    /* nonce generation instances */
    

    nonce_gen nonce(
        .clk(clk),
        .reset(reset),
        .source0(nonce2_first_number),
        .source1(nonce2_second_number),
        .type(0),
        .fail(fail),

        .nonce_array0(nonce_2_0),
        .nonce_array1(nonce_2_1),
        .nonce_array2(nonce_2_2),
        .nonce_array3(nonce_2_3)
    );

    /* hash functions instances */
    
    micro_ucr_hash micro(
        .clk(clk),
        .reset(reset),

        .array_numbers0(block0),
        .array_numbers1(block1),
        .array_numbers2(block2),
        .array_numbers3(block3),
        .array_numbers4(block4),
        .array_numbers5(block5),
        .array_numbers6(block6),
        .array_numbers7(block7),
        .array_numbers8(block8),
        .array_numbers9(block9),
        .array_numbers10(block10),
        .array_numbers11(block11),
        .array_numbers12(nonce_2_0),
        .array_numbers13(nonce_2_1),
        .array_numbers14(nonce_2_2),
        .array_numbers15(nonce_2_3),

	.ready(ready),
        .hash_array0(hash_array2_0),
        .hash_array1(hash_array2_1),
        .hash_array2(hash_array2_2)
    );

    /* compare instances */
    /* first hash result */
    /* first hash byte */
    compare compare_hash_0(
        .clk(clk),
        .reset(reset),
        .number0(hash_array2_0),        //warning
        .number1(target),               //warning
        .compare_var(compare_var0_0)
    );

    /* second hash byte */
    compare compare_hash_1(
        .clk(clk),
        .reset(reset),
        .number0(hash_array2_1),        //warning
        .number1(target),               //warning
        .compare_var(compare_var0_1)
    );
    
 
    /* validity instances */
    /* first hash validity */
    validity_reg validity(
        .clk(clk),
        .reset(reset),
        .input0(compare_var0_0),
        .input1(compare_var0_1),
        .validity_reg(validity_reg_0)
    );

    

    /* loop limit module */
    loop_limit #(5000) loop_limit_inst(
        .clk(clk),
        .reset(reset),
        .stop(stop),
        .current_loop(loop_variable),
        .current_loop_actualize(current_loop_actualize),
        .fail(fail)
    );

endmodule
`endif
