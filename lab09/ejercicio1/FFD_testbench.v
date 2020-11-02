`include "FFD.v" 

module testbench();

	reg CLK, RESET, D, enable; 
	wire Q; 

	FFD1 M1(CLK, D, enable, RESET, Q);

	initial begin 
	
		$display( "enable D | Q"); 
		$monitor("%b %b | %b", enable, D,  Q); 
	end 
	
	initial begin 
		CLK = 0; RESET = 1; enable= 1; 
		#6 RESET = 0; enable = 1;  D= 0; 
		#12 RESET = 0; enable = 1; D = 1; 
		#18 RESET = 0; enable = 0; D = 0;
		#24 RESET = 0; enable = 0; D = 1;  
	end 
	
	initial 
	
	#500 $finish; 
	
	always
	
		#5 CLK = ~CLK; 
	
	initial begin
        $dumpfile("FFD_timing.vcd");
        $dumpvars(0, testbench);
    end
endmodule 