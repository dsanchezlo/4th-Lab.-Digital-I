module Ssegtobin (Ssegnum1, Ssegnum2, signo1, operador, num1, num2, sig1, oper);
	input [20:0] Ssegnum1;
	input [20:0] Ssegnum2;
	input [6:0] signo1;
	input [6:0] operador;
	output reg [9:0] num1;
	output reg [9:0] num2;
	output reg sig1;
	output reg [1:0] oper;
	
	reg [3:0] digit11;
	reg [3:0] digit12;
	reg [3:0] digit13;
	reg [3:0] digit21;
	reg [3:0] digit22;
	reg [3:0] digit23;
	
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
	parameter [6:0] nul = 7'b1111111; //
	
	initial begin
		
		digit11 = 0;
		digit12 = 0;
		digit13 = 0;
		digit21 = 0;
		digit22 = 0;
		digit23 = 0;
	end
	
	always @(*)begin
		case(Ssegnum1[6:0])
			seg0: digit13 = 'd0;
			seg1: digit13 = 'd1;
			seg2: digit13 = 'd2;
			seg3: digit13 = 'd3;
			seg4: digit13 = 'd4;
			seg5: digit13 = 'd5;
			seg6: digit13 = 'd6;
			seg7: digit13 = 'd7;
			seg8: digit13 = 'd8;
			seg9: digit13 = 'd9;
			default: ;
		endcase
		case(Ssegnum1[13:7])
			seg0: digit12 = 'd0;
			seg1: digit12 = 'd1;
			seg2: digit12 = 'd2;
			seg3: digit12 = 'd3;
			seg4: digit12 = 'd4;
			seg5: digit12 = 'd5;
			seg6: digit12 = 'd6;
			seg7: digit12 = 'd7;
			seg8: digit12 = 'd8;
			seg9: digit12 = 'd9;
			default: ;
		endcase
		case(Ssegnum1[20:14])
			seg0: digit11 = 'd0;
			seg1: digit11 = 'd1;
			seg2: digit11 = 'd2;
			seg3: digit11 = 'd3;
			seg4: digit11 = 'd4;
			seg5: digit11 = 'd5;
			seg6: digit11 = 'd6;
			seg7: digit11 = 'd7;
			seg8: digit11 = 'd8;
			seg9: digit11 = 'd9;
			default: ;
		endcase
		case(Ssegnum2[6:0])
			seg0: digit23 = 'd0;
			seg1: digit23 = 'd1;
			seg2: digit23 = 'd2;
			seg3: digit23 = 'd3;
			seg4: digit23 = 'd4;
			seg5: digit23 = 'd5;
			seg6: digit23 = 'd6;
			seg7: digit23 = 'd7;
			seg8: digit23 = 'd8;
			seg9: digit23 = 'd9;
			default: ;
		endcase
		case(Ssegnum2[13:7])
			seg0: digit22 = 'd0;
			seg1: digit22 = 'd1;
			seg2: digit22 = 'd2;
			seg3: digit22 = 'd3;
			seg4: digit22 = 'd4;
			seg5: digit22 = 'd5;
			seg6: digit22 = 'd6;
			seg7: digit22 = 'd7;
			seg8: digit22 = 'd8;
			seg9: digit22 = 'd9;
			default: ;
		endcase
		case(Ssegnum2[20:14])
			seg0: digit21 = 'd0;
			seg1: digit21 = 'd1;
			seg2: digit21 = 'd2;
			seg3: digit21 = 'd3;
			seg4: digit21 = 'd4;
			seg5: digit21 = 'd5;
			seg6: digit21 = 'd6;
			seg7: digit21 = 'd7;
			seg8: digit21 = 'd8;
			seg9: digit21 = 'd9;
			default: ;
		endcase
		case(operador)
			segplus: oper = 'd0;
			segmin:  oper = 'd1;
			segmult: oper = 'd2;
			segdiv:  oper = 'd3;
			default: ;
		endcase
		sig1 = (signo1 == nul) ? 'd0:'d1;
		
		num1 = digit11 * 'd100 + digit12 * 'd10 + digit13;
		num2 = digit21 * 'd100 + digit22 * 'd10 + digit23;
	end
	
endmodule
