module FFD1(input CLK, D, ENABLE, RESET, output reg Q); 

	always @ (posedge CLK, posedge RESET) begin 
		
		if (RESET)
			Q <= 1'b0; 
		else if (ENABLE) 
			Q <= D; 
	end
endmodule 

module FFD2(input CLK, ENABLE, RESET, input [1:0] D, output wire [1:0] Q); 

	FFD1 M0(CLK, D[0], ENABLE, RESET, Q[0]); 
	FFD1 M1(CLK, D[0], ENABLE, RESET, Q[0]); 

endmodule 


module FFD4(input CLK, ENABLE, RESET, input [3:0] D, output wire [3:0] Q); 

	FFD1 B0(CLK, D[0], ENABLE, RESET, Q[0]); 
	FFD1 B1(CLK, D[1], ENABLE, RESET, Q[1]); 
	FFD1 B2(CLK, D[2], ENABLE, RESET, Q[2]); 
	FFD1 B3(CLK, D[3], ENABLE, RESET, Q[3]); 

endmodule 		
