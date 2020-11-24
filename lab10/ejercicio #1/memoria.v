module ROM(input wire [11:0] Localidad, output wire [7:0] Datos); 

	reg[7:0] Memoria[0:4096];  
	
	initial begin 
		$readmemb("Memoria.txt", Memoria); 
	end 
	
	assign Datos = Memoria[Localidad]; 
	
endmodule 