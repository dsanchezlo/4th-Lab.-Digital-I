module Barrido_displays(btn, btnres, CSseg, clk1kHz, dres, signo_resultado, Sseg, anodos, Ssegnum1, Ssegnum2, operador, signo1);
	input btn;
	input btnres;
	input [6:0] CSseg;
	input clk1kHz;
	input [23:0] dres;

	input [1:0] signo_resultado;
	output reg [6:0] Sseg;
	output reg [7:0] anodos;
	output reg [20:0] Ssegnum1;
	output reg [20:0] Ssegnum2;
	output reg [6:0] operador;
	output reg [6:0] signo1;	
	
	//Guardan el valor (En 7seg) que toma cada display
	reg [6:0] Sseg0;
	reg [6:0] Sseg1;
	reg [6:0] Sseg2;
	reg [6:0] Sseg3;
	reg [6:0] Sseg4;
	reg [6:0] Sseg5;
	reg [6:0] Sseg6;
	reg [6:0] Sseg7;
	
	
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
	parameter segeq = 7'b1110110; //=
	parameter nul = 7'b1111111; //
	
	//Recorrer los 8 displays
	reg [2:0]contadorbar;
	
	//El boton se presiono o no?
	reg btnON;
	reg btnresON;
	
	// Estado del botón resultado
	reg estado;
	
	//Guarda la posicion en la que se esta imprimiendo
	reg [2:0]posdisplay;
		

	//Inicializar registros
	initial begin
		contadorbar <= 3'b0;
		Sseg0 <= nul;
		Sseg1 <= nul;
		Sseg2 <= nul;
		Sseg3 <= nul;
		Sseg4 <= nul;
		Sseg5 <= nul;
		Sseg6 <= nul;
		Sseg7 <= nul;
		btnON <= 1'b0;
		btnresON <= 'b0;
		estado <= 'b0;
		posdisplay = 'b0;
	end
	
	always @(posedge clk1kHz) begin
	
		if (btnres == 'b0 && btnresON == 'b0)begin
			estado = ~estado;
			btnresON = 'b1;
		end
		
		if (btnres == 'b1) begin
			btnresON = 'b0;
		end
	
		
		contadorbar = contadorbar + 1'b1;
		case(contadorbar)
			3'b000: begin anodos <= 8'b11111110; Sseg <= Sseg0; end
			3'b001: begin anodos <= 8'b11111101; Sseg <= Sseg1; end
			3'b010: begin anodos <= 8'b11111011; Sseg <= Sseg2; end
			3'b011: begin anodos <= 8'b11110111; Sseg <= Sseg3; end
			3'b100: begin anodos <= 8'b11101111; Sseg <= Sseg4; end
			3'b101: begin anodos <= 8'b11011111; Sseg <= Sseg5; end
			3'b110: begin anodos <= 8'b10111111; Sseg <= Sseg6; end
			3'b111: begin anodos <= 8'b01111111; Sseg <= Sseg7; end
		endcase
		
		if (estado == 0)begin
		
		//Si el boton esta presionado y justo antes de ese momento
		//no estaba presionado
		if (btn == 'b0 && btnON == 'b0)begin
			posdisplay = posdisplay + 'b1;
			btnON = 'b1;
		end
		
		if (btn == 'b1) begin
			btnON = 'b0;
		end
		
		
		case(posdisplay)
			3'b000: Sseg7 = CSseg;
			3'b001: Sseg6 = CSseg;
			3'b010: Sseg5 = CSseg;
			3'b011: Sseg4 = CSseg;
			3'b100: Sseg3 = CSseg;
			3'b101: Sseg2 = CSseg;
			3'b110: Sseg1 = CSseg;
			3'b111: Sseg0 = CSseg;
		endcase 
		
		Ssegnum1 = {Sseg6, Sseg5, Sseg4};
		Ssegnum2 = {Sseg2, Sseg1, Sseg0};
		
		signo1 = Sseg7;
		operador = Sseg3;
		
		end
		
		if (estado == 1) begin
			if(signo_resultado == 2)begin
			

			Sseg0 = 7'b0110001; //r
			Sseg1 = seg0;	//o
			Sseg2 = 7'b0110001;	//r
			Sseg3 = 7'b0110001;	//r
			Sseg4 = 7'b0110000;	//E
			Sseg5 = nul;
			Sseg6 = nul;
			Sseg7 = nul;
			
			end else begin
			
			
			case(dres[3:0])
				4'b0000: Sseg0 = seg0;
				4'b0001: Sseg0 = seg1;
				4'b0010: Sseg0 = seg2;
				4'b0011: Sseg0 = seg3;
				4'b0100: Sseg0 = seg4;
				4'b0101: Sseg0 = seg5;
				4'b0110: Sseg0 = seg6;
				4'b0111: Sseg0 = seg7;
				4'b1000: Sseg0 = seg8;
				4'b1001: Sseg0 = seg9;
				default: Sseg0 = nul;
			endcase
			
			case(dres[7:4])
				4'b0000: Sseg1 = seg0;
				4'b0001: Sseg1 = seg1;
				4'b0010: Sseg1 = seg2;
				4'b0011: Sseg1 = seg3;
				4'b0100: Sseg1 = seg4;
				4'b0101: Sseg1 = seg5;
				4'b0110: Sseg1 = seg6;
				4'b0111: Sseg1 = seg7;
				4'b1000: Sseg1 = seg8;
				4'b1001: Sseg1 = seg9;
				default: Sseg1 = nul;
			endcase
			
			case(dres[11:8])
				4'b0000: Sseg2 = seg0;
				4'b0001: Sseg2 = seg1;
				4'b0010: Sseg2 = seg2;
				4'b0011: Sseg2 = seg3;
				4'b0100: Sseg2 = seg4;
				4'b0101: Sseg2 = seg5;
				4'b0110: Sseg2 = seg6;
				4'b0111: Sseg2 = seg7;
				4'b1000: Sseg2 = seg8;
				4'b1001: Sseg2 = seg9;
				default: Sseg2 = nul;
			endcase
			
			case(dres[15:12])
				4'b0000: Sseg3 = seg0;
				4'b0001: Sseg3 = seg1;
				4'b0010: Sseg3 = seg2;
				4'b0011: Sseg3 = seg3;
				4'b0100: Sseg3 = seg4;
				4'b0101: Sseg3 = seg5;
				4'b0110: Sseg3 = seg6;
				4'b0111: Sseg3 = seg7;
				4'b1000: Sseg3 = seg8;
				4'b1001: Sseg3 = seg9;
				default: Sseg3 = nul;
			endcase
			
			case(dres[19:16])
				4'b0000: Sseg4 = seg0;
				4'b0001: Sseg4 = seg1;
				4'b0010: Sseg4 = seg2;
				4'b0011: Sseg4 = seg3;
				4'b0100: Sseg4 = seg4;
				4'b0101: Sseg4 = seg5;
				4'b0110: Sseg4 = seg6;
				4'b0111: Sseg4 = seg7;
				4'b1000: Sseg4 = seg8;
				4'b1001: Sseg4 = seg9;
				default: Sseg4 = nul;
			endcase
			
			case(dres[23:20])
				4'b0000: Sseg5 = seg0;
				4'b0001: Sseg5 = seg1;
				4'b0010: Sseg5 = seg2;
				4'b0011: Sseg5 = seg3;
				4'b0100: Sseg5 = seg4;
				4'b0101: Sseg5 = seg5;
				4'b0110: Sseg5 = seg6;
				4'b0111: Sseg5 = seg7;
				4'b1000: Sseg5 = seg8;
				4'b1001: Sseg5 = seg9;
				default: Sseg5 = nul;
			endcase
			
			if(signo_resultado == 0) begin
				Sseg6 = nul;
				Sseg7 = nul;
			end else begin 
				Sseg6 = segmin;
				Sseg7 = nul;
			end
			end		
		end
	end

endmodule
