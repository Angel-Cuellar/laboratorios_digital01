module FFD (input clk, reset, D, output reg Q);

  always @ (posedge clk or posedge reset) begin
    if (reset)
      Q <= 1'b0;
    else
      Q <= D;
  end
endmodule

// Implementacion de la primer FSM 

module FSM1(input A, B, C, D, clk, reset, output wire M0, M1, S0, S1, S0F, S1F);

 // Cables de interconexiones
    wire M_0, M_1, S_0, S_1, S0_F, S1_F;    
	
    // Calculo del estado futuro de la FSM1
    assign S0_F = (S_1)&(A)&(~B)&(C)&(~D) | (~S_1)&(A)&(B)&(C)&(~D)| (S_0)&(~S_1)&(A)&(~B) | (S_0)&(S_1)&(A)&(B);
    assign S1_F = (~S_0)&(S_1)&(~A)&(B) | (~S_1)&(B)&(C)&(~D) | (S_0)&(S_1)&(A)&(B);
    // Calculo de salidas de la FSM1
    assign M0 = S_0;
	assign M1 = S_1; 
    
    FFD E0(clk, reset, S0_F, S_0);
    FFD E1(clk, reset, S1_F, S_1);
    
    // Visulizacion de los estados actulaes y futuros 
    assign S0 = S_0; 
	assign S1 = S_1; 
	assign S0F = S0_F;
    assign S1F = S1_F;

endmodule

