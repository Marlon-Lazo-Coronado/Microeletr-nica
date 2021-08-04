`timescale 	1s				/ 100ps
// escala	unidad temporal (valor de "#4") / precisión
// Pueden omitirse y llamarse desde el testbench


`include "micro_ucr_hash.v"
`include "micro_ucr_hash_estruc.v"

`include "probador_hash.v"
`include "cmos_cells.v"



module BancoPrueba_hash; // Testbench

	wire clk;
	wire reset;
	wire ready;
	wire[7:0] array_numbers0;
    wire[7:0] array_numbers1;
    wire[7:0] array_numbers2;
    wire[7:0] array_numbers3;
    wire[7:0] array_numbers4;
    wire[7:0] array_numbers5;
    wire [7:0] array_numbers6;
    wire [7:0] array_numbers7;
    wire [7:0] array_numbers8;
    wire [7:0] array_numbers9;
    wire [7:0] array_numbers10;
    wire [7:0] array_numbers11;
    wire [7:0] array_numbers12;
    wire [7:0] array_numbers13;
    wire [7:0] array_numbers14;
    wire [7:0] array_numbers15;

    wire [7:0] hash_array0;
    wire [7:0] hash_array1;
    wire [7:0] hash_array2;
    
    wire [7:0] hash_array0_estruc;
    wire [7:0] hash_array1_estruc;
    wire [7:0] hash_array2_estruc;

	// Descripción conductual de alarma, las instancias se realizan por medio de AUTOINST.
	micro_ucr_hash micro_ucr_hash_inst( /*AUTOINST*/
					   // Outputs
					   .hash_array0		(hash_array0[7:0]),
					   .hash_array1		(hash_array1[7:0]),
					   .hash_array2		(hash_array2[7:0]),
					   // Inputs
					   .clk			(clk),
					   .reset		(reset),
					   .ready		(ready),
					   .array_numbers0	(array_numbers0[7:0]),
					   .array_numbers1	(array_numbers1[7:0]),
					   .array_numbers2	(array_numbers2[7:0]),
					   .array_numbers3	(array_numbers3[7:0]),
					   .array_numbers4	(array_numbers4[7:0]),
					   .array_numbers5	(array_numbers5[7:0]),
					   .array_numbers6	(array_numbers6[7:0]),
					   .array_numbers7	(array_numbers7[7:0]),
					   .array_numbers8	(array_numbers8[7:0]),
					   .array_numbers9	(array_numbers9[7:0]),
					   .array_numbers10	(array_numbers10[7:0]),
					   .array_numbers11	(array_numbers11[7:0]),
					   .array_numbers12	(array_numbers12[7:0]),
					   .array_numbers13	(array_numbers13[7:0]),
					   .array_numbers14	(array_numbers14[7:0]),
					   .array_numbers15	(array_numbers15[7:0]));
	
	
	
	micro_ucr_hash_estruc micro_ucr_hash_estruc_inst ( /*AUTOINST*/
							  // Outputs
							  .hash_array0_estruc	(hash_array0_estruc[7:0]),
							  .hash_array1_estruc	(hash_array1_estruc[7:0]),
							  .hash_array2_estruc	(hash_array2_estruc[7:0]),
							  // Inputs
							  .array_numbers0	(array_numbers0[7:0]),
							  .array_numbers1	(array_numbers1[7:0]),
							  .array_numbers10	(array_numbers10[7:0]),
							  .array_numbers11	(array_numbers11[7:0]),
							  .array_numbers12	(array_numbers12[7:0]),
							  .array_numbers13	(array_numbers13[7:0]),
							  .array_numbers14	(array_numbers14[7:0]),
							  .array_numbers15	(array_numbers15[7:0]),
							  .array_numbers2	(array_numbers2[7:0]),
							  .array_numbers3	(array_numbers3[7:0]),
							  .array_numbers4	(array_numbers4[7:0]),
							  .array_numbers5	(array_numbers5[7:0]),
							  .array_numbers6	(array_numbers6[7:0]),
							  .array_numbers7	(array_numbers7[7:0]),
							  .array_numbers8	(array_numbers8[7:0]),
							  .array_numbers9	(array_numbers9[7:0]),
							  .clk			(clk),
							  .ready		(ready),
							  .reset		(reset));
						
	// Probador: generador de señales y monitor
	probador_hash probador_hash_Inst( /*AUTOINST*/
					 // Outputs
					 .clk			(clk),
					 .reset			(reset),
					 .ready			(ready),
					 .array_numbers0	(array_numbers0[7:0]),
					 .array_numbers1	(array_numbers1[7:0]),
					 .array_numbers2	(array_numbers2[7:0]),
					 .array_numbers3	(array_numbers3[7:0]),
					 .array_numbers4	(array_numbers4[7:0]),
					 .array_numbers5	(array_numbers5[7:0]),
					 .array_numbers6	(array_numbers6[7:0]),
					 .array_numbers7	(array_numbers7[7:0]),
					 .array_numbers8	(array_numbers8[7:0]),
					 .array_numbers9	(array_numbers9[7:0]),
					 .array_numbers10	(array_numbers10[7:0]),
					 .array_numbers11	(array_numbers11[7:0]),
					 .array_numbers12	(array_numbers12[7:0]),
					 .array_numbers13	(array_numbers13[7:0]),
					 .array_numbers14	(array_numbers14[7:0]),
					 .array_numbers15	(array_numbers15[7:0]),
					 // Inputs
					 .hash_array0		(hash_array0[7:0]),
					 .hash_array1		(hash_array1[7:0]),
					 .hash_array2		(hash_array2[7:0]),
					 .hash_array0_estruc	(hash_array0_estruc[7:0]),
					 .hash_array1_estruc	(hash_array1_estruc[7:0]),
					 .hash_array2_estruc	(hash_array2_estruc[7:0]));
endmodule
