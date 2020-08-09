module pruenbaSOPtabla3();
	wire w01,w02,w03,w04,w1,w2,w3,w4,w5,w6,w7,out;
	reg A,B,C,D;
	not n1(w01,A);
	not n2(w02,B);
	not n3(w03,C);
	not n4(w04,D);
	
	and e1(w1,w01,w02,w03,w04);
	and e2(w2,w01,w02,w03,D);
	and e3(w3,w01,w02,C,w04);
	and e4(w4,w01,w02,C,D);
	and e5(w5,A,w02,w03,w04);
	and e6(w6,A,w02,C,w04);
	and e7(w7,A,B,C,w04);
	or s1(out,w1,w2,w3,w4,w5,w6,w7);
	
	initial begin 
		$display("A B C D | Y");
		$display("--------|--");
		$monitor("%b %b %b %B | %b" , A,B,C,D,out);
		A=0; B=0; C=0; D=0;
		#1 A=0; B=0; C=0; D=1;
		#1 A=0; B=0; C=1; D=0;
		#1 A=0; B=0; C=1; D=1;
		#1 A=0; B=1; C=0; D=0;
		#1 A=0; B=1; C=0; D=1;
		#1 A=0; B=1; C=1; D=0;
		#1 A=0; B=1; C=1; D=1;
		#1 A=1; B=0; C=0; D=0;
		#1 A=1; B=0; C=0; D=1;
		#1 A=1; B=0; C=1; D=0;
		#1 A=1; B=0; C=1; D=1;
		#1 A=1; B=1; C=0; D=0;
		#1 A=1; B=1; C=0; D=1;
		#1 A=1; B=1; C=1; D=0;
		#1 A=1; B=1; C=1; D=1;
		#1 $finish;
	end 
	
	initial begin 
		$dumpfile("codigoSOPtabla3_tb.vcd");
		$dumpvars(0,pruenbaSOPtabla3);
	end 

endmodule