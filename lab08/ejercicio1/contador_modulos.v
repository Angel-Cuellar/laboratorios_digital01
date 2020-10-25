module counter(input CLK, RESET, A, enable, input [11:0] LOAD, output reg [11:0] Y); 
	
	always @ (posedge CLK, posedge RESET, posedge A)
	
		if (RESET)  
			Y <= 0;
		else if (A)  
			Y <= LOAD;
		else if (enable)  
			Y <= Y + 1;
		else 
			Y <= Y; 
endmodule 