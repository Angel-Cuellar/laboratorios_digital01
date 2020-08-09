module pruenbaSOPtabla2();
	wire w01,w02,w03,w1,w2,w3,out;
	reg A,B,C;
	not n1(w01,A);
	not n2(w02,B);
	not n3(w03,C);
	
	and e1(w1,w01,w02,C);
	and e2(w2,A,B,w03);
	and e3(w3,A,B,C);
	or s1(out,w1,w2,w3);
	
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
		$dumpfile("codigoSOPtabla2_tb.vcd");
		$dumpvars(0,pruenbaSOPtabla2);
	end 

endmodule