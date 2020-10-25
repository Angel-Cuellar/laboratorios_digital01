`include "contador_modulos.v" 

module testbench();

	reg CLK, RESET, A, enable; 
	reg[11:0] LOAD; 
	wire[11:0] Y; 

	counter M1(CLK, RESET, A, enable, LOAD, Y) ; 

	initial begin 
	
		$display("A enable LOAD | Y"); 
		$monitor("%b %b %b | %b", A, enable, LOAD, Y); 
	end 
	
	initial begin 
		CLK = 0; RESET = 1; 
		#1 RESET = 0; enable = 1; A = 0; LOAD = 0; 
		#30 RESET = 0; enable = 1; A = 1; LOAD = 30;
		#31 RESET = 0; enable = 1; A = 0;
		#70 RESET = 0; enable = 0; A = 0;  
	end 
	
	initial 
	
	#500 $finish; 
	
	always 
		#2 CLK = ~CLK; 
	
	initial begin
        $dumpfile("contador_timing.vcd");
        $dumpvars(0, testbench);
    end
endmodule 