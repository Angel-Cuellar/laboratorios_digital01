// ecuaciones de ejercicio 05 
// tipo de solucion por gate level 

// Ecuacion SOP  

module t01(input wire A, B , C , output wire Y); 

	wire notB, notC, w1, w2, w3; 
	not (notB, B); 
	not (notC, C); 
	and(w1, A, notB, C); 
	and(w2, A, B, notC); 
	and(w3, A, B, C); 
	or(Y, w1,w2,w3); 

endmodule 

// Ecuacion POS 

module t02(input wire A, B , C , output wire Y); 

	wire notA, notB, notC, w1, w2, w3, w4, w5; 
	not (notA, A); 
	not (notB, B); 
	not (notC, C); 
	or (w1, A, B, C); 
	or (w2, A, B, notC); 
	or (w3, A, notB, C); 
	or (w4, A, notB, notC); 
	or (w5, notA, B, C); 
	and (Y, w1,w2,w3,w4,w5);

endmodule 

// Ecuacion minimizada

module t03(input wire A, B , C , output wire Y); 

	wire w1, w2; 
	and (w1, A, B); 
	and (w2, A, C); 
	or (Y, w1,w2);

endmodule 

// ecuaciones de ejercicio 5
// tipo de solucion por operadores logicos 


// Ecuacion SOP  

module f01(input wire A, B, C, output wire Y); 

	assign Y = (A & ~B & C) | (A & B & ~C) | (A & B & C) ; 
	
endmodule 

// Ecuacion POS 

module f02(input wire A, B, C, output wire Y);

	assign Y = (A | B | C)&(A | B | ~C)&(A | ~B | C)&(A | ~B | ~C)&(~A | B | C) ; 
	
endmodule 

// Ecuacion minimizada

module f03(input wire A, B, C, output wire Y);

	assign Y = (A & B) | (A & C) ;

endmodule 

