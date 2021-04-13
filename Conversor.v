module Conversor(tecla, tipo, CSseg);
	input [3:0] tecla;
	input tipo;
	
	output reg [6:0] CSseg;
	
	parameter [6:0] segmin = 7'b1111110; //-
	parameter [6:0] segplus = 7'b1101100; // +
	parameter [6:0] segdiv = 7'b1011011; // /
	parameter [6:0] segmult = 7'b1001000; // *
	parameter [6:0] seg0 = 7'b0000001; //0
	parameter [6:0] seg1 = 7'b1001111; //1
	parameter [6:0] seg2 = 7'b0010010; //2
	parameter [6:0] seg3 = 7'b0000110; //3
	parameter [6:0] seg4 = 7'b1001100; //4
	parameter [6:0] seg5 = 7'b0100100; //5
	parameter [6:0] seg6 = 7'b0100000; //6
	parameter [6:0] seg7 = 7'b0001111; //7
	parameter [6:0] seg8 = 7'b0000000; //8
	parameter [6:0] seg9 = 7'b0000100; //9
	parameter [6:0] segA = 7'b0001000; //A
	parameter [6:0] segb = 7'b1100000; //b
	parameter [6:0] segC = 7'b0110001; //C
	parameter [6:0] segd = 7'b1000010; //d
	parameter [6:0] segE = 7'b0110000; //E
	parameter [6:0] segF = 7'b0111000; //F
	parameter [6:0] sego = 7'b0000001; //o
	parameter [6:0] segh = 7'b1101000; //h
	parameter [6:0] nul = 7'b1111111; //
	
	
	always @(*)begin
		
		if (tipo == 1)begin // Es un numero
			case(tecla)
				4'b0000: CSseg = seg0;
				4'b0001: CSseg = seg1;
				4'b0010: CSseg = seg2;
				4'b0011: CSseg = seg3;
				4'b0100: CSseg = seg4;
				4'b0101: CSseg = seg5;
				4'b0110: CSseg = seg6;
				4'b0111: CSseg = seg7;
				4'b1000: CSseg = seg8;
				4'b1001: CSseg = seg9;
				4'b1010: CSseg = segA;
				4'b1011: CSseg = segb;
				4'b1100: CSseg = segC;
				4'b1101: CSseg = segd;
				4'b1110: CSseg = segE;
				4'b1111: CSseg = segF;
			endcase
		end else begin // No es un numero
			case(tecla)
				4'b0000: CSseg = segplus;
				4'b0001: CSseg = segmin;
				4'b0010: CSseg = segmult;
				4'b0011: CSseg = segdiv;
				4'b0100: CSseg = sego;
				4'b0101: CSseg = segh;
				default: CSseg = nul;
			endcase
		end
	end
	
endmodule 