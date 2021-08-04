objetivo1: dependencia1 dependencia2
	gtkwave hash.vcd
	
dependencia1:

	yosys -s script_yosis_hash.ys
	
	sed -i 's/micro_ucr_hash/micro_ucr_hash_estruc/g' micro_ucr_hash_estruc.v
	sed -i 's/hash_array0/hash_array0_estruc/g' micro_ucr_hash_estruc.v
	sed -i 's/hash_array1/hash_array1_estruc/g' micro_ucr_hash_estruc.v
	sed -i 's/hash_array2/hash_array2_estruc/g' micro_ucr_hash_estruc.v
	sed -i 's/mod_x_k/mod_x_k_estruc/g' micro_ucr_hash_estruc.v
	
	sed -i 's/hash_final/hash_final_estruc/g' micro_ucr_hash_estruc.v
	sed -i 's/couter/couter_estruc/g' micro_ucr_hash_estruc.v
	sed -i 's/abc_calculation/abc_calculation_estruc/g' micro_ucr_hash_estruc.v
	sed -i 's/mux/mux_estruc/g' micro_ucr_hash_estruc.v
	sed -i 's/w_flops/w_flops_estruc/g' micro_ucr_hash_estruc.v
	sed -i 's/vec_w2/vec_w2_estruc/g' micro_ucr_hash_estruc.v
	sed -i 's/mem_abc/mem_abc_estruc/g' micro_ucr_hash_estruc.v
	

	
	emacs --batch Banco_hash.v -f verilog-batch-auto
dependencia2:
	iverilog -o resultado Banco_hash.v
	vvp resultado
	
