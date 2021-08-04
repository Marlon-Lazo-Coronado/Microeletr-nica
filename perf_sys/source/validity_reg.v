
`ifndef validity_reg
`define validity_reg

module validity_reg(
    input clk,
    input reset,
    input[2:0] input0,
    input[2:0] input1,

    output reg validity_reg
);

    always @ (posedge clk) begin
        if(reset) begin
            if(input0 == input1) begin
                validity_reg <= 1;
            end else begin
                validity_reg <= 0;
            end
        end else begin
            validity_reg <= 0;
        end
    end

endmodule

`endif