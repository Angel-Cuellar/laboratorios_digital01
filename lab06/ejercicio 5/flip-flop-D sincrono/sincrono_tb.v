`include "sincrono.v" 

module testbench();

	reg clk, reset, f;
	wire p; 
	
	FFD_sincrono m1(clk,reset,f,p); 
	
	initial begin 
		reset = 0;
		clk=1;
		$display("Flip Flop tipo D sincrono");
		$display("f | p ");
		$display("------|------");
		$monitor("%b | %b", f, p);
		#20 f = 1;  
		#10 f = 1; 		
		#10 f = 0; 
		#10 f = 1; 
    end 
		
  
	always
    #5 clk = ~clk;
	
	initial 
		#10 $finish;
	
endmodule 
 