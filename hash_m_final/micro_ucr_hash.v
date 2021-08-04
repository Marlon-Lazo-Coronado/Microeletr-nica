//`include "Library.v"
`ifndef micro_ucr_hash
`define micro_ucr_hash

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



hash_final hash_final_ints(
	.clk(clk),
	.reset(reset),
   .counter(counter),
   .out_logic_final(bus_abc),
   .out_hash0(hash_array0),
   .out_hash1(hash_array1),
   .out_hash2(hash_array2)
);

mod_x_k mod_x_k_inst(
    .clk(clk),
    .reset(reset),
    .counter(counter),
    .imput_abc_logic(bus_abc_log),

    .x(x),
    .k(k)
);

abc_calculation abc_calculation_ints(
    .clk(clk),
    .reset(reset),
    .counter(counter),
    .imput_abc_logic(bus_abc_log), //.imput_abc_logic(bus_abc_log2),
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
    /*.out_hash0(hash_array0),
   .out_hash1(hash_array1),
   .out_hash2(hash_array2)*/
    .out_logic_final(bus_abc)
);

/*
mem_abc mem_abc_ints(
   .clk(clk),
   .imput_abc_mem(bus_abc_log),    
   .out_abc_mem(bus_abc_log2)
);*/

mux mux_ints(
    .clk(clk),
    .ready(ready),
    .out_hash0(hash_array0),
   .out_hash1(hash_array1),
   .out_hash2(hash_array2),
    //.imput_abc(bus_abc),
    .out_abc_mem(bus_abc_log)
    //.out_abc(bus_abc_log)
);

/*vec_w2 vec_w2_mem_ints(
    .clk(clk),
    .reset(reset),
    .ready(ready),
    .array_w2(bus_w2_log),
    .out_vec_w2(bus_w2)
);*/

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
    //.out_mem_w2(bus_w2),
    .out_W2(bus_w2_log)
);

couter counter_inst(
    .clk(clk),
    .reset(reset),
    .ready(ready),
    .out_cont(counter)
);

endmodule

`endif


//=========================================================CONTADOR=====================================================================

// out_logic_final[0]

`ifndef couter
`define couter
module couter (
    input clk,
    input reset,
    input ready,

    output reg[4:0] out_cont
);

always @ (posedge clk) begin
    if (reset == 1) begin
    	if (ready == 1) begin
    		if (out_cont < 31) begin
    			out_cont <= out_cont + 1;
    		end
    		else begin
    			if (out_cont >= 31) begin
    				out_cont <= out_cont;
    			end
    		end
    	end
    	else begin
    		out_cont <= 0;
    	end
    end
    else begin
    	out_cont <= 0;
    end
end
endmodule
`endif

//========================================================VECTOR W2====================================================================

`ifndef w_flops
`define w_flops
module w_flops(

input reset,
input [4:0]counter,
input clk,

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
     
    //input[127:0] out_mem_w2,

    output reg[127:0] out_W2
);

reg [127:0]out_mem_w2;

always @ (posedge clk) begin // *!
    if (reset == 1) begin
    	//out_mem_w2 <= out_W2;
    	if(counter <= 15) begin
    	if (counter == 0) out_W2[7:0] <= (array_numbers13 | array_numbers7) ^ array_numbers2;else  out_W2[7:0]<=out_W2[7:0];//16
    	if (counter == 1) out_W2[15:8] <= (array_numbers14 | array_numbers8) ^ array_numbers3;else  out_W2[15:8]<=out_W2[15:8];//17
    	if (counter == 2) out_W2[23:16] <= (array_numbers15 | array_numbers9) ^ array_numbers4;else out_W2[23:16]<=out_W2[23:16];//18
   	if (counter == 3) out_W2[31:24] <= (out_mem_w2[7:0] | array_numbers10) ^ array_numbers5;else out_W2[31:24]<=out_W2[31:24];//19
   	if (counter == 4) out_W2[39:32] <= (out_mem_w2[15:8] | array_numbers11) ^ array_numbers6;else out_W2[39:32]<=out_W2[39:32];//20
    	if (counter == 5) out_W2[47:40] <= (out_mem_w2[23:16] | array_numbers12) ^ array_numbers7;else out_W2[47:40]<=out_W2[47:40];//21
    	if (counter == 6) out_W2[55:48] <= (out_mem_w2[31:24] | array_numbers13) ^ array_numbers8;else out_W2[55:48]<=out_W2[55:48];//22
    	if (counter == 7) out_W2[63:56] <= (out_mem_w2[39:32] | array_numbers14) ^ array_numbers9;else out_W2[63:56]<=out_W2[63:56];//23
    	if (counter == 8) out_W2[71:64] <= (out_mem_w2[47:40] | array_numbers15) ^ array_numbers10;else out_W2[71:64]<=out_W2[71:64];//24
    	if (counter == 9) out_W2[79:72] <= (out_mem_w2[55:48] | out_mem_w2[7:0]) ^ array_numbers11;else out_W2[79:72]<=out_W2[79:72];//25
    	if (counter == 10) out_W2[87:80]<=(out_mem_w2[63:56] | out_mem_w2[15:8]) ^ array_numbers12;else out_W2[87:80]<=out_W2[87:80];//26
    	if (counter == 11) out_W2[95:88]<=(out_mem_w2[71:64] | out_mem_w2[23:16]) ^ array_numbers13;else out_W2[95:88]<=out_W2[95:88];
    	if (counter == 12) out_W2[103:96]<=(out_mem_w2[89:72] | out_mem_w2[31:24]) ^ array_numbers13;else out_W2[103:96]<=out_W2[103:96];
    if (counter == 13) out_W2[111:104]<=(out_mem_w2[97:90] | out_mem_w2[39:32]) ^ array_numbers14;else out_W2[111:104]<=out_W2[111:104];
    if (counter == 14) out_W2[119:112]<=(out_mem_w2[105:98] | out_mem_w2[47:40]) ^ array_numbers15;else out_W2[119:112]<=out_W2[119:112];
   if (counter == 15) out_W2[127:120]<=(out_mem_w2[113:106] | out_mem_w2[55:48]) ^ out_mem_w2[7:0];else out_W2[127:120]<=out_W2[127:120];
    	end
    	end
    	//else
    		//out_W2 = 0; 
    	/*out_mem_w2 <= out_W2;
    	out_W2[7:0] <= (array_numbers13 | array_numbers7) ^ array_numbers2;
    	out_W2[15:8] <= (array_numbers14 | array_numbers8) ^ array_numbers3;
    	out_W2[23:16] <= (array_numbers15 | array_numbers9) ^ array_numbers4;
   	out_W2[31:24] <= (out_mem_w2[7:0] | array_numbers10) ^ array_numbers5;
   	out_W2[39:32] <= (out_mem_w2[15:8] | array_numbers11) ^ array_numbers6;
    	out_W2[47:40] <= (out_mem_w2[23:16] | array_numbers12) ^ array_numbers7;
    	out_W2[55:48] <= (out_mem_w2[31:24] | array_numbers13) ^ array_numbers8;
    	out_W2[63:56] <= (out_mem_w2[39:32] | array_numbers14) ^ array_numbers9;
    	out_W2[71:64] <= (out_mem_w2[47:40] | array_numbers15) ^ array_numbers10;
    	out_W2[79:72] <= (out_mem_w2[55:48] | out_mem_w2[7:0]) ^ array_numbers11;
    	out_W2[87:80]<=(out_mem_w2[63:56] | out_mem_w2[15:8]) ^ array_numbers12;
    	out_W2[95:88]<=(out_mem_w2[71:64] | out_mem_w2[23:16]) ^ array_numbers13;
    	out_W2[103:96]<=(out_mem_w2[89:72] | out_mem_w2[31:24]) ^ array_numbers13;
    out_W2[111:104]<=(out_mem_w2[97:90] | out_mem_w2[39:32]) ^ array_numbers14;
    out_W2[119:112]<=(out_mem_w2[105:98] | out_mem_w2[47:40]) ^ array_numbers15;
  out_W2[127:120]<=(out_mem_w2[113:106] | out_mem_w2[55:48]) ^ out_mem_w2[7:0];
    end*/
    else begin
    	out_W2 <= 0;
    	out_mem_w2 <= 0;
    end
end
endmodule
`endif

//======================================================MEMORIA========================================================================
/*`ifndef vec_w2
`define vec_w2

module vec_w2 (
    input clk,
    input reset,
    input ready,

    input[127:0] array_w2,
    
    output reg[127:0] out_vec_w2
);

    
always @ (posedge clk) begin
    if (reset == 1) begin
    	if (ready == 1) begin
    		out_vec_w2 <= array_w2;
    	end
    	else
    		out_vec_w2 <= 0;
    		
    end
    else 
    	out_vec_w2 <= 0;
end
endmodule
 
`endif*/

//======================================================MUX========================================================================
`ifndef mux
`define mux

module mux (
    input clk,
    input ready,

    //input[23:0] imput_abc,
    input[7:0] out_hash0,
    input[7:0] out_hash1,
    input[7:0] out_hash2,
    
    output reg[23:0] out_abc_mem
);

reg [23:0]abc;
    
parameter H0 = 8'b00000001;
parameter H1 = 8'b10001001;
parameter H2 = 8'b11111110;
/*
always @ (*) begin
    if (ready == 1) begin
  	out_abc_mem = imput_abc;
    end
    else begin
    	out_abc_mem[7:0] = H0;
    	out_abc_mem[15:8] = H1;
    	out_abc_mem[23:16] = H2;
    end
end*/


always @ (*) begin
    if (ready == 0) begin
  	abc = 0;
    end
    else begin
    	abc[7:0] = out_hash0;
    	abc[15:8] = out_hash1;
    	abc[23:16] =out_hash2;
    end
end

always @ (posedge clk) begin
  if (ready == 1) begin
  	out_abc_mem <= abc;
    end
    else begin
    	out_abc_mem[7:0] <= H0;
    	out_abc_mem[15:8] <= H1;
    	out_abc_mem[23:16] <= H2;
    end
end

endmodule
 
`endif


//======================================================MEM_ABC========================================================================
/*`ifndef mem_abc
`define mem_abc

module mem_abc (
    input clk,

    input[23:0] imput_abc_mem,
    
    output reg[23:0] out_abc_mem
);

always @ (posedge clk) begin
  	out_abc_mem <= imput_abc_mem;
end
endmodule
 
`endif*/
//=========================================================MODULO_X_K===================================================================

// out_logic_final[0]

`ifndef mod_x_k
`define mod_x_k
module mod_x_k (
    input clk,
    input reset,
    input [4:0]counter,
    input [23:0]imput_abc_logic,

    output reg[7:0] x,
    output reg[7:0] k
);

reg [7:0]a;
reg [7:0]b;

parameter k1 = 8'b10011001;
parameter k2 = 8'b10100001;

always @ (posedge clk) begin
    if (reset == 1) begin
    	
    	a <= imput_abc_logic[7:0];
	b <= imput_abc_logic[15:8];
	
	if (counter <=16) begin
		x <= (a ^ b);
		k <= k1;
   	end
   	else begin
		if ( counter > 16) begin
			x <= (a | b);
			k <= k2;
		end
	end
	end
   else begin
    	a <= 0;
	b <= 0;
	x <= 0;
	k <= 0;
    		
    end
    	
end
endmodule
`endif


//======================================================LOGICA_ABC======================================================================
`ifndef abc_calculation
`define abc_calculation

module abc_calculation (
    input clk,
    input reset,
    input [4:0]counter,

    input[23:0] imput_abc_logic,
    input[7:0] x,
    input[7:0] k,
   
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
   
    input[127:0] imput_W2_logic,
    
    
    output reg[23:0] out_logic_final
    /*output reg[7:0] out_hash0,
    output reg[7:0] out_hash1,
    output reg[7:0] out_hash2*/
);

reg [7:0]a;
reg [15:8]b;
reg [23:16]c;

//reg [23:0] out_logic_final;//********
reg flag;

//parameter k1 = 8'b10011001;
//parameter k2 = 8'b10100001;

parameter H0 = 8'b00000001;
parameter H1 = 8'b10001001;
parameter H2 = 8'b11111110;

always @ (*) begin

	a = imput_abc_logic[7:0];
	b = imput_abc_logic[15:8];
	c = imput_abc_logic[23:16];
end


always @ (posedge clk) begin

if (reset == 0) begin

//out_hash0 <= 0;
//out_hash1 <= 0;
//out_hash2 <= 0;
out_logic_final <= 0;
//flag <= 1;
end
else
	if (counter <= 15) begin 
  		out_logic_final[7:0] <= b ^ c;
  		out_logic_final[15:8] <= c << 4;
  		
  		if (counter == 0) out_logic_final[23:16] <= x + k + array_numbers0; //x = a ^ b;
  		if (counter == 1) out_logic_final[23:16] <= x + k + array_numbers1;
  		if (counter == 2) out_logic_final[23:16] <= x + k + array_numbers2;
  		if (counter == 3) out_logic_final[23:16] <= x + k + array_numbers3;
  		if (counter == 4) out_logic_final[23:16] <= x + k + array_numbers4;
  		if (counter == 5) out_logic_final[23:16] <= x + k + array_numbers5;
  		if (counter == 6) out_logic_final[23:16] <= x + k + array_numbers6;
  		if (counter == 7) out_logic_final[23:16] <= x + k + array_numbers7;
  		if (counter == 8) out_logic_final[23:16] <= x + k + array_numbers8;
  		if (counter == 9) out_logic_final[23:16] <= x + k + array_numbers9;
  		if (counter == 10) out_logic_final[23:16] <= x + k + array_numbers10;
  		if (counter == 11) out_logic_final[23:16] <= x + k + array_numbers11;
  		if (counter == 12) out_logic_final[23:16] <= x + k + array_numbers12;
  		if (counter == 13) out_logic_final[23:16] <= x + k + array_numbers13;
  		if (counter == 14) out_logic_final[23:16] <= x + k + array_numbers14;
  		if (counter == 15) out_logic_final[23:16] <= x + k + array_numbers15;	
  	end
  	else begin
  	
  		if (counter == 16) begin
  			out_logic_final[7:0] = b ^ c;
  			out_logic_final[15:8] = c << 4;
  			out_logic_final[23:16] = x + k + imput_W2_logic[7:0]; //x = a ^ b;
  			
  		end
  		else begin 
  			if ((counter >= 17) && (counter <= 31)) begin
  				out_logic_final[7:0] <= b ^ c;
  				out_logic_final[15:8] <= c << 4;
  			if (counter == 17) out_logic_final[23:16] <= x + k + imput_W2_logic[15:8];
  			if (counter == 18) out_logic_final[23:16] <= x + k + imput_W2_logic[23:16];
  			if (counter == 19) out_logic_final[23:16] <= x + k + imput_W2_logic[31:24];
  			if (counter == 20) out_logic_final[23:16] <= x + k + imput_W2_logic[39:32];
  			if (counter == 21) out_logic_final[23:16] <= x + k + imput_W2_logic[47:40];
  			if (counter == 22) out_logic_final[23:16] <= x + k + imput_W2_logic[55:48];
  			if (counter == 23) out_logic_final[23:16] <= x + k + imput_W2_logic[63:56];
  			if (counter == 24) out_logic_final[23:16] <= x + k + imput_W2_logic[71:64];
  			if (counter == 25) out_logic_final[23:16] <= x + k + imput_W2_logic[79:72];
  			if (counter == 26) out_logic_final[23:16] <= x + k + imput_W2_logic[87:80];
  			if (counter == 27) out_logic_final[23:16] <= x + k + imput_W2_logic[95:88];
  			if (counter == 28) out_logic_final[23:16] <= x + k + imput_W2_logic[103:96];
  			if (counter == 29) out_logic_final[23:16] <= x + k + imput_W2_logic[111:104];
  			if (counter == 30) out_logic_final[23:16] <= x + k + imput_W2_logic[119:112];
  			if (counter == 31) out_logic_final[23:16] <= x + k + imput_W2_logic[127:120];
  			end
  			/*else begin
  				out_logic_final[7:0] <= out_logic_final[7:0];
  				out_logic_final[15:8] <= out_logic_final[15:8];
  				out_logic_final[23:16] <= out_logic_final[23:16] ;
  			end*/
  		end
  	end
  	
  	
  		/*if (counter == 31 && flag) begin
  			out_hash0 <= out_logic_final[7:0]+H0;
  			out_hash1 <= out_logic_final[15:8]+H1;
  			out_hash2 <= out_logic_final[23:16]+H2;
  			flag <= 0;
  		end
  		else begin
  			if (counter < 31) begin
  				flag <= 1;
  				out_hash0 <= out_logic_final[7:0];
  				out_hash1 <= out_logic_final[15:8];
 				out_hash2 <= out_logic_final[23:16];
 			end	
  		end*/
  	
  	
  		
  	
end
endmodule
 
`endif



//======================================================Suma_final=====================================================================
`ifndef hash_final
`define hash_final

module hash_final (
	
	input clk,
	input reset,
    input [4:0] counter,
    input [23:0] out_logic_final,
    
    output reg[7:0] out_hash0,
    output reg[7:0] out_hash1,
    output reg[7:0] out_hash2
);

parameter H0 = 8'b00000001;
parameter H1 = 8'b10001001;
parameter H2 = 8'b11111110;

reg flag;

always @ (posedge clk) begin

	if (reset == 0) begin
		out_hash0 <= 0;
  		out_hash1 <= 0;
  		out_hash2 <= 0;
  		flag <= 1;
	end
	else begin
		/*if (counter == 31 & flag) begin
  			out_hash0 <= out_logic_final[7:0]+H0;
  			out_hash1 <= out_logic_final[15:8]+H1;
  			out_hash2 <= out_logic_final[23:16]+H2;
  			flag <= 0;
  		end
  		else begin
  			if (counter < 31 ) begin
  				flag <= 1;
  				out_hash0 <= 0;
  				out_hash1 <= 0;
 				out_hash2 <= 0;
 			end
 			else begin
 				flag <= 0;
  				out_hash0 <= out_hash0;
  				out_hash1 <= out_hash1;
 				out_hash2 <= out_hash2;
 			end	
  		end
  	end*/
  	if (counter == 31 && flag) begin
  			out_hash0 <= out_logic_final[7:0]+H0;
  			out_hash1 <= out_logic_final[15:8]+H1;
  			out_hash2 <= out_logic_final[23:16]+H2;
  			flag <= 0;
  		end
  		else begin
  			if (counter < 31) begin
  				flag <= 1;
  				out_hash0 <= out_logic_final[7:0];
  				out_hash1 <= out_logic_final[15:8];
 				out_hash2 <= out_logic_final[23:16];
 			end	
  		end
  	end
end
endmodule
 
`endif














