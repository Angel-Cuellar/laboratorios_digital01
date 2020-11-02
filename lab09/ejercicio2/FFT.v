`include "FFD.v"

module FFT(input wire CLK, RESET, ENBALE, output wire Q); 

	wire D; 

	FFD1 M1(CLK, D, ENABLE, RESET, Q); 

	not (D, Q); 

endmodule 