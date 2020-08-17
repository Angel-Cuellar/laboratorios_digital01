// modulo para mux 2:1 

module MUX2a1(input logic [3:0] D0, D1, input logic S, output logic [3:0] Y); 

	assign Y = S ? D1 : D0 ; 

endmodule 

