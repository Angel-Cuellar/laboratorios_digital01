module ALU(input [2:0] Caso, input [3:0] A, B, output wire [3:0] Y); 

	reg [3:0] C; 

	always @ (posedge Caso) 
	
		case(Caso) 
		
			3'b000:
				C = A & B; 
			3'b001: 
				C = A | B; 
			3'b010: 
				C = A + B; 
			3'b011: 
				C = 3'b000; 
			3'b100: 
				C = A & ~B; 
			3'b101: 
				C = A | ~B; 
			3'b110: 
				C = A - B; 
			3'b111: 
				C = (A < B) ? 1 : 0 ; 
		endcase
		
		assign Y = C; 
		
endmodule 	
	