`include "modulos_FSM2.v"  

module testbench();

	reg J, K, L, C, G, E, F, clk, reset, M0, M1; 
	wire S0, S1, S2, S0F, S1F, S2F, CC0, CC1, CC2; 

	FSM2 U1(J, K, L, E, F, C, G, M0, M1, clk, reset, CC0, CC1, CC2, S0, S1, S2, S0F, S1F, S2F); 
	
	initial begin 
		
		$display("J K L E F C G M0 M1 S0 S1 S2 S0F S1F S2F | CC0 CC1 CC2"); 
		$monitor("%b %b %b %b %b %b %b %b %b %b %b %b %b %b %b| %b %b %b" , J, K, L, E, F, C, G, M0, M1, S0, S1, S2, S0F, S1F, S2F, CC0, CC1, CC2, ); 
	end 
	
// solo puse algunos valores donde solo hay cambios de subido en la caja de cambios no considere las bajas y los de permanecia de cambio. 	

	initial begin 
		
		clk = 0; reset = 0; 
		#5 reset=1; 
		#10 reset=0; 
		#15 J=0; K=0; L=1; E=0; F=0; C=0; G=0; M0=1; M1=1;
		#20 J=0; K=0; L=1; E=1; F=0; C=0; G=0; M0=1; M1=1;	
		#25 J=0; K=1; L=0; E=0; F=0; C=0; G=0; M0=1; M1=1;
		#30 J=0; K=1; L=0; E=1; F=0; C=0; G=0; M0=1; M1=1;
		#35 J=0; K=1; L=1; E=0; F=0; C=0; G=0; M0=1; M1=1;
		#40 J=0; K=1; L=1; E=1; F=0; C=0; G=0; M0=1; M1=1;
		#45 J=1; K=0; L=1; E=0; F=0; C=0; G=0; M0=1; M1=1;
		#50 J=1; K=0; L=0; E=1; F=0; C=0; G=0; M0=1; M1=1;
		#55 J=1; K=0; L=1; E=0; F=0; C=0; G=0; M0=1; M1=1;
		#60 J=1; K=0; L=1; E=1; F=0; C=0; G=0; M0=1; M1=1;
		#65 J=1; K=1; L=0; E=0; F=0; C=0; G=0; M0=1; M1=1;
		#70 J=1; K=1; L=0; E=1; F=0; C=0; G=0; M0=1; M1=1;
		#75 J=1; K=1; L=1; E=0; F=0; C=0; G=0; M0=1; M1=1;
		#80 J=1; K=1; L=1; E=1; F=0; C=0; G=0; M0=1; M1=1; 	
	end 
	
	initial 
	
	#500 $finish; 
	
	always 
		#7 clk = ~clk; 
	
	initial begin
        $dumpfile("FSM2_timing.vcd");
        $dumpvars(0, testbench);
    end
endmodule 