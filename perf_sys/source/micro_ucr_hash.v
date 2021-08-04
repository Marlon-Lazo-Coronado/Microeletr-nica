`include "Library.v"
`ifndef micro_ucr_hash
`define micro_ucr_hash

// Modulo de la funciòn hash

module micro_ucr_hash(
    input clk,
    input reset,
    input ready,

    input[7:0] array_numbers0,
    input[7:0] array_numbers1,
    input[7:0] array_numbers2,
    input[7:0] array_numbers3,
    input[7:0] array_numbers4,
    input[7:0] array_numbers5,
    input[7:0] array_numbers6,
    input[7:0] array_numbers7,
    input[7:0] array_numbers8,
    input[7:0] array_numbers9,
    input[7:0] array_numbers10,
    input[7:0] array_numbers11,
    input[7:0] array_numbers12,
    input[7:0] array_numbers13,
    input[7:0] array_numbers14,
    input[7:0] array_numbers15,

    output [7:0] hash_array0,
    output [7:0] hash_array1,
    output [7:0] hash_array2
);


wire [127:0]bus_w2;
wire [127:0]bus_w2_log;
wire [23:0]bus_abc;
wire [23:0]bus_abc_log;
wire [23:0]bus_abc_log2;
wire [4:0]counter;
wire [7:0]x;
wire [7:0]k;

//Modulo hash final
hash_final hash_final_ints(
	.clk(clk),
	.reset(reset),
   .counter(counter),
   .out_logic_final(bus_abc),
   .out_hash0(hash_array0),
   .out_hash1(hash_array1),
   .out_hash2(hash_array2)
);

//Mòdulo del calculo de x y k
mod_x_k mod_x_k_inst(
    .clk(clk),
    .reset(reset),
    .counter(counter),
    .imput_abc_logic(bus_abc_log),

    .x(x),
    .k(k)
);

//Modulo de el calculo de a, b y c
abc_calculation abc_calculation_ints(
    .clk(clk),
    .reset(reset),
    .counter(counter),
    .imput_abc_logic(bus_abc_log),
    .x(x),
    .k(k),
    .array_numbers0(array_numbers0),
    .array_numbers1(array_numbers1),
    .array_numbers2(array_numbers2),
    .array_numbers3(array_numbers3),
    .array_numbers4(array_numbers4),
    .array_numbers5(array_numbers5),
    .array_numbers6(array_numbers6),
    .array_numbers7(array_numbers7),
    .array_numbers8(array_numbers8),
    .array_numbers9(array_numbers9),
    .array_numbers10(array_numbers10),
    .array_numbers11(array_numbers11),
    .array_numbers12(array_numbers12),
    .array_numbers13(array_numbers13),
    .array_numbers14(array_numbers14),
    .array_numbers15(array_numbers15),
    .imput_W2_logic(bus_w2_log),

    .out_logic_final(bus_abc)
);

//Modulo del mux que le da valor inicial al bloque que calcula a, b y c.
mux mux_ints(
    .clk(clk),
    .ready(ready),
    .out_hash0(hash_array0),
   .out_hash1(hash_array1),
   .out_hash2(hash_array2),
  
    .out_abc_mem(bus_abc_log)
    
);

//Modulo que calculo los ultimos 16 W[i]
w_flops w_flops_ints(
	.clk(clk),
	.reset(reset),
	.counter(counter),
    .array_numbers0(array_numbers0),
    .array_numbers1(array_numbers1),
    .array_numbers2(array_numbers2),
    .array_numbers3(array_numbers3),
    .array_numbers4(array_numbers4),
    .array_numbers5(array_numbers5),
    .array_numbers6(array_numbers6),
    .array_numbers7(array_numbers7),
    .array_numbers8(array_numbers8),
    .array_numbers9(array_numbers9),
    .array_numbers10(array_numbers10),
    .array_numbers11(array_numbers11),
    .array_numbers12(array_numbers12),
    .array_numbers13(array_numbers13),
    .array_numbers14(array_numbers14),
    .array_numbers15(array_numbers15),
   
    .out_W2(bus_w2_log)
);

//Contador que va del 0 al 31
couter counter_inst(
    .clk(clk),
    .reset(reset),
    .ready(ready),
    .out_cont(counter)
);

endmodule

`endif


