`include "memoria.v" 

module testbench();

	reg [11:0] localidad; 
	wire[7:0] datos; 
	
	ROM M1(localidad, datos); 
	
	initial begin 
		
		$display("memoria ROM"); 
		$display(" localidad  |  dato almacenado");
		$monitor(" %b  |  %b  ", localidad, datos);  
		
		localidad = 12'b0; 
		#1 localidad = 12'b1; 
		#1 localidad = 12'b10; 
		#1 localidad = 12'b11; 
	
	end 
	
	initial 
	
	#50 $finish; 
	
	initial begin
        $dumpfile("memoriaROM_timing.vcd");
        $dumpvars(0, testbench);
    end
endmodule