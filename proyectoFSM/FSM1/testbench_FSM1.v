`include "modulos_FSM1.v"  

module testbench();

	reg A, B, C, D, clk, reset; 
	wire M0, M1, S0, S1, S0F, S1F; 

	FSM1 U1(A, B, C, D, clk, reset, M0, M1, S0, S1, S0F, S1F); 
	
	initial begin 
		
		$display("A B C D S0 S1 S0F S1F | M0 M1"); 
		$monitor("%b %b %b %b %b %b %b %b| %b %b" , A, B, C, D, S0, S1, S0F, S1F, M0, M1); 
	end 
	
	initial begin 
		
		clk = 0; reset = 0; 
		#15 A=0; B=0; C=0; D=0; 
		#20 A=0; B=0; C=1; D=1; 
		#25 A=0; B=0; C=1; D=0; 
		#30 A=0; B=1; C=1; D=0; 
		#35 A=0; B=1; C=1; D=1;
		#40 A=0; B=1; C=1; D=0;
		#45 A=0; B=1; C=0; D=1;
		#50 A=0; B=1; C=1; D=0;
		#55 A=1; B=0; C=1; D=0; 
		#60 A=1; B=0; C=1; D=1;
		#65 A=1; B=0; C=1; D=0;
		#70 A=1; B=0; C=0; D=1;
		#75 A=1; B=0; C=1; D=0;
		#80 A=1; B=1; C=1; D=0; 
		#85 A=1; B=1; C=1; D=1;
		#90 A=1; B=1; C=1; D=0;
		#95 A=1; B=1; C=0; D=1;
		#100 A=1; B=1; C=1; D=0;
		#105 A=0; B=0; C=1; D=0;
		#110 A=1; B=1; C=1; D=0;
		#115 A=1; B=0; C=1; D=0;
		#120 A=0; B=1; C=1; D=0;
		#125 A=0; B=0; C=1; D=0;
	end 
	
	initial 
	
	#500 $finish; 
	
	always 
		#7 clk = ~clk; 
	
	initial begin
        $dumpfile("FSM1_timing.vcd");
        $dumpvars(0, testbench);
    end
endmodule 