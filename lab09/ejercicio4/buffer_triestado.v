module BUFFER(input wire ENABLED, input wire [3:0] A, output reg [3:0] Y); 
	 
	assign Y = ENABLED ? A : 4'bz; 
	
endmodule 





