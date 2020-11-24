// modulo de contador o PROGRAM COUNTER 

module COUNTER(input CLK, RESET, A, enabled, input [11:0] LOAD, output reg [11:0] Y_pc); 
	
	always @ (posedge CLK, posedge RESET, posedge A)
	
		if (RESET)  
			Y_pc <= 0;
		else if (A)  
			Y_pc <= LOAD;
		else if (enabled)  
			Y_pc <= Y_pc + 1;
endmodule 

// modulo de la memoria ROM de 64X8 

module ROM(input wire [11:0] Localidad, output wire [7:0] dato); 

	reg[7:0] Memoria[0:4095];  
	
	initial begin 
		$readmemh("memory.list", Memoria); 
	end 
	
	assign dato = Memoria[Localidad]; 
endmodule 

// modulo de FECHT 

module FETCH(input wire CLK, ENABLED, RESET, input wire [7:0] D, output reg [3:0] Q_instrc, Q_operand); 

	always @ (posedge CLK, posedge RESET) begin 
		
		if(RESET) begin 
			Q_instrc <= 4'b0000;
			Q_operand <= 4'b0000; 
		end 
		else if (ENABLED) begin  
			Q_instrc <= D[7:4];
			Q_operand <= D[3:0]; 
		end 	
	end
endmodule 

// modulo de FLAG 

module FLAG(input wire CLK, carry, zero, ENABLED, RESET, output reg c_flag, z_flag); 

	always @ (posedge CLK, posedge RESET) begin 
		
		if (RESET) begin 
			c_flag <= 1'b0; 
			z_flag <= 1'b0; 
		end 
		else if (ENABLED) begin 
			c_flag <= carry;
			z_flag <= zero; 
		end 
	end
endmodule 

// modulo de FHASE 

module PHASE(input wire CLK, RESET, output reg Q_phase, output wire N_phase); 

	wire valor; 
	
	always @ (posedge CLK, posedge RESET) begin 
		
		if (RESET)
			Q_phase <= 1'b0; 
		else 
			Q_phase <= ~Q_phase; 
	end
	
	assign N_phase = ~(Q_phase); 
endmodule 

// modulo DECODE 

module DECODE(input Q_phase, c_flag, z_flag, input [3:0] instruccion, output [12:0] signal_control);
    
    reg [12:0] cable;
	reg [6:0] localidad; 
	
	always @ (*) begin 
	
		localidad[0] <= Q_phase; 
		localidad[1] <= z_flag; 
		localidad[2] <= c_flag; 
		localidad[6:3] <= instruccion; 
	end 
    
    always @ (localidad)
        casez(localidad)
            // implementacion de la instruccion any
            7'b????_??0: cable <= 13'b1000_000_001000;
            // implementacion de la instruccion JC
            7'b0000_1?1: cable <= 13'b0100_000_001000;
            7'b0000_0?1: cable <= 13'b1000_000_001000;
            // implementacion de la instruccion JNC
            7'b0001_1?1: cable <= 13'b1000_000_001000;
            7'b0001_0?1: cable <= 13'b0100_000_001000;
            // implementacion de la instruccion CMPI
            7'b0010_??1: cable <= 13'b0001_001_000010;
            // implementacion de la instruccion CMPM
            7'b0011_??1: cable <= 13'b1001_001_100000;
            // implementacion de la instruccion LIT
            7'b0100_??1: cable <= 13'b0011_010_000010;
            // implementacion de la instruccion IN
            7'b0101_??1: cable <= 13'b0011_010_000100;
            // implementacion de la instruccion LD
            7'b0110_??1: cable <= 13'b1011_010_100000;
            // implementacion de la instruccion ST
            7'b0111_??1: cable <= 13'b1000_000_111000;
            // implementacion de la instruccion JZ
            7'b1000_?11: cable <= 13'b0100_000_001000;
            7'b1000_?01: cable <= 13'b1000_000_001000;
            // implementacion de la instruccion JNZ
            7'b1001_?11: cable <= 13'b1000_000_001000;
            7'b1001_?01: cable <= 13'b0100_000_001000;
            // implementacion de la instruccion ADDI
            7'b1010_??1: cable <= 13'b0011_011_000010;
            // implementacion de la instruccion ADDM
            7'b1011_??1: cable <= 13'b1011_011_100000;
            // implementacion de la instruccion JMP
            7'b1100_??1: cable <= 13'b0100_000_001000;
            // implementacion de la instruccion OUT
            7'b1101_??1: cable <= 13'b0000_000_001001;
            // implementacion de la instruccion NANDI
            7'b1110_??1: cable <= 13'b0011_100_000010;
            // implementacion de la instruccion NANDM
            7'b1111_??1: cable <= 13'b1011_100_100000;
            default: cable <= 13'b1111111111111;
        endcase
	 
    assign signal_control = cable;
endmodule

// Implementacion de BUFFER TRI-estado 

module BUFFER(input wire ENABLED, input wire [3:0] A, output wire [3:0] Y); 
	 
	assign Y = ENABLED ? A : 4'bz; 
	
endmodule 

// Implementacion del ACUMULADOR

module ACUMULADOR(input wire CLK,  ENABLED, RESET, input wire [3:0] D, output reg [3:0] Q); 

	always @ (posedge CLK, posedge RESET) begin 
		
		if (RESET)
			Q <= 4'b0000;
		else if (ENABLED) 
			Q <= D;
	end
endmodule

// Implementacion del modulo de la ALU 

module ALU(input [3:0] A, B, input [2:0] operacion , output carry, zero, output [3:0] resultado); 

	reg [4:0] proceso; 

	always @ (A, B, operacion) 
	
		case (operacion) 
		
			3'b000 : proceso = A ; 
			3'b001 : proceso = A-B; 
			3'b010 : proceso = B; 
			3'b011 : proceso = A + B; 
			3'b100 : proceso = {1'b0, ~(A & B)}; 
			default : proceso = 5'b10101; 
		endcase
	
	assign resultado = proceso[3:0];
	assign carry = proceso[4]; 
	assign zero = ~(proceso[3] | proceso[2] | proceso[1] | proceso[0] ); 
endmodule

// Implementacion de la memoria RAM de 64x4

module RAM(input csRAM, weRAM, input [11:0] direccion, inout [3:0] datos); 

	reg [3:0] memory [0:4095] ; //memoria ram 64x4
	reg [3:0] salida; 
	
	always @ (csRAM or weRAM or direccion or datos) begin 
		
		if ((csRAM ==1)&&(weRAM ==1)) 
			memory[direccion] <= datos; 
		else if ((csRAM ==1)&&(weRAM ==0))
			salida <= memory[direccion]; 
	end 
	
	assign datos = (csRAM && !weRAM) ? salida : 4'bzzzz;	
endmodule 

// modulo de unificacion de datos para la entrada a la RAM 

module UNIONRAM(input [7:0] datoROM, input [3:0] datoOPERAND, output [11:0] direccionRAM ); 

	reg [11:0] direcRAM; 
	
	always @(*)begin 
		direcRAM [7:0] <= datoROM; 
		direcRAM [11:8] <= datoOPERAND; 
	end 
	
	assign direccionRAM = direcRAM; 
endmodule

// modulo final de interconexion de elementos 

module uP(input clock, reset, input [3:0] pushbuttons, output phase, c_flag, z_flag, output [3:0] instr, oprnd, data_bus, FF_out, accu, output [7:0] program_byte, output [11:0] PC, address_RAM); 
 
wire clock, reset;
wire [3:0] pushbuttons;
wire phase, c_flag, z_flag, NOTphase;
wire [3:0] instr, oprnd, data_bus, FF_out, accu, resulALU;
wire [7:0] program_byte;
wire [11:0] PC, address_RAM;
wire [12:0] control;

UNIONRAM M1(.datoROM(program_byte), .datoOPERAND(oprnd), .direccionRAM(address_RAM)); 

COUNTER M2(.CLK(clock), .RESET(reset), .A(control[11]), .enabled(control[12]), .LOAD(address_RAM), .Y_pc( PC));

ROM M3(.Localidad(PC), .dato(program_byte));

FETCH M4(.CLK(clock), .ENABLED(NOTphase), .RESET(reset), .D(program_byte), .Q_instrc(instr), .Q_operand(oprnd)); 

PHASE M5(.CLK(clock), .RESET(reset), .Q_phase(phase), .N_phase(NOTphase)); 

FLAG M6(.CLK(clock), .carry(carry), .zero(zero), .ENABLED(control[9]), .RESET(reset), .c_flag(c_flag), .z_flag(z_flag)); 

DECODE M7(.Q_phase(phase), .c_flag(c_flag), .z_flag(z_flag), .instruccion(instr), .signal_control(control));

BUFFER M8_oprnd(.ENABLED(control[1]), .A(oprnd), .Y(data_bus)); 

BUFFER M9_pushbottons(.ENABLED(control[2]), .A(pushbuttons), .Y(data_bus)); 

ALU M10(.A(accu), .B(data_bus), .operacion(control[8:6]) , .carry(carry), .zero(zero), .resultado(resulALU)); 

ACUMULADOR M11(.CLK(clock), .ENABLED(control[10]), .RESET(reset), .D(resulALU), .Q(accu)); 

BUFFER M12_alu(.ENABLED(control[3]), .A(resulALU), .Y(data_bus));
 
RAM M13(.csRAM(control[5]), .weRAM(control[4]), .direccion(address_RAM), .datos(data_bus)); 

BUFFER M14_salida(.ENABLED(control[3]), .A(data_bus), .Y(FF_out)); 

endmodule








