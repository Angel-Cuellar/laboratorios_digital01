`include "ProblemaAlarma.v" 

module testbench();

	reg a1, a2, a3;
	reg b1, b2, b3; 
	reg c1, c2, c3; 
	reg d1, d2, d3; 
	reg e1, e2, e3; 
	reg f1, f2, f3; 
	wire s1, s2, s3, s4, s5, s6; 
	
	t01 m1(a1,a2,a3,s1); 
	t02 m2(b1,b2,b3,s2);
	t03 m3(c1,c2,c3,s3); 
	f01 n1(d1,d2,d3,s4);
	f02 n2(e1,e2,e3,s5);
	f03 n3(f1,f2,f3,s6);
	
	initial begin 
		$display("ecuaciones con gate level ");
		$display("\n");
		$display("ecuacion SOP");
		$display("A B C | Y ");
		$display("------|------");
		$monitor("%b %b %b | %b", a1, a2, a3, s1);
		a1 = 0; a2 = 0; a3 = 0;
		#1 a1 = 0; a2 = 0; a3 = 1;
		#1 a1 = 0; a2 = 1; a3 = 0;
		#1 a1 = 0; a2 = 1; a3 = 1;
		#1 a1 = 1; a2 = 0; a3 = 0;
		#1 a1 = 1; a2 = 0; a3 = 1;
		#1 a1 = 1; a2 = 1; a3 = 0;
		#1 a1 = 1; a2 = 1; a3 = 1;
	end 
	
	initial begin 
		#10 
		$display("\n");
		$display("ecuacion POS");
		$display("A B C | Y");
		$display("------|--");
		$monitor("%b %b %b | %b", b1, b2, b3, s2);
		b1 = 0; b2 = 0; b3 = 0;
		#1 b1 = 0; b2 = 0; b3 = 1;
		#1 b1 = 0; b2 = 1; b3 = 0;
		#1 b1 = 0; b2 = 1; b3 = 1;
		#1 b1 = 1; b2 = 0; b3 = 0;
		#1 b1 = 1; b2 = 0; b3 = 1;
		#1 b1 = 1; b2 = 1; b3 = 0;
		#1 b1 = 1; b2 = 1; b3 = 1;
	end 
	
	initial begin 
		#19 
		$display("\n");
		$display("ecuacion minimizada");
		$display("A B C | Y");
		$display("--------|--");
		$monitor("%b %b %b | %b" , c1,c2,c3,s3);
		c1=0; c2=0; c3=0; 
		#1 c1 = 0; c2 = 0; c3 = 1;
		#1 c1 = 0; c2 = 1; c3 = 0;
		#1 c1 = 0; c2 = 1; c3 = 1;
		#1 c1 = 1; c2 = 0; c3 = 0;
		#1 c1 = 1; c2 = 0; c3 = 1;
		#1 c1 = 1; c2 = 1; c3 = 0;
		#1 c1 = 1; c2 = 1; c3 = 1;
	end 
	
	initial begin 
		#28
		$display("\n");
		$display("ecuaciones con operadores logicos");
		$display("\n");
		$display("ecuacion SOP");
		$display("A B C | Y");
		$display("--------|--");
		$monitor("%b %b %b | %b" , d1,d2,d3,s4);
		d1=0; d2=0; d3=0; 
		#1 d1 = 0; d2 = 0; d3 = 1;
		#1 d1 = 0; d2 = 1; d3 = 0;
		#1 d1 = 0; d2 = 1; d3 = 1;
		#1 d1 = 1; d2 = 0; d3 = 0;
		#1 d1 = 1; d2 = 0; d3 = 1;
		#1 d1 = 1; d2 = 1; d3 = 0;
		#1 d1 = 1; d2 = 1; d3 = 1;
	end 
	
	initial begin 
		#37
		$display("\n");
		$display("ecuacion POS");
		$display("A B C | Y");
		$display("--------|--");
		$monitor("%b %b %b | %b" , e1,e2,e3,s5);
		e1=0; e2=0; e3=0; 
		#1 e1 = 0; e2 = 0; e3 = 1;
		#1 e1 = 0; e2 = 1; e3 = 0;
		#1 e1 = 0; e2 = 1; e3 = 1;
		#1 e1 = 1; e2 = 0; e3 = 0;
		#1 e1 = 1; e2 = 0; e3 = 1;
		#1 e1 = 1; e2 = 1; e3 = 0;
		#1 e1 = 1; e2 = 1; e3 = 1;
	end 
	
	initial begin 
		#46
		$display("\n");
		$display("ecuacion minimizada");
		$display("A B C | Y");
		$display("------|--");
		$monitor("%b %b %b | %b", f1, f2, f3, s6);
		f1 = 0; f2 = 0; f3 = 0;
		#1 f1 = 0; f2 = 0; f3 = 1;
		#1 f1 = 0; f2 = 1; f3 = 0;
		#1 f1 = 0; f2 = 1; f3 = 1;
		#1 f1 = 1; f2 = 0; f3 = 0;
		#1 f1 = 1; f2 = 0; f3 = 1;
		#1 f1 = 1; f2 = 1; f3 = 0;
		#1 f1 = 1; f2 = 1; f3 = 1;
	end 
	
	initial 
		#55 $finish; 
	
	initial begin 
		$dumpfile("ProblemaAlarma_tb.vcd");
		$dumpvars(0, testbench);
	end 

endmodule 