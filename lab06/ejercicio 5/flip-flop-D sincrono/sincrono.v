module FFD_sincrono(input wire clk,reset,f, output reg p); 

always @ (posedge clk, posedge reset)
	begin 
	if (reset) 
		p <= 1; 
	else 
		p <= f; 
end 
endmodule 
