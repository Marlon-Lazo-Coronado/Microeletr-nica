`include "compare.v"

`ifndef loop_limit
`define loop_limit

module loop_limit #(parameter LOOP_LIMIT = 5000)(
    input clk,
    input reset,
    input stop,
    input[15:0] current_loop,

    output reg[15:0] current_loop_actualize,
    output reg fail
);

    reg[15:0] loop_limit;
    wire[2:0] loop_status;

    always @ (posedge clk) begin
        if(reset) begin
            if(~stop) begin
                loop_limit <= LOOP_LIMIT;
                /* fail bus assignment */
                if(loop_status == 3'b100) begin   //0x04
                    fail <= 1;
                end else begin
                    fail <= 0;
                end

                /* loop under limit */
                if(loop_status == 3'b001 || loop_status == 3'b010) begin
                    current_loop_actualize <= current_loop + 1;
                end else begin
                    current_loop_actualize <= 0;
                end
            end else begin
                current_loop_actualize <= 0;
            end
        end else begin
            fail <= 0;
            current_loop_actualize <= 0;
        end
    end

    /* compare module instance */
    compare compare_inst(
        .clk(clk),
        .reset(reset),
        .number0(current_loop),
        .number1(loop_limit),
        .compare_var(loop_status)
    );

endmodule

`endif