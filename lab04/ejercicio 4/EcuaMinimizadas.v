// ecuaciones de ejercicio 01 
// tipo de solucion por gate level 

// Ecuacion tabla01 

module t01(input wire A, B , C , output wire Y); 

	wire notA, notB, notC, w1, w2, w3, w4; 
	not (notA, A); 
	not (notB, B); 
	not (notC, C); 
	and(w1, notB, notC); 
	and(w2, notA, notC); 
	and(w3, A, C); 
	and(w4, A, notB); 
	or(Y, w1,w2,w3,w4); 

endmodule 

// Ecuacion tabla02 

module t02(input wire A, B , C , output wire Y); 

	not(Y, B); 

endmodule

// Ecuacion tabla03

module t03(input wire A, B , C ,D, output wire Y); 

	wire notA, notB, notC, notD, w1, w2, w3, w4, w5, w6, w7, w8; 
	not (notA, A); 
	not (notB, B); 
	not (notC, C); 
	not (notD, D); 
	and (w1, notA,notB,notC,notD);
	and (w2, notA,notB,C,D);
	and (w3, notA,B,notC,D);
	and (w4, notA,B,C,notD);
	and (w5, A,B,notC,notD);
	and (w6, A,B,C,D);
	and (w7, A,notB,notC,D);
	and (w8, A,notB,C,notD);
	or (Y, w1 , w2, w3, w4, w5, w6, w7, w8); 

endmodule 

// Ecuacion tabla04

module t04(input wire A, B , C ,D, output wire Y); 

	wire notB, notC, notD, w1, w2, w3, w4; 
	not (notB, B); 
	not (notC, C); 
	not (notD, D); 
	and (w1, A,C);
	and (w2, B,D);
	and (w3, A,B);
	and (w4, notB,notC,notD);
	or (Y, w1 , w2, w3, w4); 
	
endmodule 

// ecuaciones de ejercicio 02 
// tipo de solucion por operadores logicos 

// Ecuacion minimizada 1 

module f01(input wire A, B, C, D, output wire Y); 

	assign Y = ~B | ~D | (~C & D) ; 
	
endmodule 

// Ecuacion minimizada 2

module f02(input wire A, B, C, output wire Y); 

	assign Y = (~A & ~B) | A | ~B | C ; 

endmodule 

// Ecuacion minimizada 3

module f03(input wire A, B, C, D, output wire Y); 

	assign Y = (~A & ~B & ~C) | (A & D) ; 

endmodule 

// Ecuacion minimizada 4 

module f04(input wire A, B, C, output wire Y); 

	assign Y = (~A & ~B & ~C) | (B & C) ; 

endmodule 




















