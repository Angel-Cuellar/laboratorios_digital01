module FFD (input clk, reset, D, output reg Q);

  always @ (posedge clk or posedge reset) begin
    if (reset)
      Q <= 1'b0;
    else
      Q <= D;
  end
endmodule

// Implementacion de la primer FSM 

module FSM2(input J, K, L, E, F, C, G, M0, M1, clk, reset, output wire CC0, CC1, CC2, S0, S1, S2, S0F, S1F, S2F);

    // Cables de interconexiones
    wire CC_0, CC_1, CC_2, S_0, S_1, S_2, S0_F, S1_F, S2_F; 
    
    // Calculo del estado futuro de la FSM1
    assign S0_F = ((~S_0)&(S_1)&(S_2)&(J)&(~K)&(~L)&(E)&(~F)&(~C)&(~G)&(M0)&(M1)| (~S_0)&(~S_1)&(~S_2)&(~J)&(~K)&(~L)&(~E)&(~F)&(C)&(G)&(M0)&(M1) | (S_0)&(~S_1)&(S_2)&(J)&(K)&(~L)&(E)&(~F)&(~C)&(~G)&(M0)&(M1)
			    | (S_0)&(~S_1)&(~S_2)&(J)&(~K)&(L)&(~E)&(F)&(~G)&(M0)&(M1) | (S_0)&(~S_1)&(~S_2)&(J)&(~K)&(L)&(~F)&(~C)&(~G)&(M0)&(M1) | (S_0)&(S_1)&(~S_2)&(J)&(K)&(L)&(~E)&(F)&(C)&(~G)&(M0)&(M1)
				| (S_0)&(S_1)&(~S_2)&(J)&(K)&(L)&(E)&(~F)&(~G)&(M0)&(M1) | (S_0)&(S_1)&(~S_2)&(J)&(K)&(L)&(~E)&(F)&(~G)&(M0)&(M1) | (S_0)&(S_1)&(~S_2)&(J)&(K)&(L)&(~F)&(~C)&(~G)&(M0)&(M1)
				| (S_0)&(~S_1)&(S_2)&(J)&(K)&(~L)&(~E)&(~G)&(M0)&(M1) | (S_0)&(S_1)&(S_2)&(C)&(G)&(M0)&(M1) | (S_0)&(S_1)&(S_2)&(~E)&(G)&(M0)&(M1)); 
				
    assign S1_F = ((~S_0)&(~S_1)&(S_2)&(~J)&(K)&(~L)&(E)&(~F)&(~C)&(~G)&(M0)&(M1) | (~S_0)&(~S_1)&(~S_2)&(~J)&(~K)&(~L)&(~E)&(~F)&(C)&(G)&(M0)&(M1) | (~S_0)&(S_1)&(~S_2)&(~J)&(K)&(L)&(~E)&(F)&(~G)&(M0)&(M1)
			   | (S_0)&(~S_1)&(S_2)&(J)&(K)&(~L)&(E)&(~F)&(~C)&(~G)&(M0)&(M1) | (S_0)&(~S_1)&(~S_2)&(J)&(~K)&(L)&(~E)&(~F)&(C)&(~G)&(M0)&(M1) | (~S_0)&(S_1)&(~S_2)&(~J)&(K)&(L)&(~F)&(~C)&(~G)&(M0)&(M1)
			   | (S_0)&(S_1)&(~S_2)&(J)&(K)&(L)&(E)&(~F)&(~G)&(M0)&(M1) | (S_0)&(S_1)&(~S_2)&(J)&(K)&(L)&(~E)&(F)&(~G)&(M0)&(M1) | (~S_0)&(S_1)&(S_2)&(J)&(~K)&(~L)&(~E)&(~G)&(M0)&(M1)
			   | (S_0)&(S_1)&(~S_2)&(J)&(K)&(L)&(~F)&(~C)&(~G)&(M0)&(M1) | (S_0)&(S_1)&(S_2)&(C)&(G)&(M0)&(M1) | (S_0)&(S_1)&(S_2)&(~E)&(G)&(M0)&(M1));

	assign S2_F = ((~S_0)&(~S_1)&(~S_2)&(~J)&(~K)&(L)&(E)&(~F)&(~C)&(~G)&(M0)&(M1) | (~S_0)&(~S_1)&(~S_2)&(~J)&(~K)&(~L)&(~E)&(~F)&(C)&(G)&(M0)&(M1) | (~S_0)&(S_1)&(~S_2)&(~J)&(K)&(L)&(E)&(~F)&(~C)&(~G)&(M0)&(M1)
			   | (S_0)&(~S_1)&(~S_2)&(J)&(~K)&(L)&(E)&(~F)&(~C)&(~G)&(M0)&(M1) | (~S_0)&(S_1)&(~S_2)&(~J)&(K)&(L)&(~E)&(~F)&(C)&(~G)&(M0)&(M1) | (~S_0)&(~S_1)&(S_2)&(~J)&(K)&(~L)&(~E)&(F)&(~G)&(M0)&(M1) 
			   | (~S_0)&(S_1)&(S_2)&(J)&(~K)&(~L)&(~E)&(F)&(~G)&(M0)&(M1) | (S_0)&(~S_1)&(~S_2)&(J)&(~K)&(L)&(~E)&(~F)&(C)&(~G)&(M0)&(M1) | (~S_0)&(~S_1)&(S_2)&(~J)&(K)&(~L)&(~E)&(~C)&(~G)&(M0)&(M1)
			   | (S_0)&(~S_1)&(S_2)&(J)&(K)&(~L)&(~E)&(F)&(~G)&(M0)&(M1) | (~S_0)&(S_1)&(S_2)&(J)&(~K)&(~L)&(~E)&(~C)&(~G)&(M0)&(M1) | (S_0)&(S_1)&(~S_2)&(J)&(K)&(L)&(~E)&(~F)&(C)&(~G)&(M0)&(M1)
			   | (S_0)&(~S_1)&(S_2)&(J)&(K)&(~L)&(~E)&(~C)&(~G)&(M0)&(M1) | (S_0)&(S_1)&(S_2)&(C)&(G)&(M0)&(M1) | (S_0)&(S_1)&(S_2)&(~E)&(G)&(M0)&(M1));
			   
    // Calculo de salidas de la FSM1
    assign CC0 = S_0;
	assign CC1 = S_1; 
	assign CC2 = S_2; 
    
    FFD E0(clk, reset, S0_F, S_0);
    FFD E1(clk, reset, S1_F, S_1);
	FFD E2(clk, reset, S2_F, S_2);
    
    // Visulizacion de los estados actulaes y futuros 
    assign S0 = S_0;
    assign S1 = S_1; 
	assign S2 = S_2; 
	assign S0F = S0_F; 
	assign S1F = S1_F; 
	assign S2F = S2_F; 

endmodule