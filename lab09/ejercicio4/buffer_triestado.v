module BUFFER(input wire ENABLE, input wire [3:0] A, output reg [3:0] Y); 

	always @ (posedge A)begin 

		if (ENABLE) 
			Y <= A; 
		else 
			Y <=4'bZZZZ; 
	end 
endmodule 





