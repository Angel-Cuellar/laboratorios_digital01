`include "EcuaMinimizadas.v" 

module testbench();

	reg a1, a2, a3;
	reg b1, b2, b3; 
	reg c1, c2, c3, c4; 
	reg d1, d2, d3, d4; 
	reg e1, e2, e3, e4; 
	reg f1, f2, f3; 
	reg g1, g2, g3, g4;
	reg h1, h2, h3 ; 
	wire s1, s2, s3, s4, s5, s6, s7, s8; 
	
	t01 m1(a1,a2,a3,s1); 
	t02 m2(b1,b2,b3,s2);
	t03 m3(c1,c2,c3,c4,s3); 
	t04 m4(d1,d2,d3,d4,s4);
	f01 n1(e1,e2,e3,e4,s5);
	f02 n2(f1,f2,f3,s6);
	f03 n3(g1,g2,g3,g4,s7);
	f04 n4(h1,h2,h3,s8); 
	
	initial begin 
		$display("ecuacion tabla 01");
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
		$display("ecuacion tabla 02");
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
		$display("ecuacion tabla 03");
		$display("A B C D | Y");
		$display("--------|--");
		$monitor("%b %b %b %B | %b" , c1,c2,c3,c4,s3);
		c1=0; c2=0; c3=0; c4=0;
		#1 c1=0; c2=0; c3=0; c4=1;
		#1 c1=0; c2=0; c3=1; c4=0;
		#1 c1=0; c2=0; c3=1; c4=1;
		#1 c1=0; c2=1; c3=0; c4=0;
		#1 c1=0; c2=1; c3=0; c4=1;
		#1 c1=0; c2=1; c3=1; c4=0;
		#1 c1=0; c2=1; c3=1; c4=1;
		#1 c1=1; c2=0; c3=0; c4=0;
		#1 c1=1; c2=0; c3=0; c4=1;
		#1 c1=1; c2=0; c3=1; c4=0;
		#1 c1=1; c2=0; c3=1; c4=1;
		#1 c1=1; c2=1; c3=0; c4=0;
		#1 c1=1; c2=1; c3=0; c4=1;
		#1 c1=1; c2=1; c3=1; c4=0;
		#1 c1=1; c2=1; c3=1; c4=1;
	end 
	
	initial begin 
		#38 
		$display("\n");
		$display("ecuacion tabla 04");
		$display("A B C D | Y");
		$display("--------|--");
		$monitor("%b %b %b %B | %b" , d1,d2,d3,d4,s4);
		d1=0; d2=0; d3=0; d4=0;
		#1 d1=0; d2=0; d3=0; d4=1;
		#1 d1=0; d2=0; d3=1; d4=0;
		#1 d1=0; d2=0; d3=1; d4=1;
		#1 d1=0; d2=1; d3=0; d4=0;
		#1 d1=0; d2=1; d3=0; d4=1;
		#1 d1=0; d2=1; d3=1; d4=0;
		#1 d1=0; d2=1; d3=1; d4=1;
		#1 d1=1; d2=0; d3=0; d4=0;
		#1 d1=1; d2=0; d3=0; d4=1;
		#1 d1=1; d2=0; d3=1; d4=0;
		#1 d1=1; d2=0; d3=1; d4=1;
		#1 d1=1; d2=1; d3=0; d4=0;
		#1 d1=1; d2=1; d3=0; d4=1;
		#1 d1=1; d2=1; d3=1; d4=0;
		#1 d1=1; d2=1; d3=1; d4=1;
	end 
	
	initial begin 
		#57
		$display("\n");
		$display("ecuacion minimizada 01");
		$display("A B C D | Y");
		$display("--------|--");
		$monitor("%b %b %b %B | %b" , e1,e2,e3,e4,s5);
		e1=0; e2=0; e3=0; e4=0;
		#1 e1=0; e2=0; e3=0; e4=1;
		#1 e1=0; e2=0; e3=1; e4=0;
		#1 e1=0; e2=0; e3=1; e4=1;
		#1 e1=0; e2=1; e3=0; e4=0;
		#1 e1=0; e2=1; e3=0; e4=1;
		#1 e1=0; e2=1; e3=1; e4=0;
		#1 e1=0; e2=1; e3=1; e4=1;
		#1 e1=1; e2=0; e3=0; e4=0;
		#1 e1=1; e2=0; e3=0; e4=1;
		#1 e1=1; e2=0; e3=1; e4=0;
		#1 e1=1; e2=0; e3=1; e4=1;
		#1 e1=1; e2=1; e3=0; e4=0;
		#1 e1=1; e2=1; e3=0; e4=1;
		#1 e1=1; e2=1; e3=1; e4=0;
		#1 e1=1; e2=1; e3=1; e4=1;
	end 
	
	initial begin 
		#76 
		$display("\n");
		$display("ecuacion minimizada 02");
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
	
	initial begin 
		#85
		$display("\n");
		$display("ecuacion minimizada 03");
		$display("A B C D | Y");
		$display("--------|--");
		$monitor("%b %b %b %B | %b" , g1,g2,g3,g4,s7);
		g1=0; g2=0; g3=0; g4=0;
		#1 g1=0; g2=0; g3=0; g4=1;
		#1 g1=0; g2=0; g3=1; g4=0;
		#1 g1=0; g2=0; g3=1; g4=1;
		#1 g1=0; g2=1; g3=0; g4=0;
		#1 g1=0; g2=1; g3=0; g4=1;
		#1 g1=0; g2=1; g3=1; g4=0;
		#1 g1=0; g2=1; g3=1; g4=1;
		#1 g1=1; g2=0; g3=0; g4=0;
		#1 g1=1; g2=0; g3=0; g4=1;
		#1 g1=1; g2=0; g3=1; g4=0;
		#1 g1=1; g2=0; g3=1; g4=1;
		#1 g1=1; g2=1; g3=0; g4=0;
		#1 g1=1; g2=1; g3=0; g4=1;
		#1 g1=1; g2=1; g3=1; g4=0;
		#1 g1=1; g2=1; g3=1; g4=1;
	end 
	
	initial begin 
		#104 
		$display("\n");
		$display("ecuacion minimizada 04");
		$display("A B C | Y");
		$display("------|--");
		$monitor("%b %b %b | %b", h1, h2, h3, s8);
		h1 = 0; h2 = 0; h3 = 0;
		#1 h1 = 0; h2 = 0; h3 = 1;
		#1 h1= 0;  h2= 1;  h3 = 0;
		#1 h1 = 0; h2 = 1; h3 = 1;
		#1 h1 = 1; h2 = 0; h3 = 0;
		#1 h1 = 1; h2 = 0; h3 = 1;
		#1 h1 = 1; h2 = 1; h3 = 0;
		#1 h1 = 1; h2 = 1; h3 = 1;
	end 
	
	initial 
		#115 $finish; 
	
	initial begin 
		$dumpfile("EcuaMinimizadas_tb.vcd");
		$dumpvars(0, testbench);
	end 

endmodule 