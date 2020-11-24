module counter(input CLK, RESET, A, enabled, input [11:0] LOAD, output reg [11:0] PC); 
	
	always @ (posedge CLK, posedge RESET, posedge A)
	
		if (RESET)  
			PC <= 0;
		else if (A)  
			PC <= LOAD;
		else if (enabled)  
			PC <= PC + 1;
endmodule 