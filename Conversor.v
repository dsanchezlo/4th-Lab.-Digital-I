module Conversor(tecla, CSseg);
	input [3:0] tecla;
	
	output reg [6:0] CSseg;
	
	parameter segmin = 7'b1111110; //-
	parameter segplus = 7'b1101100; // +
	parameter segdiv = 7'b1011011; // /
	parameter segmult = 7'b1001000; // *
	parameter seg0 = 7'b0000001; //0
	parameter seg1 = 7'b1001111; //1
	parameter seg2 = 7'b0010010; //2
	parameter seg3 = 7'b0000110; //3
	parameter seg4 = 7'b1001100; //4
	parameter seg5 = 7'b0100100; //5
	parameter seg6 = 7'b0100000; //6
	parameter seg7 = 7'b0001111; //7
	parameter seg8 = 7'b0000000; //8
	parameter seg9 = 7'b0000100; //9
	parameter segA = 7'b0001000; //A
	parameter segb = 7'b1100000; //b
	parameter segC = 7'b0110001; //C
	parameter segd = 7'b1000010; //d
	parameter segE = 7'b0110000; //E
	parameter segF = 7'b0111000; //F
	parameter sego = 7'b1100010; //o
	parameter segh = 7'b1101000; //h
	parameter segeq = 7'b1110110; //=
	parameter nul = 7'b1111111; //
	
	always @(*)begin
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
				4'b1010: CSseg = segplus;
				4'b1011: CSseg = segmin;
				4'b1100: CSseg = segmult;
				4'b1101: CSseg = segdiv;
				4'b1110: CSseg = segeq;
				4'b1111: CSseg = nul;
			endcase
	end
	
endmodule
