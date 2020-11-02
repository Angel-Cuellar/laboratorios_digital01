`include "FFD.v"

module FFJK(input wire J, K, CLK, RESET, ENABLE, output wire Q); 

wire A, B, C, D, F; 
reg E, G;  

	always @ (posedge CLK, posedge RESET) begin 
	
		if (RESET) 
			G <= 1'b0; 
		else if (ENABLE)
			E <= C | D;	
	end 
	
assign F = E;  
assign Q = G; 
not (A, Q); 
not (B, K); 
and (C, J, A); 
and (D, B, Q); 
	
FFD1 M1(CLK, F, ENABLE, RESET, Q); 

endmodule 
