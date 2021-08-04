
`ifndef compare
`define compare
module compare (
    input clk,
    input reset,
    input[15:0] number0,
    input[15:0] number1,

    output reg[2:0] compare_var
);

    always @ (posedge clk) begin 
        if(reset) begin
            if(number0 < number1) begin
                compare_var <= 3'b001;            //001
            end else if (number0 == number1) begin
                compare_var <= 3'b010;            //010
            end else begin
                compare_var <= 3'b100;            //100
            end
        end
    end

endmodule
`endif