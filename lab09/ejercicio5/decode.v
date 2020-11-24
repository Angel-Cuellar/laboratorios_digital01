module DECODE(input [6:0] localidad, output [12:0] señal_control);
    
    reg [12:0] cable;
    
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
        
    assign señal_control = cable;
endmodule
