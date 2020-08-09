module pruenbaPOStabla3();
	wire w01,w02,w03,w04,w1,w2,w3,w4,w5,w6,w7,w8,w9,out;
	reg A,B,C,D;
	not n1(w01,A);
	not n2(w02,B);
	not n3(w03,C);
	not n4(w04,D);
	
	or e1(w1,A,w02,C,D);
	or e2(w2,A,w02,C,w04);
	or e3(w3,A,w02,w03,D);
	or e4(w4,A,w02,w03,w04);
	or e5(w5,w01,B,C,w04);
	or e6(w6,w01,B,w03,w04);
	or e7(w7,w01,w02,C,D);
	or e8(w8,w01,w02,C,w04);
	or e9(w9,w01,w02,w03,w04);
	and s1(out,w1,w2,w3,w4,w5,w6,w7,w8,w9);
	
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
		$dumpfile("codigoPOStabla3_tb.vcd");
		$dumpvars(0,pruenbaPOStabla3);
	end 

endmodule