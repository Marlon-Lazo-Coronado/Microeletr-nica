
`ifndef nonce_gen
`define nonce_gen

module nonce_gen(
    input clk,
    input reset,
    input fail,

    input[7:0] source0,
    input[7:0] source1,
    input[1:0] type,

    output reg[7:0] nonce_array0,
    output reg[7:0] nonce_array1,
    output reg[7:0] nonce_array2,
    output reg[7:0] nonce_array3
);

    reg delay;
    reg[7:0] nonce_int_0, nonce_int_1, nonce_int_2, nonce_int_3;

    /* nonce results are only ready after two clocks */
    always @ (posedge clk) begin
        if(reset) begin
            if(~fail) begin
                case(1) 
                    type == 2'b00: begin
                        if(delay == 1)begin
                            nonce_array0 <= nonce_int_0;
                            nonce_array1 <= nonce_int_1;
                            nonce_array2 <= nonce_int_0 + source1; 
                            nonce_array3 <= nonce_int_1 + source1;
                            delay <= 0;
                        end else begin
                            nonce_int_0 <= source0;
                            nonce_int_1 <= source0;
                            delay <= 1;
                        end                     
                    end
                    type == 2'b01: begin
                        if(delay == 1)begin
                            nonce_array0 <= nonce_int_0;
                            nonce_array1 <= nonce_int_0 + source1;
                            nonce_array2 <= nonce_int_2; 
                            nonce_array3 <= nonce_int_2 + source1;
                            delay <= 0;
                        end else begin
                            nonce_int_0 <= source0;
                            nonce_int_2 <= source0;
                            delay <= 1;
                        end               
                    end
                    type == 2'b10: begin
                        if(delay == 1)begin
                            nonce_array0 <= nonce_int_1 + source1;
                            nonce_array1 <= nonce_int_1;
                            nonce_array2 <= nonce_int_3 + source1; 
                            nonce_array3 <= nonce_int_3;
                            delay <= 0;
                        end else begin
                            nonce_int_1 <= source0;
                            nonce_int_3 <= source0;
                            delay <= 1;
                        end                      
                    end
                endcase
            end else begin
                nonce_array0 <= 0;
                nonce_array1 <= 0;
                nonce_array2 <= 0;
                nonce_array3 <= 0;
            end
        end else begin
            nonce_array0 <= 0;
            nonce_array1 <= 0;
            nonce_array2 <= 0;
            nonce_array3 <= 0;
        end
    end
endmodule
 
`endif