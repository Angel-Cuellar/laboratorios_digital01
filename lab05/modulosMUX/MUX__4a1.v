// modulo para mux 4:1 

module MUX4a1(input logic [3:0] D0, D1, D2, D3, input logic [1:0] S, output logic [3:0] Y); 

	assign Y = S[1] ? (S[0] ? D3 : D2) : (S[0] ? D1 : D0) ; 

endmodule 