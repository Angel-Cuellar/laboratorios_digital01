module pruenbaPOStabla2();
	wire w01,w02,w03,w1,w2,w3,w4,w5,out;
	reg A,B,C;
	not n1(w01,A);
	not n2(w02,B);
	not n3(w03,C);
	
	or e1(w1,A,B,c);
	or e2(w2,A,w02,w03);
	or e3(w3,A,w02,w03);
	or e4(w4,w01,B,C);
	or e5(w5,w01,B,w03);
	and s1(out,w1,w2,w3);
	
	initial begin 
		$display("A B C | Y");
		$display("------|--");
		$monitor("%b %b %b | %b" , A,B,C,out);
		A=0; B=0; C=0; 
		#1 A=0; B=0; C=1;
		#1 A=0; B=1; C=0;
		#1 A=0; B=1; C=1;
		#1 A=1; B=0; C=0;
		#1 A=1; B=0; C=1;
		#1 A=1; B=1; C=0;
		#1 A=1; B=1; C=1;
		#1 $finish;
	end 
	
	initial begin 
		$dumpfile("codigoPOStabla2_tb.vcd");
		$dumpvars(0,pruenbaPOStabla2);
	end 

endmodule