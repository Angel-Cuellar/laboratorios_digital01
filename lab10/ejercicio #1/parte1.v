module counter(input CLK, RESET1, A, E1, input [11:0] LOAD, output reg [11:0] PC); 
	
	always @ (posedge CLK, posedge RESET1, posedge A)
	
		if (RESET1)  
			Y <= 0;
		else if (A)  
			Y <= LOAD;
		else if (E1)  
			Y <= Y + 1;
		else 
			Y <= Y; 
endmodule

module ROM(input wire [11:0] Localidad, output wire [7:0] Datos); 

	reg[7:0] Memoria[0:4096];  
	
	initial begin 
		$readmemb("Memoria.txt", Memoria); 
	end 
	
	assign Datos = Memoria[Localidad]; 
	
endmodule 

module FETCH(input wire CLK, E2, RESET2, input wire [7:0] D output reg [3:0] Q1, Q2); 

	always @ (posedge CLK, posedge RESET2) begin 
		
		if (RESET2)
			Q1 <= 4'b0000;
			Q2 <= 4'b0000;
		else if (E2) 
			Q1 <= D[3:0]; 
			Q2 <= D[7:4]; 
	end
endmodule 

module part1(CLK, RESET1, RESET2, A, E1, E2, input wire [11:0] LOAD, output wire [3:0] Q1, Q2); 

counter M1(CLK, RESET1, A, E1, LOAD, PC); 
ROM M2(PC, D); 
FETCH M3(CLK, E2, RESET2, D, Q1, Q2); 

endmodule 