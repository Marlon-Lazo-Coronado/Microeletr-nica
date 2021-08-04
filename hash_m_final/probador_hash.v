module probador_hash(
	output reg clk,
    	output reg reset,
    	output reg ready,

   	output reg [7:0] array_numbers0,
   	output reg [7:0] array_numbers1,
   	output reg [7:0] array_numbers2,
   	output reg [7:0] array_numbers3,
   	output reg [7:0] array_numbers4,
   	output reg [7:0] array_numbers5,
   	output reg [7:0] array_numbers6,
   	output reg [7:0] array_numbers7,
   	output reg [7:0] array_numbers8,
   	output reg [7:0] array_numbers9,
   	output reg [7:0] array_numbers10,
   	output reg [7:0] array_numbers11,
   	output reg [7:0] array_numbers12,
   	output reg [7:0] array_numbers13,
   	output reg [7:0] array_numbers14,
   	output reg [7:0] array_numbers15,

	
	//Estructural
	input [7:0] hash_array0,
    	input [7:0] hash_array1,
   	input [7:0] hash_array2,
   	
   	input [7:0] hash_array0_estruc,
    	input [7:0] hash_array1_estruc,
   	input [7:0] hash_array2_estruc
	);
	
	initial begin
		$dumpfile("hash.vcd");
		$dumpvars;
		$display ("\t\t\tclk,\treset, \thash_array0,\thash_array1.\thash_array2");
		$monitor($time,"\t%b\t%b\t\t%b\t%b\t%b", clk,reset,hash_array0,hash_array1,hash_array2);
		
		// Valores iniciales de las señales.
		repeat (5) begin
		@(posedge clk);
		
		array_numbers0 <= 0;
   		array_numbers1 <= 0;
   		array_numbers2 <= 0;
   		array_numbers3 <= 0;
   		array_numbers4 <= 0;
   		array_numbers5 <= 0;
   		array_numbers6 <= 0;
   		array_numbers7 <= 0;
   		array_numbers8 <= 0;
   		array_numbers9 <= 0;
   		array_numbers10 <= 0;
   		array_numbers11 <= 0;
   		array_numbers12 <= 0;
   		array_numbers13 <= 0;
   		array_numbers14 <= 0;
   		array_numbers15 <= 0;        
   		
   		reset <= 0;
    		ready <= 0;
		end
		
		repeat (32) begin
		@(posedge clk);
		array_numbers0 <= 1;
   		array_numbers1 <= 1;
   		array_numbers2 <= 1;
   		array_numbers3 <= 1;
   		array_numbers4 <= 1;
   		array_numbers5 <= 1;
   		array_numbers6 <= 1;
   		array_numbers7 <= 1;
   		array_numbers8 <= 1;
   		array_numbers9 <= 1;
   		array_numbers10 <= 1;
   		array_numbers11 <= 0;
   		array_numbers12 <= 1;
   		array_numbers13 <= 0;
   		array_numbers14 <= 1;
   		array_numbers15 <= 0; 
   		
   		reset <= 1;
    		ready <= 1;
		end
		
		repeat (8) begin
		@(posedge clk);
			ready <= 1;
		end
		
		ready <= 0;
		
		repeat (32) begin
		@(posedge clk);
		array_numbers0 <= 1;
   		array_numbers1 <= 1;
   		array_numbers2 <= 1;
   		array_numbers3 <= 0;
   		array_numbers4 <= 1;
   		array_numbers5 <= 0;
   		array_numbers6 <= 1;
   		array_numbers7 <= 0;
   		array_numbers8 <= 1;
   		array_numbers9 <= 0;
   		array_numbers10 <= 1;
   		array_numbers11 <= 1;
   		array_numbers12 <= 1;
   		array_numbers13 <= 1;
   		array_numbers14 <= 1;
   		array_numbers15 <= 0; 
   		
   		reset <= 1;
    		ready <= 1;
		end
		
		repeat (8) begin
		@(posedge clk);
			ready <= 1;
		end
		ready <= 0;
		
		repeat (32) begin
		@(posedge clk);
		array_numbers0 <= 1;
   		array_numbers1 <= 1;
   		array_numbers2 <= 0;
   		array_numbers3 <= 1;
   		array_numbers4 <= 1;
   		array_numbers5 <= 1;
   		array_numbers6 <= 1;
   		array_numbers7 <= 1;
   		array_numbers8 <= 1;
   		array_numbers9 <= 1;
   		array_numbers10 <= 1;
   		array_numbers11 <= 0;
   		array_numbers12 <= 1;
   		array_numbers13 <= 1;
   		array_numbers14 <= 1;
   		array_numbers15 <= 1; 
   		
   		reset <= 1;
    		ready <= 1;
		end
		
		repeat (24) begin
		@(posedge clk);
			ready <= 1;
		end
		
		ready <= 0;
		
		repeat (32) begin
		@(posedge clk);
		array_numbers0 <= 0;
   		array_numbers1 <= 1;
   		array_numbers2 <= 0;
   		array_numbers3 <= 1;
   		array_numbers4 <= 1;
   		array_numbers5 <= 1;
   		array_numbers6 <= 1;
   		array_numbers7 <= 0;
   		array_numbers8 <= 0;
   		array_numbers9 <= 0;
   		array_numbers10 <= 1;
   		array_numbers11 <= 0;
   		array_numbers12 <= 1;
   		array_numbers13 <= 1;
   		array_numbers14 <= 1;
   		array_numbers15 <= 1; 
   		
   		reset <= 1;
    		ready <= 1;
		end
		
		repeat (24) begin
		@(posedge clk);
			ready <= 1;
		end
		
		ready <= 0;
		
		repeat (32) begin
		@(posedge clk);
		array_numbers0 <= 1;
   		array_numbers1 <= 0;
   		array_numbers2 <= 0;
   		array_numbers3 <= 0;
   		array_numbers4 <= 1;
   		array_numbers5 <= 0;
   		array_numbers6 <= 0;
   		array_numbers7 <= 0;
   		array_numbers8 <= 1;
   		array_numbers9 <= 1;
   		array_numbers10 <= 1;
   		array_numbers11 <= 1;
   		array_numbers12 <= 1;
   		array_numbers13 <= 1;
   		array_numbers14 <= 1;
   		array_numbers15 <= 1; 
   		
   		reset <= 1;
    		ready <= 1;
		end
		
		repeat (8) begin
		@(posedge clk);
			ready <= 1;
		end
		
		ready <= 0;
		
		array_numbers0 <= 1;
   		array_numbers1 <= 1;
   		array_numbers2 <= 1;
   		array_numbers3 <= 1;
   		array_numbers4 <= 0;
   		array_numbers5 <= 0;
   		array_numbers6 <= 0;
   		array_numbers7 <= 1;
   		array_numbers8 <= 0;
   		array_numbers9 <= 1;
   		array_numbers10 <= 0;
   		array_numbers11 <= 0;
   		array_numbers12 <= 1;
   		array_numbers13 <= 1;
   		array_numbers14 <= 0;
   		array_numbers15 <= 0;        
   		
   		reset <= 0;
    		ready <= 0; 
		$finish;
		
	end
	// Reloj
	initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre será indeterminado
	always	#1 clk 	<= ~clk;		// Hace "toggle" cada 4 segundos
endmodule
