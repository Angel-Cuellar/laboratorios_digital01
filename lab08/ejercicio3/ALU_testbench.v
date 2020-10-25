`include "ALU_modulo.v" 

module testbench();

	reg [2:0] caso; 
	reg [3:0] A, B; 
	wire [3:0] Y; 

	ALU M1(caso, A, B, Y); 
	
	initial begin 
		
		$display("CASO-----A-----B------ |  Y"); 
		$monitor("%b %b %b | %b", caso, A, B, Y); 
		
		caso = 3'b000; A = 4'b1001; B = 4'b1010; 
		#1 caso = 3'b001; A = 4'b1001; B = 4'b1010; 
		#1 caso = 3'b010; A = 4'b1001; B = 4'b1010; 
		#1 caso = 3'b011; A = 4'b1001; B = 4'b1010;  
		#1 caso = 3'b100; A = 4'b1001; B = 4'b1010; 
		#1 caso = 3'b101; A = 4'b1001; B = 4'b1010; 
		#1 caso = 3'b110; A = 4'b1001; B = 4'b1010;
		#1 caso = 3'b111; A = 4'b1001; B = 4'b1010; 
		
	end 
	
	initial 
	
	#50 $finish; 
	
	initial begin
        $dumpfile("ALU_timing.vcd");
        $dumpvars(0, testbench);
    end
endmodule