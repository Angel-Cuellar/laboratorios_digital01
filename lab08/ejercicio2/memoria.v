module ROM(input wire [11:0] Localidad, output wire [7:0] program_byte); 

	reg[7:0] Memoria[0:4096];  
	
	initial begin 
		$readmemh("Memoria.txt", Memoria); 
	end 
	
	assign program_byte = Memoria[Localidad]; 
	
endmodule 